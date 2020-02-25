//
//  MyBookDetailsVC.swift
//  BookFarm
//
//  Created by Hardik on 2/5/20.
//  Copyright © 2020 Mac. All rights reserved.
//

import UIKit

class MyBookDetailsVC: UIViewController {
    var MyBookDetailsArr : Book!

    @IBOutlet weak var ivBookImage: UIImageView!
    @IBOutlet weak var lblBookName: UILabel!
    @IBOutlet weak var lblAuthorName: UILabel!
    @IBOutlet weak var lblBookLanguage: UILabel!
    @IBOutlet weak var lblBookMRP: UILabel!
    @IBOutlet weak var lblCategory: UILabel!
    @IBOutlet weak var lblBookDetails: UILabel!
    @IBOutlet weak var viewCarousel: iCarousel!
    @IBOutlet weak var pagerCount: UIPageControl!
    override func viewDidLoad() {
        super.viewDidLoad()
       
        lblBookName.text = MyBookDetailsArr.bookName
        lblAuthorName.text = MyBookDetailsArr.authorName
        lblBookMRP.text = MyBookDetailsArr.sellPrice
        lblCategory.text = MyBookDetailsArr.bookCategory
        lblBookDetails.text = MyBookDetailsArr.bookDescription
        
    }
    
    @IBAction func onClickBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    }
    

