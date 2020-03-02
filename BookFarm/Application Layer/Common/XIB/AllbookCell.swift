//
//  AllbookCell.swift
//  BookFarm
//
//  Created by Hardik on 3/2/20.
//  Copyright © 2020 Mac. All rights reserved.
//

import UIKit
protocol onClickSave {
    func doSave(index : IndexPath)
}
class AllbookCell: UICollectionViewCell {
    var data : onClickSave!
    var index : IndexPath!
    @IBOutlet weak var ivprime: UIImageView!
    @IBOutlet weak var ivbook: UIImageView!
    @IBOutlet weak var lblbookname: UILabel!
    @IBOutlet weak var lblbookDescription: UILabel!
    @IBOutlet weak var lblsell: UILabel!
    @IBOutlet weak var lblrent: UILabel!
    @IBOutlet weak var rentWidth: NSLayoutConstraint!
    @IBOutlet weak var sellWidth: NSLayoutConstraint!
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    @IBAction func btnSave(_ sender: Any) {
        self.data.doSave(index: index)
    }
}
