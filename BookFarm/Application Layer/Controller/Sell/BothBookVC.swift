//
//  BothBookVC.swift
//  BookFarm
//
//  Created by Hardik on 1/30/20.
//  Copyright © 2020 Mac. All rights reserved.
//

import UIKit

class BothBookVC: BaseVC {
    var bookCatID = ""
    var bookName = ""
    var bookAuthorName = ""
    var booklanguage = ""
    var bookDescription = ""
    var bookEdition = ""
    var bookcatname = ""
    var selectedimages = [UIImage]()
    var flag = 0
    @IBOutlet weak var tfSellPrice: UITextField!
    @IBOutlet weak var tfRentPrice: UITextField!
    @IBOutlet weak var ViewRedio: UIView!
    @IBOutlet weak var heigthOfView: NSLayoutConstraint!
    @IBOutlet weak var ivRedio: UIImageView!
    @IBOutlet weak var ivRedioPrime: UIImageView!
    @IBOutlet weak var viewNonPrime: UIView!
    @IBOutlet weak var viewPrime: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if dogetlocaldatauser().userPremiumStatus == "1"{
            ViewRedio.isHidden = false
            heigthOfView.constant = 80
            flag = 0
            ivRedio.image = UIImage(named: "Redio_on")
            ivRedioPrime.image = UIImage(named: "Redio_off")
            viewPrime.alpha = 0.5
            viewNonPrime.alpha = 1
        }else if dogetlocaldatauser().userPremiumStatus == "0"{
            ViewRedio.isHidden = true
            heigthOfView.constant = 0
        }
        
    }
    @IBAction func onClickNonPrime(_ sender: Any) {
        flag = 0
        viewPrime.alpha = 0.5
        ivRedio.image = UIImage(named: "Redio_on")
        ivRedioPrime.image = UIImage(named: "Redio_off")
        viewNonPrime.alpha = 1
    }
    @IBAction func onClickPrime(_ sender: Any) {
        flag = 1
        viewNonPrime.alpha = 0.5
        ivRedio.image = UIImage(named: "Redio_off")
        ivRedioPrime.image = UIImage(named: "Redio_on")
        viewPrime.alpha = 1
        
    }
    
    @IBAction func onClickBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func btnDone(_ sender: UIButton) {
        doBookRegistrationApi()
    }
    func doBookRegistrationApi()  {
        let param = ["bookRegistration":"bookRegistration",
                     "book_name":bookName,
                     "author_name":bookAuthorName,
                     "book_edition":bookEdition,
                     "book_category":bookcatname,
                     "sell_price":tfSellPrice.text!,
                     "book_description":bookDescription,
                     "user_id":dogetlocaldatauser().userId!,
                     "rent_price":tfRentPrice.text!,
                     "pickpup_latitude":"",
                     "pickpup_longitude":"",
                     "book_pickup_Location":"",
                     "book_category_id":bookCatID,
                     "addedby_flag":"0",
                     "book_language":booklanguage,
                     "book_is_prime": String(flag) ]
        
        let request = AlamofireSingleTon.sharedInstance
        request.requestPostMultipart(serviceName: ServiceNameConstants.BookRegister, parameters: param, imagesArray: selectedimages, compression: 0,paramName:"photo[]") { (Data, Err) in
            if Data != nil{
                do{
                    let response = try JSONDecoder().decode(CommonResponse.self, from: Data!)
                    if response.status == "200"{
                        print(response.message!)
                        
                        for nextVC in self.navigationController!.viewControllers as Array{
                            if nextVC.isKind(of: TabBarVC.self){
                                
                                print("true..." as Any)
                                self.navigationController?.popToViewController(nextVC, animated: true)
                                
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
