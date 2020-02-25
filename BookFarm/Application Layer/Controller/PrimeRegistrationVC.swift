//
//  PrimeRegistrationVC.swift
//  BookFarm
//
//  Created by Hardik on 2/24/20.
//  Copyright © 2020 Mac. All rights reserved.
//

import UIKit

class PrimeRegistrationVC: UIViewController {
    var onClick : Bool!
    @IBOutlet weak var ivFreeRedio: UIImageView!
    @IBOutlet weak var heightOfOther: NSLayoutConstraint!
    @IBOutlet weak var btnfreePrime: UIButton!
    @IBOutlet weak var ivpaidRedio: UIImageView!
    @IBOutlet weak var viewFreePrime: UIView!
    @IBOutlet weak var heightOfFree: NSLayoutConstraint!
    @IBOutlet weak var viewPaidPrime: UIView!
    @IBOutlet weak var btnPaidPrime: UIButton!
    @IBOutlet weak var otherView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
//        viewFreePrime.isHidden = true
//        viewPaidPrime.isHidden = true
        heightOfOther.constant = 0
        ivFreeRedio.image = UIImage(named: "Redio_on")
        ivpaidRedio.image = UIImage(named: "Redio_off")
        otherView.isHidden = false
    }
    
    
    @IBAction func onClickFreePrime(_ sender: Any) {
        heightOfFree.constant = 30
        heightOfOther.constant = 0
        otherView.isHidden = true
        ivFreeRedio.image = UIImage(named: "Redio_on")
        ivpaidRedio.image = UIImage(named: "Redio_off")
    }
    
    @IBAction func onClickPaidPrime(_ sender: Any) {
        heightOfFree.constant = 0
        heightOfOther.constant = 205
        otherView.isHidden = false
        ivFreeRedio.image = UIImage(named: "Redio_off")
        ivpaidRedio.image = UIImage(named: "Redio_on")
    }
}
