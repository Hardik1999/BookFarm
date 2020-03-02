//
//  TabBarVC.swift
//  BookFarm
//
//  Created by Mac on 19/12/19.
//  Copyright © 2019 Mac. All rights reserved.
//

import UIKit

class TabBarVC: BaseVC {
    
    @IBOutlet  var imgtabbar: [UIImageView]!
    @IBOutlet  var lbltabbar: [UILabel]!
    @IBOutlet  var btntabbar: [UIButton]!
    var selectedindex = 0
    var homeViewController: UIViewController!
    var chatViewController: UIViewController!
    var sellBookViewController: UIViewController!
    var MyStoreViewController: UIViewController!
    var myAccountViewController: UIViewController!
    var ViewController: [UIViewController]!
    @IBOutlet weak var MainView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        print(dogetlocaldatauser())
        homeViewController = self.storyboard?.instantiateViewController(withIdentifier: "idHomeVC")as! HomeVC
        if dogetlocaldatauser().userPremiumStatus == "1"{
        chatViewController = self.storyboard?.instantiateViewController(withIdentifier: "idPrimeVC")as! PrimeVC
        }else{
            chatViewController = self.storyboard?.instantiateViewController(withIdentifier: "id PrimeRegistrationVC")as! PrimeRegistrationVC
        }
        sellBookViewController = self.storyboard?.instantiateViewController(withIdentifier: "idSellCategoryVC")as! SellCategoryVC
        MyStoreViewController = self.storyboard?.instantiateViewController(withIdentifier: "idMyStoreVC")as! MyStoreVC
        myAccountViewController = self.storyboard?.instantiateViewController(withIdentifier: "idMyAccountVC")as! MyAccountVC
        
        ViewController = [homeViewController,chatViewController,sellBookViewController,MyStoreViewController,myAccountViewController]
        
        
        // btntabbar[selectedindex].isSelected = true
        btntabbarClicked(btntabbar[selectedindex])
        
        
        
        
    }
    
    @IBAction func btntabbarClicked(_ sender: UIButton) {
        let previousIndex = selectedindex
        
        selectedindex = sender.tag
        // btntabbar[previousIndex].isSelected = false
        let previousVC = ViewController[previousIndex]
        previousVC.willMove(toParent: nil)
        previousVC.view.removeFromSuperview()
        previousVC.removeFromParent()
        // sender.isSelected = true
        let vc = ViewController[selectedindex]
        addChild(vc)
        vc.view.frame = MainView.bounds
        MainView.addSubview(vc.view)
        vc.didMove(toParent: self)
        
        lbltabbar[previousIndex].textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        lbltabbar[selectedindex].textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
        imgtabbar[previousIndex].tintColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        imgtabbar[previousIndex].image = imgtabbar[previousIndex].image?.withRenderingMode(.alwaysTemplate)
        imgtabbar[selectedindex].tintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        imgtabbar[selectedindex].image = imgtabbar[selectedindex].image?.withRenderingMode(.alwaysTemplate)
        
        
        selectedindex = sender.tag
    }
}
