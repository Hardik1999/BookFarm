//
//  ViewVC.swift
//  BookFarm
//
//  Created by Hardik on 2/24/20.
//  Copyright © 2020 Mac. All rights reserved.
//

import UIKit

class ViewVC: UIViewController {
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    @IBAction func onClickCancel(_ sender: Any) {
        removeFromParent()
        view.removeFromSuperview()
    }
    @IBAction func onClickOk(_ sender: Any) {
        for nextVC in self.navigationController!.viewControllers as Array{
            if nextVC.isKind(of: TabBarVC.self){
                
                print("true..." as Any)
                self.navigationController?.popToViewController(nextVC, animated: true)
                
            }
        }
    }
    
}
