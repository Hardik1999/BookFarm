//
//  SettingsVC.swift
//  BookFarm
//
//  Created by Hardik on 2/3/20.
//  Copyright © 2020 Mac. All rights reserved.
//

import UIKit
import YPImagePicker

class SettingsVC: BaseVC {
    @IBOutlet weak var tfUserName: UITextField!
    @IBOutlet weak var imgProfile: UIImageView!
    @IBOutlet weak var tfUserEmail: UITextField!
    @IBOutlet weak var tfMobileno: UITextField!
    @IBOutlet weak var tfPassword: UITextField!
    var profileimages = [UIImage]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
    override func viewWillAppear(_ animated: Bool) {
        tfMobileno.text = dogetlocaldatauser().userMobile
        tfUserName.text = dogetlocaldatauser().userName
        tfUserEmail.text = dogetlocaldatauser().userEmail
        
        utils.setImageFromUrl(imageView: imgProfile, urlString: dogetlocaldatauser().userProfile)
        imgProfile.layer.cornerRadius = imgProfile.frame.width/2
        
    }
    
    @IBAction func onClickProfile(_ sender: Any) {
        let alert = UIAlertController(title: "Choose Image", message: nil, preferredStyle: .actionSheet)
               alert.addAction(UIAlertAction(title: "Camera", style: .default, handler: { _ in
                   self.openCamera()
               }))
               
               alert.addAction(UIAlertAction(title: "Gallery", style: .default, handler: { _ in
                   self.openGallery()
               }))
               
               alert.addAction(UIAlertAction.init(title: "Cancel", style: .cancel, handler: nil))
               
               self.present(alert, animated: true, completion: nil)

        
    }
    
    func openCamera()
    {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.camera) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = UIImagePickerController.SourceType.camera
            imagePicker.allowsEditing = true
            self.present(imagePicker, animated: true, completion: nil)
        }
        else
        {
            let alert  = UIAlertController(title: "Warning", message: "You don't have camera", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    
    // open gallery on action sheet called
    func openGallery()
    {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.photoLibrary){
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.allowsEditing = true
            imagePicker.sourceType = UIImagePickerController.SourceType.photoLibrary
            self.present(imagePicker, animated: true, completion: nil)
        }
        else
        {
            let alert  = UIAlertController(title: "Warning", message: "You don't have permission to access gallery.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    func doUpdateApi(){
            
            let params = ["user_id_update":"1",
                          "user_id":dogetlocaldatauser().userId!,
                          "user_name":tfUserName.text!,
                          "user_email":tfUserEmail.text!,
                          "user_mobile":tfMobileno.text!,
                          "user_password":tfPassword.text!,
                          "profile":convertImageToBase64(imageview: imgProfile),
                          "milisecondtime":String(Date().milisecondsSince1970)]
                          print("param" , params)
            
            let request = AlamofireSingleTon.sharedInstance
            
            request.requestPost(serviceName: ServiceNameConstants.UpdateProfile, parameters: params)
            { (json, error) in
                
                if json != nil {
                    do {
                        print(json as Any)
                        let response = try JSONDecoder().decode(LoginResponse.self, from:json!)

                        if response.status == 200 {
                            do {
                                if let encoded = try? JSONEncoder().encode(response){
                                    UserDefaults.standard.set(encoded, forKey: ConstantStrings.LoginDone)
                                }
                                self.navigationController?.popViewController(animated: true)

                            }

                        }else {

                        }
                    } catch {
                        print("parse error",error)
                        
                    }
                }else{
                    print(error as Any ,json as Any)
                }
            }
        }
        
    @IBAction func onClickBack(sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
     
    }
    
   
    @IBAction func onClickSave(sender: UIButton) {
        doUpdateApi()
    }
}
extension SettingsVC : UIImagePickerControllerDelegate,UINavigationControllerDelegate{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]){
        picker.dismiss(animated: true, completion: nil)
        guard let selectedImage = info[.originalImage] as? UIImage else {
            print("Image not found!")
            return
        }
        imgProfile.image = selectedImage
    }
}

