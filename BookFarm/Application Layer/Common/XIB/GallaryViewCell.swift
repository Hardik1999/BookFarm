//
//  GallaryViewCell.swift
//  BookFarm
//
//  Created by Hardik on 2/24/20.
//  Copyright © 2020 Mac. All rights reserved.
//

import UIKit

class GallaryViewCell: UICollectionViewCell {

    @IBOutlet weak var lblBookName: UILabel!
    @IBOutlet weak var ivBookImage: UIImageView!
    
    @IBOutlet weak var lblauthorName: UILabel!
    @IBOutlet weak var lblSellPrice: UILabel!
    @IBOutlet weak var lblRentPrice: UILabel!
    @IBOutlet weak var lblBookDetails: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
