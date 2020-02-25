//
//  SplashVC.swift
//  BookFarm
//
//  Created by Mac on 16/12/19.
//  Copyright © 2019 Mac. All rights reserved.
//

import UIKit

class SplashVC: UIViewController {
    
    @IBOutlet var mainview: UIView!
    @IBOutlet weak var logo: UIImageView!
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
            
            if UserDefaults.standard.bool(forKey: ConstantStrings.isLoggedIn){
                print(ConstantStrings.isLoggedIn)
                let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "idTabBarVC")as! TabBarVC
                self.navigationController?.pushViewController(nextVC, animated: true)
            } else {
                let next2VC = self.storyboard?.instantiateViewController(withIdentifier: "idloginVC")as! loginVC
                self.navigationController?.pushViewController(next2VC, animated: true)
            }
        }
    }
    func SplashViewDidStartLoad(_ : UIView){
        self.indicator.startAnimating()
    }
    func SplashViewDidStopLoad(_ : UIView){
        self.indicator.stopAnimating()
    }
}
