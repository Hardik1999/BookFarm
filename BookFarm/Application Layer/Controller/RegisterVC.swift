//
//  RegisterVC.swift
//  BookFarm
//
//  Created by Mac on 16/12/19.
//  Copyright © 2019 Mac. All rights reserved.
//

import UIKit
struct RegistrationResponse: Codable {
    let userID: String!
    let message: String!
    let status: Int!

    enum CodingKeys: String, CodingKey {
        case userID = "user_id"
        case message = "message"
        case status = "status"
    }
}

class RegisterVC: UIViewController {
    
    @IBOutlet weak var tfname: UITextField!
    @IBOutlet weak var tfemail: UITextField!
    @IBOutlet weak var tfpassword: UITextField!
    @IBOutlet weak var tfmobileno: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    @IBAction func onClickBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func btngoogle(_ sender: Any) {
    }
    @IBAction func btnfacebook(_ sender: Any) {
    }
    @IBAction func btnsignup(_ sender: Any) {
     if   dovalidate(){
            doCallRegistrationAPI()
        let nextVC = storyboard?.instantiateViewController(withIdentifier: "idloginVC")as! loginVC
        self.navigationController?.pushViewController(nextVC, animated: true)
        }
        
            
        
    }
    func doCallRegistrationAPI(){
           
       
           let params = ["user_insert":"1",
                         "user_name":tfname.text!,
                         "user_email":tfemail.text!,
                         "user_password":tfpassword.text!,
                         "user_mobile":tfmobileno.text!,
                         "profile":"",
                         "milisecondtime":"" ]
           
           print("param" , params)

           let request = AlamofireSingleTon.sharedInstance
           
           request.requestPost(serviceName: ServiceNameConstants.registrationController, parameters: params) { (json, error) in
               
               if json != nil {
                   do {
                       print(json as Any)
                       let response = try JSONDecoder().decode(RegistrationResponse.self, from:json!)
                       
                       if response.status == 200 {
                           do {
                               let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "idloginVC")as! loginVC
                               self.navigationController?.pushViewController(nextVC, animated: true)
                               
                           }
                           
                       }else {

                       }
                   } catch {
                       print("parse error")
                       
                   }
               }else{
                   print("error",json)
               }
           }
         
           
       }
    
    
    func dovalidate() -> Bool {
        if tfname.text == ""{
            let alertVc = UIAlertController(title: "validation error", message: "please fill data", preferredStyle: .alert)
            alertVc.addAction(UIAlertAction(title: "ok", style: .cancel, handler: nil))
             self.present(alertVc , animated: true, completion: nil)
                       return false
        }
        if tfemail.text == ""{
            let alertVc = UIAlertController(title: "validation error", message: "please fill data", preferredStyle: .alert)
            alertVc.addAction(UIAlertAction(title: "ok", style: .cancel, handler: nil))
            self.present(alertVc , animated: true, completion: nil)
                       return false
        }
        if tfmobileno.text == ""{
            let alertVc = UIAlertController(title: "validation error", message: "please fill data", preferredStyle: .alert)
            alertVc.addAction(UIAlertAction(title: "ok", style: .cancel, handler: nil))
            self.present(alertVc , animated: true, completion: nil)
                       return false
        }
        if tfpassword.text == ""{
            let alertVc = UIAlertController(title: "validation error", message: "please fill data", preferredStyle: .alert)
            alertVc.addAction(UIAlertAction(title: "ok", style: .cancel, handler: nil))
            self.present(alertVc , animated: true, completion: nil)
                       return false
        }
        return true
    }
}
