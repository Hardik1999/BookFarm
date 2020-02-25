//
//  SellCategoryVC.swift
//  BookFarm
//
//  Created by Hardik on 1/28/20.
//  Copyright © 2020 Mac. All rights reserved.
//

import UIKit

class SellCategoryVC: UIViewController {
    @IBOutlet weak var viewBook: UIView!
    @IBOutlet weak var ViewEBook: UIView!
    @IBOutlet weak var viewAudio: UIView!
    @IBOutlet weak var viewVideo: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
   
        viewBook.roundCorners(corners: .bottomLeft, radius: 70)
        ViewEBook.roundCorners(corners: .bottomLeft, radius: 70)
        viewAudio.roundCorners(corners: .bottomLeft, radius: 70)
        viewVideo.roundCorners(corners: .bottomLeft, radius: 70)
    }
   
    @IBAction func onClickBook(_ sender: Any) {
        let nextVC = storyboard?.instantiateViewController(withIdentifier: "idSellBookVC")as! SellBookVC
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
    @IBAction func onClickEBook(_ sender: Any) {
       }
    @IBAction func onClickAudio(_ sender: Any) {
       }
    @IBAction func onClickVedio(_ sender: Any) {
       }
    
}
