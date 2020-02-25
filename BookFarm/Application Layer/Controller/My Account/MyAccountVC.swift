//
//  MyAccountVC.swift
//  BookFarm
//
//  Created by Mac on 19/12/19.
//  Copyright © 2019 Mac. All rights reserved.
//

import UIKit

class MyAccountVC: BaseVC {

    @IBOutlet weak var ivProfile: UIImageView!
    @IBOutlet weak var lblUserName: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
     
    }
    override func viewWillAppear(_ animated: Bool) {
        ivProfile.layer.cornerRadius = ivProfile.frame.width/2
        lblUserName.text = dogetlocaldatauser().userName
        
        utils.setImageFromUrl(imageView: ivProfile, urlString: dogetlocaldatauser().userProfile )
    }
    @IBAction func onClickLogout(_ sender: Any) {
       let alertVC = UIAlertController(title: "LOGOUT!!", message: "please confirm", preferredStyle: .alert)
       alertVC.addAction(UIAlertAction(title: "Ok", style: .destructive, handler: { (UIAlertAction) in

           UserDefaults.standard.set(false, forKey: ConstantStrings.isLoggedIn)

        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "idloginVC") as! loginVC
        //   let appDelegate = UIApplication.shared.delegate as! AppDelegate
          // appDelegate.window?.rootViewController = testController
           let nav : UINavigationController = UINavigationController()
           nav.viewControllers  = [vc]
           nav.isNavigationBarHidden = true
           
           UIApplication.shared.windows.first?.rootViewController = nav
           UIApplication.shared.windows.first?.makeKeyAndVisible()
       }))

       alertVC.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler:{ (UIAlertAction) in
           self.dismiss(animated: true, completion: nil)
       }))
       self.present(alertVC , animated: true, completion: nil)
    }
    
    @IBAction func onClickSetting(_ sender: Any) {
        let nectVC = storyboard?.instantiateViewController(withIdentifier: "idSettingsVC")as! SettingsVC
        self.navigationController?.pushViewController(nectVC, animated: true)
    }
    @IBAction func onClickTimeline(_ sender: Any) {
        let nectVC = storyboard?.instantiateViewController(withIdentifier: "idMyTimelineAccountVC")as! MyTimelineAccountVC
        self.navigationController?.pushViewController(nectVC, animated: true)
    }
}
