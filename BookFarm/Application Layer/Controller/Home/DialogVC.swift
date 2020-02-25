//
//  DialogVC.swift
//  BookFarm
//
//  Created by Hardik on 2/6/20.
//  Copyright © 2020 Mac. All rights reserved.
//

import UIKit

class DialogVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
    @IBAction func onClickCancel(_ sender: Any) {
        removeFromParent()
               view.removeFromSuperview()
        }
    
    @IBAction func onClickCall(_ sender: Any) {
        callDailog()
    }
    @IBAction func onClickChat(_ sender: Any) {
        let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "idChatVC")as! ChatVC
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
    
    func callDailog(){
        let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "idCallDetailsVC")as! CallDetailsVC
        nextVC.view.backgroundColor = UIColor.black.withAlphaComponent(0.7)
        addChild(nextVC)
        view.addSubview(nextVC.view)
    }
}
