//
//  TimelineCell.swift
//  BookFarm
//
//  Created by Hardik on 2/13/20.
//  Copyright © 2020 Mac. All rights reserved.
//

import UIKit

protocol OnClicktimeline {
    func doclicklike(index : IndexPath)
    func doclickcomment(index : IndexPath)
    func doclickshare(index : IndexPath)
    func doclickmenu(index : IndexPath)
    func doclicksave(index : IndexPath)
    func doclickprofile(index : IndexPath)
}

class TimelineCell: UITableViewCell {
    
    @IBOutlet weak var lblAbout: UILabel!
    @IBOutlet weak var viewUserProfile: UIView!
    @IBOutlet weak var ivUserProfile: UIImageView!
    @IBOutlet weak var lblUserName: UILabel!
    @IBOutlet weak var viewCarouel: iCarousel!
    @IBOutlet weak var pagerCount: UIPageControl!
    @IBOutlet weak var heightCarousel: NSLayoutConstraint!
    
    var imgArr = [TimelineImage]()
    var data : OnClicktimeline!
    var index : IndexPath!
    //var onClicktimeline : OnClicktimeline!
    var selecteimage = [UIImage]()
    override func awakeFromNib() {
        super.awakeFromNib()
        viewCarouel.delegate = self
        viewCarouel.dataSource = self
        
       
    }
    func setImage(imgArr : [TimelineImage])  {
        self.imgArr = imgArr
        viewCarouel.reloadData()
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    @IBAction func onClickLike(_ sender: Any) {
        self.data.doclicklike(index: self.index)
    }
    @IBAction func onClickComment(_ sender: Any) {
        self.data.doclickcomment(index: self.index)
    }
    @IBAction func onClickShare(_ sender: Any) {
        self.data.doclickshare(index: self.index)
    }
    @IBAction func onClickSave(_ sender: Any) {
        self.data.doclicksave(index: self.index)
    }
    @IBAction func onClickMenu(_ sender: Any) {
        self.data.doclickmenu(index: self.index)
    }
    @IBAction func onClickProfile(_ sender: Any) {
        self.data.doclickprofile(index: self.index)
    }
  
}
extension TimelineCell : iCarouselDelegate ,iCarouselDataSource{
    func numberOfItems(in carousel: iCarousel) -> Int {
        return imgArr.count
    }
    
    func carousel(_ carousel: iCarousel, viewForItemAt index: Int, reusing view: UIView?) -> UIView {
        
        let cell = (Bundle.main.loadNibNamed("PagerCell", owner: self, options: nil)?[0] as! UIView)as! PagerCell
        utils.setImageFromUrl(imageView: cell.ivPager, urlString: imgArr[index].timelineImageUrl)
        cell.frame = viewCarouel.frame

        
        return cell

    }
  func carouselDidScroll(_ carousel: iCarousel) {
         pagerCount.currentPage = carousel.currentItemIndex
    
     }
    
}

