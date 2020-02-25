//
//  ForgotPasswordVC.swift
//  BookFarm
//
//  Created by Hardik on 2/4/20.
//  Copyright © 2020 Mac. All rights reserved.
//

import UIKit

class ForgotPasswordVC: UIViewController {
    var data = [ForgotPasswordResponse]()
    var forgotResponse = [ForgotPasswordResponse]()
    @IBOutlet weak var tfEmail: UITextField!
    @IBOutlet weak var tfMobile: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    @IBAction func onClickBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func onClickNext(_ sender: Any) {
        doGetForgetPasswordApi()
    }
    func doGetForgetPasswordApi()  {
        let param = ["forgot_password":"forgot_password",
                     "user_email": tfEmail.text!,
                     "user_mobile": tfMobile.text!,
                     "key":ConstantStrings.APIKey]
        let request = AlamofireSingleTon.sharedInstance
        request.requestPost(serviceName: ServiceNameConstants.ForgotPassword, parameters: param) { (json, error) in
            if json != nil{
                do{
                    print(json as Any)
                    let response = try JSONDecoder().decode(ForgotPasswordResponse.self, from: json!)
                    if response.status == 200{
                        let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "idResetPasswordVC")as! ResetPasswordVC
                        nextVC.data = response
                        nextVC.forgotResponse = self.forgotResponse
                        self.navigationController?.pushViewController(nextVC, animated: true)
                    }
                    else{
                        let alertVC = UIAlertController(title: "Validation Error", message: response.message, preferredStyle: .alert)
                        alertVC.addAction(UIAlertAction(title: "ok", style: .cancel, handler: nil))
                            
                            self.present(alertVC, animated: true, completion: nil)                   }
                }catch{
                    print("parse error")
                }
            }else{
                print("error")
            }
        }
    }
    
    
    
    func dovalidate() -> Bool {
        if tfEmail.text! == "" {
            let alertVc = UIAlertController(title: "validation error", message: "Please Fill Data", preferredStyle: .alert)
            alertVc.addAction(UIAlertAction(title: "ok", style: .cancel, handler: nil))
            self.present(alertVc , animated: true, completion: nil)
            return false
        }
        if tfMobile.text! == "" {
            let alertVc = UIAlertController(title: "validation error", message: "Please Fill Data", preferredStyle: .alert)
            alertVc.addAction(UIAlertAction(title: "ok", style: .cancel, handler: nil))
            self.present(alertVc , animated: true, completion: nil)
            return false
        }
        return true
    }
}
