//
//  SellDetailsVC.swift
//  BookFarm
//
//  Created by Mac on 07/01/20.
//  Copyright © 2020 Mac. All rights reserved.
//

import UIKit

class SellDetailsVC: UIViewController {
    var bookCatID = ""
    var bookList : Book!
    var bookcatname = ""
    @IBOutlet weak var tfBookName: UITextField!
    @IBOutlet weak var tfBookAuthor: UITextField!
    @IBOutlet weak var tfBookLanguage: UITextField!
    @IBOutlet weak var tfBookMRP: UITextField!
    @IBOutlet weak var tvDetails: UITextView!
    @IBOutlet weak var tfBookEdition: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tfBookMRP.text! = bookcatname
    }
    
    @IBAction func onClickBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func onClickNext(_ sender: Any) {
        let nextVC = storyboard?.instantiateViewController(withIdentifier: "idBookProfileVC")as! BookProfileVC
        nextVC.bookName = tfBookName.text!
        nextVC.bookAuthorName = tfBookAuthor.text!
        nextVC.bookDescription = tvDetails.text!
        nextVC.bookEdition = tfBookEdition.text!
        nextVC.booklanguage = tfBookLanguage.text!
        nextVC.bookCatID = bookCatID
        
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
    
    func dovalidate() -> Bool {
    
        if tfBookName.text == ""{
            let alertVC = UIAlertController(title: "Validation Error", message: "Enter Book Name", preferredStyle: .alert)
            alertVC.addAction(UIAlertAction(title: "ok", style: .cancel, handler: nil))
            self.present(alertVC , animated: true ,completion: nil)
            return false
    }
        if tfBookAuthor.text == ""{
                   let alertVC = UIAlertController(title: "Validation Error", message: "Enter Book Author name", preferredStyle: .alert)
                   alertVC.addAction(UIAlertAction(title: "ok", style: .cancel, handler: nil))
                   self.present(alertVC , animated: true ,completion: nil)
                   return false
           }
        if tfBookLanguage.text == ""{
                   let alertVC = UIAlertController(title: "Validation Error", message: "Enter Book launguage", preferredStyle: .alert)
                   alertVC.addAction(UIAlertAction(title: "ok", style: .cancel, handler: nil))
                   self.present(alertVC , animated: true ,completion: nil)
                   return false
           }
        if tfBookMRP.text == ""{
                   let alertVC = UIAlertController(title: "Validation Error", message: "Enter Book category", preferredStyle: .alert)
                   alertVC.addAction(UIAlertAction(title: "ok", style: .cancel, handler: nil))
                   self.present(alertVC , animated: true ,completion: nil)
                   return false
           }
        if tfBookEdition.text == ""{
                   let alertVC = UIAlertController(title: "Validation Error", message: "Enter Book edition", preferredStyle: .alert)
                   alertVC.addAction(UIAlertAction(title: "ok", style: .cancel, handler: nil))
                   self.present(alertVC , animated: true ,completion: nil)
                   return false
           }
        return true
    }
}
