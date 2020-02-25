//
//  LanguageWiseBookVC.swift
//  BookFarm
//
//  Created by Hardik on 1/25/20.
//  Copyright © 2020 Mac. All rights reserved.
//

import UIKit
import XLPagerTabStrip

class LanguageWiseBookVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
}
extension LanguageWiseBookVC : IndicatorInfoProvider{
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return "language"
    }
}
