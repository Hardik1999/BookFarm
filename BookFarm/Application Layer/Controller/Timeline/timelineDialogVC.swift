//
//  timelineDialogVC.swift
//  BookFarm
//
//  Created by Hardik on 3/2/20.
//  Copyright © 2020 Mac. All rights reserved.
//

import UIKit

class timelineDialogVC: BaseVC {
    var dialogarr : Timeline!
    @IBOutlet weak var viewdelete: UIView!
    @IBOutlet weak var viewEdit: UIView!
    @IBOutlet weak var heightEdit: NSLayoutConstraint!
    @IBOutlet weak var heightDelete: NSLayoutConstraint!
    override func viewDidLoad() {
        super.viewDidLoad()
        heightEdit.constant = 0
        heightDelete.constant = 0
        viewEdit.isHidden = false
        viewdelete.isHidden = false
        
        if dialogarr.userId == dogetlocaldatauser().userId{
            heightEdit.constant = 40
            heightDelete.constant = 40
        
        }else{
            heightEdit.constant = 0
            heightDelete.constant = 0
            viewEdit.isHidden = true
            viewdelete.isHidden = true
        }

    }
    
    @IBAction func onCLickBackground(_ sender: Any) {
        removeFromParent()
        view.removeFromSuperview()
    }
}
