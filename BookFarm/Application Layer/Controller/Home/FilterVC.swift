//
//  FilterVC.swift
//  BookFarm
//
//  Created by Mac on 16/01/20.
//  Copyright © 2020 Mac. All rights reserved.
//

import UIKit

class FilterVC: UIViewController {
    var filterArr : Category!
    var bookfilterArr : Book!
    var selectedIndex = 0
    var vc : CategoryViseBookVC!
    
    
    @IBOutlet var lblTabBar: [UILabel]!
    @IBOutlet var onClickButtons: [UIButton]!
    @IBOutlet weak var lblCategoryName: UILabel!
    @IBOutlet weak var lblsellPrice: UILabel!
    @IBOutlet weak var lblrentPrice: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        lblCategoryName.text = filterArr.catName
//        lblrentPrice.text = bookfilterArr.rentPrice
//        lblsellPrice.text = bookfilterArr.sellPrice
        
    }
    
    @IBAction func selectedbtn(_ sender: Any) {
        let previousIndex = selectedIndex
        selectedIndex = (sender as AnyObject).tag
               if selectedIndex == 0{
                   didSelecetButton(selectedView: "GallaryViewCell")
               }else if selectedIndex == 1{
                   didSelecetButton(selectedView: "ListView")
               }else if selectedIndex == 2{
                   didSelecetButton(selectedView: "MosaicView")
               }
    }
    func didSelecetButton(selectedView : String!){
         let previousIndex = selectedIndex
         
         if selectedView == "GalleryView"{
             lblTabBar[0].textColor = #colorLiteral(red: 0.2352941176, green: 0.168627451, blue: 0.6745098039, alpha: 1)
             lblTabBar[0].borderColor = #colorLiteral(red: 0.2352941176, green: 0.168627451, blue: 0.6745098039, alpha: 1)
             
             lblTabBar[1].borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
             lblTabBar[1].textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
             
             lblTabBar[2].borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
             lblTabBar[2].textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
             
             
         }else  if selectedView == "ListView"{
             lblTabBar[1].textColor = #colorLiteral(red: 0.2352941176, green: 0.168627451, blue: 0.6745098039, alpha: 1)
             lblTabBar[1].borderColor = #colorLiteral(red: 0.2352941176, green: 0.168627451, blue: 0.6745098039, alpha: 1)
             
             lblTabBar[0].borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
             lblTabBar[0].textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
             
             lblTabBar[2].borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
             lblTabBar[2].textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
         }else  if selectedView == "MosaicView"{
             lblTabBar[2].textColor = #colorLiteral(red: 0.2352941176, green: 0.168627451, blue: 0.6745098039, alpha: 1)
             lblTabBar[2].borderColor = #colorLiteral(red: 0.2352941176, green: 0.168627451, blue: 0.6745098039, alpha: 1)
             
             lblTabBar[0].borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
             lblTabBar[0].textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
             
             lblTabBar[1].borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
             lblTabBar[1].textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
         }
     }
    
    
    @IBAction func onClickMosaic(_ sender: Any) {
        vc.cellViewType = "GallaryViewCell"
    }
    @IBAction func onClickList(_ sender: Any) {
        vc.cellViewType = "NewAllBookCell"
    }
    @IBAction func onClickgallary(_ sender: Any) {
         vc.cellViewType = "NewBookCell"
    }
    
    @IBAction func btnBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    

}
