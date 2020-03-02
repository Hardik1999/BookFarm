//
//  EbookSellDetailsVC.swift
//  BookFarm
//
//  Created by Hardik on 2/26/20.
//  Copyright © 2020 Mac. All rights reserved.
//

import UIKit

import MobileCoreServices

class EbookSellDetailsVC: BaseVC {
    var fileUrl : URL!
    @IBOutlet weak var ivEbook: UIImageView!
    @IBOutlet weak var tfEbookName: UITextField!
    @IBOutlet weak var tfEbookWriter: UITextField!
    @IBOutlet weak var tfEbookLanguage: UITextField!
    @IBOutlet weak var tfEbookUrl: UITextField!
    @IBOutlet weak var lblCategory: UILabel!
    @IBOutlet weak var tvEbookDetails: UITextView!
    var selectedimages = [UIImage]()
    var bookcatname = ""
    var Flag : Int!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ivEbook.layer.cornerRadius = ivEbook.frame.width/2
        lblCategory.text = bookcatname
    }
    
    func doAddEbookAPI() {
        let param = [ "ebookregister":"ebookregister",
                      "ebook_name" : tfEbookName.text!,
                      "writer_name" : tfEbookWriter.text!,
                      "ebook_language" : tfEbookLanguage.text!,
                      "ebook_description" : tvEbookDetails.text!,
                      "ebook_url" : tfEbookUrl.text!,
                      "ebook_edition":"80",
                      "milisecondtime":String(Date().milisecondsSince1970),
                      "ebook_category_id":"",
                      "user_id":dogetlocaldatauser().userId!,
                      "profile":convertImageToBase64(imageview: ivEbook),
                      "ebook_category":lblCategory.text!]
//         print(param as Any)
        
        let request = AlamofireSingleTon.sharedInstance
        
        request.requestPost(serviceName: ServiceNameConstants.EbookController, parameters: param) { (Data, error) in
            print(Data as Any)
            if Data != nil {
                do{
                    let response = try JSONDecoder().decode(EbookResponse.self, from: Data!)
                    
                    if response.status == "200"{
                        print(response.message as Any)
                        for nextVC in self.navigationController!.viewControllers as Array{
                            if nextVC.isKind(of: TabBarVC.self){
                                self.navigationController?.popToViewController(nextVC, animated: true)
                                break
                            }
                        }
                    }
                }catch{
                    print("parse error")
                }
            }else{
                print("error")
            }
        }
    }
    
    
    @IBAction func onClickImage(_ sender: Any) {
        Flag = 1
        let alertVC = UIAlertController(title: "", message: "Please Select Document From:", preferredStyle: .actionSheet)
        
        alertVC.addAction(UIAlertAction(title: "Camera", style: .default, handler: { (UIAlertAction) in
            self.btnOpenCamera()
        }))
        alertVC.addAction(UIAlertAction(title: "Gallery", style: .default, handler: { (UIAlertAction) in
            self.btnOpenGallery()
        }))
        alertVC.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (UIAlertAction) in
            alertVC.dismiss(animated: true){
                //        self.navigationController?.popViewController(animated: true)
            }
            //      self.navigationController?.popViewController(animated: true)
        }))
        self.present(alertVC, animated: true, completion: nil)
    }
    @IBAction func onClickChooseFile(_ sender: Any) {
        
        Flag = 2
        let alertVC = UIAlertController(title: "", message: "Please Select Document From:", preferredStyle: .actionSheet)
        
        alertVC.addAction(UIAlertAction(title: "Camera", style: .default, handler: { (UIAlertAction) in
            self.btnOpenCamera()
        }))
        alertVC.addAction(UIAlertAction(title: "Gallery", style: .default, handler: { (UIAlertAction) in
            self.btnOpenGallery()
        }))
        alertVC.addAction(UIAlertAction(title: "File Explorer", style: .default, handler: { (UIAlertAction) in
            self.attachDocument()
        }))
        alertVC.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (UIAlertAction) in
            alertVC.dismiss(animated: true){
                //        self.navigationController?.popViewController(animated: true)
            }
            //      self.navigationController?.popViewController(animated: true)
        }))
        self.present(alertVC, animated: true, completion: nil)
        
    }
    
    func btnOpenCamera() {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.camera) {
            let imagePicker = UIImagePickerController()
            // imagePicker.delegate = self
            imagePicker.sourceType = UIImagePickerController.SourceType.camera
            imagePicker.allowsEditing = true
            self.present(imagePicker, animated: true, completion: nil)
        }
        else
        {
            let alert = UIAlertController(title: "Warning", message: "You don't have camera", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    func btnOpenGallery() {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.photoLibrary){
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.allowsEditing = true
            imagePicker.sourceType = UIImagePickerController.SourceType.photoLibrary
            self.present(imagePicker, animated: true, completion: nil)
        }
        else
        {
            let alert = UIAlertController(title: "Warning", message: "You don't have permission to access gallery.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    private func attachDocument() {
        //    let types = [kUTTypePDF, kUTTypeText, kUTTypeRTF, kUTTypeSpreadsheet,kUTTypePNG]
        let importMenu = UIDocumentPickerViewController(documentTypes: [String(kUTTypePDF),String(kUTTypeText),String(kUTTypeRTF),String(kUTTypeSpreadsheet),String(kUTTypePNG),String(kUTTypeJPEG)], in: .import)
        if #available(iOS 11.0, *) {
            importMenu.allowsMultipleSelection = true
        }
        importMenu.delegate = self
        importMenu.modalPresentationStyle = .formSheet
        present(importMenu, animated: true)
    }
    
    @IBAction func onClickDone(_ sender: Any) {
        doAddEbookAPI()
    }
}

extension EbookSellDetailsVC : UIDocumentPickerDelegate,UINavigationControllerDelegate,UIImagePickerControllerDelegate{
    func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentsAt urls: [URL]) {
        guard let myURL = urls.first else {
            return
        }
        self.fileUrl = myURL
        self.tfEbookUrl.text = "\(myURL)"
    }
    func documentPickerWasCancelled(_ controller: UIDocumentPickerViewController) {
        controller.dismiss(animated: true, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]){
        if Flag == 2{
            picker.dismiss(animated: true, completion: nil)
            guard let selectedImage = info[.originalImage] as? UIImage else {
                print("Image not found!")
                return
            }
            if (picker.sourceType == UIImagePickerController.SourceType.camera) {
                let imgName = UUID().uuidString + ".jpeg"
                let documentDirectory = NSTemporaryDirectory()
                let localPath = documentDirectory.appending(imgName)
                let data = selectedImage.jpegData(compressionQuality: 0)! as NSData
                data.write(toFile: localPath, atomically: true)
                let imageURL = URL.init(fileURLWithPath: localPath)
                self.fileUrl = imageURL
                //      self.tfEbookUrl.text = "\(imageURL)"
            }else{
                let imageURL = info[.imageURL] as! URL
                self.fileUrl = imageURL
                //      self.tfEbookUrl.text = "\(imageURL)"
            }
        }else if Flag == 1{
            picker.dismiss(animated: true, completion: nil)
            guard let selectedImage = info[.originalImage] as? UIImage else {
                print("Image not found!")
                return
            }
            print("jhhahahjhhahahahhajhhahahahhaahha")
            ivEbook.image = selectedImage
            print(selectedImage)
        }
    }
}
