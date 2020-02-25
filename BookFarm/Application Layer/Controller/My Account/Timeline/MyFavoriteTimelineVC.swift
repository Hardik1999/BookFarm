//
//  MyFavoriteTimelineVC.swift
//  BookFarm
//
//  Created by Hardik on 2/21/20.
//  Copyright © 2020 Mac. All rights reserved.
//

import UIKit
import XLPagerTabStrip

class MyFavoriteTimelineVC: UIViewController {
    @IBOutlet weak var clvMyFavoriteTimeLine: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

}
extension MyFavoriteTimelineVC : IndicatorInfoProvider{
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return "My Favorite"
    }
}

