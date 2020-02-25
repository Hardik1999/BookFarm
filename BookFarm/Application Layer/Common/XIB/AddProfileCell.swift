//
//  AddProfileCell.swift
//  BookFarm
//
//  Created by Hardik on 1/28/20.
//  Copyright © 2020 Mac. All rights reserved.
//

import UIKit
protocol deleteimage {
    func dodeleteImage(indexpath : IndexPath)
    
}

class AddProfileCell: UICollectionViewCell {

    @IBOutlet weak var btnDelete: UIButton!
    @IBOutlet weak var ivProfile: UIImageView!
    var delegate : deleteimage!
    var indexpath : IndexPath!
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    @IBAction func onClickDelete(_ sender: UIButton) {
        self.delegate.dodeleteImage(indexpath : indexpath)
    }
}
