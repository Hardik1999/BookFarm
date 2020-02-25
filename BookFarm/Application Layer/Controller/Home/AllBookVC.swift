//
//  AllBookVC.swift
//  BookFarm
//
//  Created by Mac on 16/01/20.
//  Copyright © 2020 Mac. All rights reserved.
//

import UIKit

class AllBookVC: BaseVC {
    var BookDetailArray : Book!
    
    @IBOutlet weak var lblBookName: UILabel!
    @IBOutlet weak var iBook: UIImageView!
    @IBOutlet weak var lblBookDetails: UILabel!
    @IBOutlet weak var lblAuthorName: UILabel!
    @IBOutlet weak var lblCategory: UILabel!
    @IBOutlet weak var lblEdition: UILabel!
    @IBOutlet weak var lblMRP: UILabel!
    @IBOutlet weak var iUserBook: UIImageView!
    @IBOutlet weak var lblUserName: UILabel!
    @IBOutlet weak var viewCarousel: iCarousel!
    @IBOutlet weak var PagerCount: UIPageControl!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lblBookName.text = BookDetailArray.bookName
        lblBookDetails.text = BookDetailArray.bookDescription
        lblAuthorName.text = BookDetailArray.authorName
        lblCategory.text = BookDetailArray.bookCategory
        lblEdition.text = BookDetailArray.bookEdition
        lblMRP.text = BookDetailArray.sellPrice
        lblUserName.text = dogetlocaldatauser().userName
//        iUserBook.image = UIImage(contentsOfFile: dogetlocaldatauser().userProfile)
        //utils.setImageFromUrl(imageView: iUserBook, urlString: BookDetailArray.)
        viewCarousel.delegate = self
        viewCarousel.dataSource = self
        viewCarousel.isPagingEnabled = true
        viewCarousel.isScrollEnabled = true
        
        print("userProfile")

    }
    
     func showDialog(){
            let nextVC = storyboard?.instantiateViewController(withIdentifier: "idDialogVC") as! DialogVC
           nextVC.view.backgroundColor = UIColor.black.withAlphaComponent(0.7)
      
           addChild(nextVC)  // add child for main view
           view.addSubview(nextVC.view)
       }
       
    
    @IBAction func onClickContactSeller(_ sender: Any) {
       showDialog()
    }
    @IBAction func onClickBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
}

extension AllBookVC : iCarouselDelegate,iCarouselDataSource{
    func numberOfItems(in carousel: iCarousel) -> Int {
        return BookDetailArray.bookImages.count
    }
    
    func carousel(_ carousel: iCarousel, viewForItemAt index: Int, reusing view: UIView?) -> UIView {
         let cell = (Bundle.main.loadNibNamed("BookDetailsicarouselCell", owner: self, options: nil)?[0] as! UIView)as! BookDetailsicarouselCell
        let data = BookDetailArray.bookImages[index].bookImageURL
        utils.setImageFromUrl(imageView: cell.IvCarousel, urlString: data)
         cell.frame = viewCarousel.frame
        //cell.frame(forAlignmentRect: viewCarousel.frame)
       
        
         return cell
        
    }
     func carouselDidScroll(_ carousel: iCarousel) {
            PagerCount.currentPage = carousel.currentItemIndex
       
        }
    
    
}
