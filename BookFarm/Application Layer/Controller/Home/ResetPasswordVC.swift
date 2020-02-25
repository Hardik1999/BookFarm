//
//  ResetPasswordVC.swift
//  BookFarm
//
//  Created by Hardik on 2/4/20.
//  Copyright © 2020 Mac. All rights reserved.
//

import UIKit

class ResetPasswordVC: UIViewController {
    var data : ForgotPasswordResponse!
     var forgotResponse = [ForgotPasswordResponse]()
    @IBOutlet weak var tfNewPassword: UITextField!
    @IBOutlet weak var tfReEnterPassword: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func onClickBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func onClickDone(_ sender: Any) {
        doPassWordUpdateApi()
    }
    
    func doPassWordUpdateApi() {
        let params = ["reset_password" : "reset_password",
                      "user_password" : tfNewPassword.text!,
                      "user_id" : data.userID!,
                      "key" : "BookFarmAPI", ]
        print("pram",params)
        let request = AlamofireSingleTon.sharedInstance
        request.requestPost(serviceName: ServiceNameConstants.ForgotPassword, parameters: params) { (json, error) in
            if json != nil{
                do{
                    print(json as Any)
                    let response = try JSONDecoder().decode(ForgotPasswordResponse.self, from: json!)
                    
                    if response.status == 200 {
                        do {
                        
                            let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "idloginVC")as! loginVC
                             self.navigationController?.pushViewController(nextVC, animated: true)
                            
                        }
                    }else {
                        
                   let alertVC = UIAlertController(title: "Validation Error", message: response.message, preferredStyle: .alert)
                                          alertVC.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
                                          self.present(alertVC , animated: true, completion: nil)
                        
                    }
                    
                }catch {
                        print("parse error",error.localizedDescription)
                        
                    }
                }else{
                    print(error?.debugDescription,json)
            }
        }
        
        
        
    }
}
