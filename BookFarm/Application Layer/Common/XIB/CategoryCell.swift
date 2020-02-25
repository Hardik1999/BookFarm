//
//  CategoryCell.swift
//  BookFarm
//
//  Created by Mac on 17/12/19.
//  Copyright © 2019 Mac. All rights reserved.
//

import UIKit

class CategoryCell: UICollectionViewCell {
  
    @IBOutlet weak var imgCategoryCell: UIImageView!
    @IBOutlet weak var cellView: UIView!
    
    @IBOutlet weak var ImgView: UIView!
    @IBOutlet weak var lblCategoryCell: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        ImgView.layer.cornerRadius = ImgView.frame.width/2
        ImgView.layer.masksToBounds = true
    }

}
