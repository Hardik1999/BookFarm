//
//  SellTypeVC.swift
//  BookFarm
//
//  Created by Hardik on 1/30/20.
//  Copyright © 2020 Mac. All rights reserved.
//

import UIKit

class SellTypeVC: UIViewController {
    var bookName = ""
    var bookAuthorName = ""
    var booklanguage = ""
    var bookDescription = ""
    var bookEdition = ""
    var bookCatID = ""
    var bookcatname = ""
    var selectedimages = [UIImage]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(handleGesture))
        swipeRight.direction = .right
        self.view.addGestureRecognizer(swipeRight)
        // Do any additional setup after loading the view.
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
    
    @IBAction func onClickSell(_ sender: Any) {
        let nextVC = self.storyboard?.instantiateViewController(identifier: "idSellBookPriceVC")as! SellBookPriceVC
        nextVC.bookName = bookName
        nextVC.bookAuthorName = bookAuthorName
        nextVC.booklanguage = booklanguage
        nextVC.bookDescription = bookDescription
        nextVC.bookEdition = bookEdition
        nextVC.bookcatname = bookcatname
        nextVC.selectedimages = selectedimages
        nextVC.bookCatID = bookCatID
        
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
    @IBAction func onClickrent(_ sender: Any) {
        let nextVC = self.storyboard?.instantiateViewController(identifier: "idRentBookVC")as! RentBookVC
        nextVC.bookName = bookName
        nextVC.bookAuthorName = bookAuthorName
        nextVC.booklanguage = booklanguage
        nextVC.bookDescription = bookDescription
        nextVC.bookEdition = bookEdition
        nextVC.bookcatname = bookcatname
        nextVC.selectedimages = selectedimages
        nextVC.bookCatID = bookCatID
        
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
    @IBAction func onClickboth(_ sender: Any) {
        let nextVC = self.storyboard?.instantiateViewController(identifier: "idBothBookVC")as! BothBookVC
        nextVC.bookName = bookName
        nextVC.bookAuthorName = bookAuthorName
        nextVC.booklanguage = booklanguage
        nextVC.bookDescription = bookDescription
        nextVC.bookEdition = bookEdition
        nextVC.bookcatname = bookcatname
        nextVC.selectedimages = selectedimages
        nextVC.bookCatID = bookCatID
        
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
    
}
