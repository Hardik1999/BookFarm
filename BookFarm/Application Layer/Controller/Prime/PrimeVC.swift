//
//  ChatVC.swift
//  BookFarm
//
//  Created by Mac on 19/12/19.
//  Copyright © 2019 Mac. All rights reserved.
//

import UIKit

class PrimeVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
   
    @IBAction func onClickBook(_ sender: Any) {
        let nextvc = storyboard?.instantiateViewController(withIdentifier: "idPrimebookVC")as! PrimebookVC
        self.navigationController?.pushViewController(nextvc, animated: true)
    }
    @IBAction func onClickEBook(_ sender: Any) {
    }
    @IBAction func onClickVideo(_ sender: Any) {
    }
    @IBAction func onClickAudio(_ sender: Any) {
    }
    @IBAction func onClickBlog(_ sender: Any) {
    }
    @IBAction func onClickTestpaper(_ sender: Any) {
    }
}

