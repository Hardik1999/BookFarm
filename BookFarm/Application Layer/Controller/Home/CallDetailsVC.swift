//
//  CallDetailsVC.swift
//  BookFarm
//
//  Created by Hardik on 2/6/20.
//  Copyright © 2020 Mac. All rights reserved.
//

import UIKit

class CallDetailsVC: UIViewController {
    @IBOutlet weak var MainView: UIView!
    @IBOutlet weak var lblBookOwnerName: UILabel!
     @IBOutlet weak var lblBookOwnerEmail: UILabel!
     @IBOutlet weak var lblBookOwnerNumber: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
    
    @IBAction func onClickCancel(_ sender: Any) {
        removeFromParent()
        view.removeFromSuperview()
    }
    
}
