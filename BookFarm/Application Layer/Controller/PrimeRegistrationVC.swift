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
    @IBOutlet weak var lbl1: UILabel!
    @IBOutlet weak var lbl2: UILabel!
    @IBOutlet weak var lbl3: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
//        viewFreePrime.isHidden = true
//        viewPaidPrime.isHidden = true
        heightOfOther.constant = 0
        ivFreeRedio.image = UIImage(named: "Redio_on")
        ivpaidRedio.image = UIImage(named: "Redio_off")
        otherView.isHidden = false
        
        lbl1.text = "Join Prime at " + "\u{20B9}" + "129 Per Month"
        lbl2.text = "Join 3 Month of Prime at " + " \u{20B9}" + "329"
        lbl3.text = "Join Prime at " + " \u{20B9}" + "999 Per Year"
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(handleGesture))
               swipeRight.direction = .right
               self.view.addGestureRecognizer(swipeRight)
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
    
    @IBAction func onClickPayment(_ sender: Any) {
        let nextvc = storyboard?.instantiateViewController(withIdentifier: "idPaymentVC")as! PaymentVC
        self.navigationController?.pushViewController(nextvc, animated: true)
        
    }
    
    @IBAction func onClickFreePrime(_ sender: Any) {
        heightOfFree.constant = 40
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
