//
//  MyStoreVC.swift
//  BookFarm
//
//  Created by Hardik on 1/25/20.
//  Copyright © 2020 Mac. All rights reserved.
//

import UIKit
import XLPagerTabStrip

class MyStoreVC: ButtonBarPagerTabStripViewController {

    override func viewDidLoad() {
        design()
        super.viewDidLoad()

        
    }
    
    override func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
        let MyBook = storyboard?.instantiateViewController(withIdentifier: "idMyBookVC")as! MyBookVC
        let lunguage = storyboard?.instantiateViewController(withIdentifier: "idLanguageWiseBookVC")as! LanguageWiseBookVC
        return[MyBook,lunguage]
    }
    
    func design()  {
         settings.style.buttonBarBackgroundColor = #colorLiteral(red: 0.1254901961, green: 0.4509803922, blue: 0.4117647059, alpha: 1)
         settings.style.buttonBarItemBackgroundColor = .clear
         settings.style.selectedBarBackgroundColor = .black
         settings.style.selectedBarHeight = 1.0
         settings.style.buttonBarMinimumLineSpacing = 0
         settings.style.buttonBarItemTitleColor = .black
         settings.style.buttonBarItemsShouldFillAvailableWidth = true
         
         changeCurrentIndexProgressive = {(oldCell: ButtonBarViewCell?, newCell: ButtonBarViewCell?, progressPercentage: CGFloat, changeCurrentIndex: Bool, animated: Bool) -> Void in
             guard changeCurrentIndex == true else { return }
             oldCell?.label.textColor =  UIColor.black
             newCell?.label.textColor = UIColor.white
             
         }
    }
    
}



