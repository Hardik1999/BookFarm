//
//  loginVC.swift
//  BookFarm
//
//  Created by Mac on 16/12/19.
//  Copyright © 2019 Mac. All rights reserved.
//

import UIKit



class loginVC: BaseVC {
    @IBOutlet weak var tfemail: UITextField!
    @IBOutlet weak var tfpassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }
    
    @IBAction func btnsignup(_ sender: Any) {
        let nextVc = self.storyboard?.instantiateViewController(withIdentifier: "idRegisterVC")as!RegisterVC
        self.navigationController?.pushViewController(nextVc, animated: true)
        
    }
    
    @IBAction func btnfp(_ sender: Any) {
        let nextVc = self.storyboard?.instantiateViewController(withIdentifier: "idForgotPasswordVC")as!ForgotPasswordVC
               self.navigationController?.pushViewController(nextVc, animated: true)
    }
    @IBAction func btnsignin(_ sender: Any) {
        if dovalidate(){
            doCallLoginAPI()
        }
    }
    func doCallLoginAPI(){
        
        
        let params = ["login": "login",
                      "key": ConstantStrings.APIKey,
                      
                      "user_email":tfemail.text!,
                      "user_password":tfpassword.text!
            
        ]
        
        print("param" , params)
        
        let request = AlamofireSingleTon.sharedInstance
        print("hardik")
        request.requestPost(serviceName: ServiceNameConstants.loginController, parameters: params) { (json, error) in
            
            if json != nil {
               do {
                                print(json as Any)
                                let response = try JSONDecoder().decode(LoginResponse.self, from:json!)
                                if response.status == 200 {
//                                    self.toast(message: "Login Success", type: 0)
                                   
                                    UserDefaults.standard.set(true, forKey: ConstantStrings.isLoggedIn)
                                    
                                    if let encoded = try? JSONEncoder().encode(response){
                                        UserDefaults.standard.set(encoded, forKey: ConstantStrings.LoginDone)
                                    }
                                    let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "idTabBarVC")as! TabBarVC
                                   
                                    self.navigationController?.pushViewController(nextVC, animated: true)
                                }else {
                                    print(response.message!)
                                    UserDefaults.standard.set(false, forKey: ConstantStrings.isLoggedIn)
                                    let alertVC = UIAlertController(title: "Validation Error", message: response.message, preferredStyle: .alert)
                                    alertVC.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
                                    self.present(alertVC , animated: true, completion: nil)
                                }
                            } catch {
                                print("parse error",error as Any)
                                
                            }
                        }else{
                            print(error!,json)
                        }
                    }
                }
                
    func dovalidate() -> Bool {
        if tfemail.text! == "" {
            let alertVc = UIAlertController(title: "validation error", message: "Please Fill Data", preferredStyle: .alert)
            alertVc.addAction(UIAlertAction(title: "ok", style: .cancel, handler: nil))
            self.present(alertVc , animated: true, completion: nil)
            return false
        }
        if tfpassword.text! == "" {
            let alertVc = UIAlertController(title: "validation error", message: "Please Fill Data", preferredStyle: .alert)
            alertVc.addAction(UIAlertAction(title: "ok", style: .cancel, handler: nil))
            self.present(alertVc , animated: true, completion: nil)
            return false
        }
        return true
    }
    
}
