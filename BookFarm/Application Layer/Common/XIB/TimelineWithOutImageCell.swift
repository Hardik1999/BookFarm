//
//  TimelineWithOutImageCell.swift
//  BookFarm
//
//  Created by Hardik on 2/20/20.
//  Copyright © 2020 Mac. All rights reserved.
//

import UIKit

class TimelineWithOutImageCell: UITableViewCell {
    @IBOutlet weak var lblAbout: UILabel!
    @IBOutlet weak var viewUserProfile: UIView!
    @IBOutlet weak var ivUserProfile: UIImageView!
    @IBOutlet weak var lblUserName: UILabel!
   var data : OnClicktimeline!
   var index : IndexPath!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    @IBAction func btnLike(_ sender: Any) {
        self.data.doclicklike(index: index)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
