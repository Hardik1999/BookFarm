//
//  NewBookCell.swift
//  BookFarm
//
//  Created by Mac on 17/12/19.
//  Copyright © 2019 Mac. All rights reserved.
//

import UIKit

class NewBookCell: UICollectionViewCell {

    @IBOutlet weak var iLike: UIImageView!
    @IBOutlet weak var btnlike: UIButton!
    @IBOutlet weak var cellView: UIView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var ibook: UIImageView!
    @IBOutlet weak var lbldetails: UILabel!
    @IBOutlet weak var lblSellPrice: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
       
    }

}
