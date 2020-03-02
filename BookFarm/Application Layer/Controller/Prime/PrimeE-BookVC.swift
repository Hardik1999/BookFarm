//
//  PrimeE-BookVC.swift
//  BookFarm
//
//  Created by Hardik on 1/31/20.
//  Copyright © 2020 Mac. All rights reserved.
//

import UIKit

class PrimeE_BookVC: UIViewController {

    @IBOutlet weak var clvEbook: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func onClickBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
}
