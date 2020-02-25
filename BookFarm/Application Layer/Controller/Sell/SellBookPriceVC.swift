//
//  BuyBookVC.swift
//  BookFarm
//
//  Created by Hardik on 1/30/20.
//  Copyright © 2020 Mac. All rights reserved.
//

import UIKit

class SellBookPriceVC: BaseVC {
    var bookName = ""
    var bookAuthorName = ""
    var booklanguage = ""
    var bookDescription = ""
    var bookEdition = ""
    var bookCatID = ""
    var bookcatname = ""
    var selectedimages = [UIImage]()
    @IBOutlet weak var tfSellPrice: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    @IBAction func onClickBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func onClickAdd(_ sender: Any) {
        doBookRegistrationsellApi()
    }
    
    func doBookRegistrationsellApi()  {
        let param = ["bookRegistration":"bookRegistration",
                     "book_name":bookName,
                     "author_name":bookAuthorName,
                     "book_edition":bookEdition,
                     "book_category":bookcatname,
                     "sell_price":tfSellPrice.text!,
                     "book_description":bookDescription,
                     "user_id":dogetlocaldatauser().userId!,
                     "pickpup_latitude":"",
                     "pickpup_longitude":"",
                     "rent_price":"",
                     "book_pickup_Location":"",
                     "book_category_id":bookCatID,
                     "addedby_flag":"0",
                     "book_language":booklanguage
        ]
        
        let request = AlamofireSingleTon.sharedInstance
        request.requestPostMultipart(serviceName: ServiceNameConstants.BookRegister, parameters: param, imagesArray: selectedimages, compression: 0,paramName:"photo[]") { (Data, Err) in
            if Data != nil{
                do{
                    let response = try JSONDecoder().decode(CommonResponse.self, from: Data!)
                    if response.status == "200"{
                        print(response.message!)
                        for nextVC in self.navigationController!.viewControllers as Array{
                            if nextVC.isKind(of: HomeVC.self){
                                self.navigationController?.popToViewController(nextVC, animated: true)
                                break
                            }
                        }
                    }else{
                        
                    }
                }catch{
                    print("parse error",error as Any)
                }
            }else{
                print("error!",Err as Any)
            }
        }
    }
}