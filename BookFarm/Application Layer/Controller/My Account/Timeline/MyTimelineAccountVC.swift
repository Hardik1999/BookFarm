//
//  MyTimelineAccountVC.swift
//  BookFarm
//
//  Created by Hardik on 2/21/20.
//  Copyright © 2020 Mac. All rights reserved.
//

import UIKit
import XLPagerTabStrip

class MyTimelineAccountVC: ButtonBarPagerTabStripViewController {

    @IBOutlet weak var ivProfile: UIImageView!
    @IBOutlet weak var lblname: UILabel!
    @IBOutlet weak var lblemail: UILabel!
    
    let Data = BaseVC()
    override func viewDidLoad() {
        designForPager()
        super.viewDidLoad()
        
        ivProfile.image = UIImage(named: Data.dogetlocaldatauser().userProfile)
        lblname.text = Data.dogetlocaldatauser().userName
        lblemail.text = Data.dogetlocaldatauser().userEmail
        
        ivProfile.layer.cornerRadius = ivProfile.frame.width/2
         
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(handleGesture))
                      swipeRight.direction = .right
                      self.view.addGestureRecognizer(swipeRight)
    }
    func designForPager() {
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
    
           @objc func handleGesture(gesture: UISwipeGestureRecognizer) -> Void {
               if gesture.direction == .right {
                   for nextVC in self.navigationController!.viewControllers as Array{
                       if nextVC.isKind(of: TabBarVC.self){
                           self.navigationController?.popToViewController(nextVC, animated: true)
                           break
                       }
                   }
               }
           }
    
    override func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
        let nextVC = storyboard?.instantiateViewController(withIdentifier: "idMyTimelineVC") as! MyTimelineVC
        let vc = storyboard?.instantiateViewController(withIdentifier: "idMyFavoriteTimelineVC") as! MyFavoriteTimelineVC
        
        return [nextVC,vc]
    }
    
    override func viewWillAppear(_ animated: Bool) {
       reloadPagerTabStripView()
    }

    @IBAction func onClickEdit(_ sender: Any) {
    }
}
