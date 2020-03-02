//
//  EbookCell.swift
//  BookFarm
//
//  Created by Hardik on 2/26/20.
//  Copyright © 2020 Mac. All rights reserved.
//

import UIKit
protocol deleteCell {
    func doClickDelete(index : IndexPath)
}
class EbookCell: UICollectionViewCell {

    @IBOutlet weak var ivBook: UIImageView!
    @IBOutlet weak var lblEbookname: UILabel!
    var index : IndexPath!
    var itemdata : deleteCell!
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
    }

    @IBAction func onClickDelete(_ sender: Any) {
        self.itemdata.doClickDelete(index: index.self)
    }
}
