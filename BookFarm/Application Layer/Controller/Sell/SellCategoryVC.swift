//
//  SellCategoryVC.swift
//  BookFarm
//
//  Created by Hardik on 1/28/20.
//  Copyright © 2020 Mac. All rights reserved.
//

import UIKit

class SellCategoryVC: BaseVC {
    @IBOutlet weak var viewBook: UIView!
    @IBOutlet weak var ViewEBook: UIView!
    @IBOutlet weak var viewAudio: UIView!
    @IBOutlet weak var viewVideo: UIView!
    @IBOutlet weak var viewBlog: UIView!
    @IBOutlet weak var viewTesepaper: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
   
        viewBook.roundCorners(corners: .bottomLeft, radius: 70)
        ViewEBook.roundCorners(corners: .bottomLeft, radius: 70)
        viewAudio.roundCorners(corners: .bottomLeft, radius: 70)
        viewVideo.roundCorners(corners: .bottomLeft, radius: 70)
        viewBlog.roundCorners(corners: .bottomLeft, radius: 70)
        viewTesepaper.roundCorners(corners: .bottomLeft, radius: 70)
    }
   
    @IBAction func onClickBook(_ sender: Any) {
        let nextVC = storyboard?.instantiateViewController(withIdentifier: "idSellBookVC")as! SellBookVC
        nextVC.flag = 1
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
    @IBAction func onClickEBook(_ sender: Any) {
        
        if dogetlocaldatauser().userPremiumStatus == "1"{
        let nextVC = storyboard?.instantiateViewController(withIdentifier: "idSellBookVC")as! SellBookVC
        nextVC.flag = 2
               self.navigationController?.pushViewController(nextVC, animated: true)
        }else {
            let nextVC = storyboard?.instantiateViewController(withIdentifier: "id PrimeRegistrationVC")as! PrimeRegistrationVC
                  
            self.navigationController?.pushViewController(nextVC, animated: true)
            
        }
    }
    @IBAction func onClickAudio(_ sender: Any) {
        let nextVC = storyboard?.instantiateViewController(withIdentifier: "id PrimeRegistrationVC")as! PrimeRegistrationVC
                         
                   self.navigationController?.pushViewController(nextVC, animated: true)
       }
    @IBAction func onClickVedio(_ sender: Any) {
        let nextVC = storyboard?.instantiateViewController(withIdentifier: "id PrimeRegistrationVC")as! PrimeRegistrationVC
                         
                   self.navigationController?.pushViewController(nextVC, animated: true)
       }
    
    @IBAction func onClicktestpaper(_ sender: Any) {
        let nextVC = storyboard?.instantiateViewController(withIdentifier: "id PrimeRegistrationVC")as! PrimeRegistrationVC
                         
                   self.navigationController?.pushViewController(nextVC, animated: true)
    }
    @IBAction func onClickBlog(_ sender: Any) {
        let nextVC = storyboard?.instantiateViewController(withIdentifier: "id PrimeRegistrationVC")as! PrimeRegistrationVC
                         
                   self.navigationController?.pushViewController(nextVC, animated: true)
    }
}
