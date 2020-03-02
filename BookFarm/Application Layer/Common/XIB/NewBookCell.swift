//
//  NewBookCell.swift
//  BookFarm
//
//  Created by Mac on 17/12/19.
//  Copyright © 2019 Mac. All rights reserved.
//

import UIKit
protocol Onclickfunc {
    func onClicklike(index : IndexPath)
    func onClickdelete(index : IndexPath)
}

class NewBookCell: UICollectionViewCell {
    var data : Onclickfunc!
    var index : IndexPath!
    @IBOutlet weak var ivPrime: UIImageView!
    @IBOutlet weak var iLike: UIImageView!
    @IBOutlet weak var btnlike: UIButton!
    @IBOutlet weak var cellView: UIView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var ibook: UIImageView!
    @IBOutlet weak var lbldetails: UILabel!
    @IBOutlet weak var lblSellPrice: UILabel!
    @IBOutlet weak var lblRentPrice: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
       
    }
    @IBAction func btndelete(_ sender: Any) {
        self.data.onClickdelete(index: index)
    }
    @IBAction func btnLike(_ sender: Any) {
        self.data.onClicklike(index: index)
    }
    
}
