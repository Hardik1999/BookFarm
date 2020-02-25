//
//  AllCategoryBookCell.swift
//  BookFarm
//
//  Created by Mac on 18/12/19.
//  Copyright © 2019 Mac. All rights reserved.
//

import UIKit

class AllCategoryBookCell: UITableViewCell {
    @IBOutlet weak var IMGview: UIView!
    
    @IBOutlet weak var imgAllCategoryCell: UIImageView!
    @IBOutlet weak var lblAllCateroryCell: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
        // Initialization code
    }

    @IBAction func btnmove(_ sender: Any) {
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

       
    }
    
}
