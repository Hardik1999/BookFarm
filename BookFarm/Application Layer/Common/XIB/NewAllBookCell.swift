//
//  NewAllBookCell.swift
//  BookFarm
//
//  Created by Hardik on 2/3/20.
//  Copyright © 2020 Mac. All rights reserved.
//

import UIKit

class NewAllBookCell: UICollectionViewCell {
    @IBOutlet weak var lblBookName: UILabel!
    @IBOutlet weak var lblBookAuthor: UILabel!
    @IBOutlet weak var lblBookLanguage: UILabel!
    @IBOutlet weak var lblSellPrice: UILabel!
    @IBOutlet weak var ivBookImage: UIImageView!
    @IBOutlet weak var lblRentPrice: UILabel!
    @IBOutlet weak var btnLike: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
