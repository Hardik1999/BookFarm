//
//  PaymentVC.swift
//  BookFarm
//
//  Created by Hardik on 2/25/20.
//  Copyright © 2020 Mac. All rights reserved.
//

import UIKit


import DropDown
class PaymentVC: BaseVC {
    
    @IBOutlet weak var tfcardHolderName: UITextField!
    @IBOutlet weak var tfcardNumber: UITextField!
    @IBOutlet weak var heightofView: NSLayoutConstraint!
    @IBOutlet weak var ivCard: UIImageView!
    @IBOutlet weak var viewDetails: UIView!
    @IBOutlet weak var lblDate: UILabel!
    @IBOutlet weak var btnDate: UIButton!
    @IBOutlet weak var lblYear: UILabel!
    @IBOutlet weak var btnYear: UIButton!
    
   let chooseByDate = DropDown()
let chooseByYear = DropDown()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        tfcardHolderName.text = dogetlocaldatauser().userName
        
        
        // date
        chooseByDate.anchorView = btnDate  // UIView or UIBarButtonItem
        setupchooseFilterByDate()
        //SELECTED ITEM SHOW IN LABEL
        chooseByDate.selectionAction = { [unowned self] (index: Int, item: String) in
            print("Selected item: \(item) at index: \(index)")
            self.lblDate.text! = item
        }
        
        // year
        chooseByYear.anchorView = btnYear  // UIView or UIBarButtonItem
        setupchooseFilterByYear()
        //SELECTED ITEM SHOW IN LABEL
        chooseByYear.selectionAction = { [unowned self] (index: Int, item: String) in
            print("Selected item: \(item) at index: \(index)")
            self.lblYear.text! = item
        }
        
    }
    func setupchooseFilterByDate() {
        chooseByDate.anchorView = btnDate
        
        // By default, the dropdown will have its origin on the top left corner of its anchor view
        // So it will come over the anchor view and hide it completely
        // If you want to have the dropdown underneath your anchor view, you can do this:
        chooseByDate.bottomOffset = CGPoint(x: 0, y: btnDate.bounds.height)
        chooseByDate.width = btnDate.frame.width
        // You can also use localizationKeysDataSource instead. Check the docs.
        chooseByDate.dataSource = [
            "01","02","03","04","05","06","07","08","09","10","11","12"
        ]
        
    }
     func setupchooseFilterByYear() {
            chooseByYear.anchorView = btnYear
            
            // By default, the dropdown will have its origin on the top left corner of its anchor view
            // So it will come over the anchor view and hide it completely
            // If you want to have the dropdown underneath your anchor view, you can do this:
            chooseByYear.bottomOffset = CGPoint(x: 0, y: btnYear.bounds.height)
            chooseByYear.width = btnYear.frame.width
            // You can also use localizationKeysDataSource instead. Check the docs.
            //        chooseFilterByCategory.dataSource = ["ABCD"]
            chooseByYear.dataSource = [
                "2020","2021","2022","2023","2024","2025","2026"
            ]
            
        }
    
    override func viewWillAppear(_ animated: Bool) {
        ivCard.image = UIImage(named: "Redio_off")
        heightofView.constant = 0
        viewDetails.isHidden = true
    }
    
    @IBAction func onClickback(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func onClickCard(_ sender: Any) {
        ivCard.image = UIImage(named: "Redio_on")
        heightofView.constant = 200
        viewDetails.isHidden = false
    }
    
    @IBAction func onClickApply(_ sender: Any) {
    }
    
    
    
    @IBAction func onclickDate(_ sender: Any) {
        chooseByDate.show()
    }
    
    
    
    @IBAction func onCLickYear(_ sender: Any) {
        chooseByYear.show()
    }
    
    
    
}
