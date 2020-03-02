//
//  HomeVC.swift
//  BookFarm
//
//  Created by Mac on 16/12/19.
//  Copyright © 2019 Mac. All rights reserved.
//

import UIKit

struct carouselImg {
    let image : UIImage!
}
class HomeVC: BaseVC,UIScrollViewDelegate {
    // var index = 0
    var PagerData = [carouselImg]()
    var filterArray = [Book]()
    var AllBookArray = [Book]()
    var arrcategory = [Category]()
    //    var refreshControl = UIRefreshControl()
    var backgroundcolour = [#colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1),#colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1),#colorLiteral(red: 0.9568627477, green: 0.6588235497, blue: 0.5450980663, alpha: 1),#colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1),#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1),#colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1),#colorLiteral(red: 1, green: 0.7705479452, blue: 1, alpha: 1),#colorLiteral(red: 0.1681537763, green: 0.7287448851, blue: 1, alpha: 1),#colorLiteral(red: 1, green: 0.5172977435, blue: 0.5205891191, alpha: 1)]
    
    @IBOutlet weak var viewUp: UIView!
    @IBOutlet weak var btnToppen: UIButton!
    @IBOutlet weak var ScrollHome: UIScrollView!
    @IBOutlet weak var tfSearch: UITextField!
    @IBOutlet weak var viewOptions: UIView!
    @IBOutlet weak var clvcategories: UICollectionView!
    @IBOutlet weak var heightofclv: NSLayoutConstraint!
    @IBOutlet weak var clvNewBook: UICollectionView!
    @IBOutlet weak var pagerView: iCarousel!
    @IBOutlet weak var pagerCount: UIPageControl!
    let itemcell = "CategoryCell"
    let itemcell2 = "AllbookCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.filterArray = self.AllBookArray
        // category book
        let nib = UINib(nibName: itemcell, bundle: nil)
        clvcategories.register(nib, forCellWithReuseIdentifier: itemcell)
        clvcategories.dataSource = self
        clvcategories.delegate = self
        
        // new book
        let nib2 = UINib(nibName: itemcell2, bundle: nil)
        clvNewBook.register(nib2, forCellWithReuseIdentifier: itemcell2)
        clvNewBook.dataSource = self
        clvNewBook.delegate = self
        
        tfSearch.addTarget(self, action: #selector(doFilterArray(_: )), for: .editingChanged )
        
        // icarousel
        pagerView.isPagingEnabled = true
        pagerView.isScrollEnabled = true
        pagerView.delegate = self
        pagerView.dataSource = self
        //        pagerView.type = .rotary
        ScrollHome.alwaysBounceVertical = true
        ScrollHome.bounces = true
        //        refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(didPullRefresh), for: .valueChanged)
        self.ScrollHome.addSubview(refreshControl)
        doapicategorycall()
        docallAllBookApi()
        PagerData.append(carouselImg(image: #imageLiteral(resourceName: "2") ))
        PagerData.append(carouselImg(image: #imageLiteral(resourceName: "5") ))
        PagerData.append(carouselImg(image: #imageLiteral(resourceName: "3") ))
        PagerData.append(carouselImg(image: #imageLiteral(resourceName: "4") ))
        PagerData.append(carouselImg(image: #imageLiteral(resourceName: "1") ))
        pagerView.reloadData()
        
        viewUp.layer.cornerRadius = viewUp.frame.width/2
        
        
        
    }
    
    
    
    @objc func doFilterArray(_ sender : UITextField){
        print("filter")
        
        filterArray = sender.text!.isEmpty ? AllBookArray : AllBookArray.filter({ (item:Book) -> Bool in
            
            return item.bookName.lowercased().range(of: sender.text!, options: .caseInsensitive, range: nil, locale: nil) != nil
        })
        if sender.text == "" {
            clvNewBook.reloadData()
            //            self.imgClose.isHidden  = true
        } else {
            clvNewBook.reloadData()
            //            self.imgClose.isHidden  = false
        }
        
    }
    
    @IBAction func onClickEbook(_ sender: Any) {
        let nextvc = storyboard?.instantiateViewController(withIdentifier: "idEbookVC")as! EbookVC
        self.navigationController?.pushViewController(nextvc, animated: true)
        
    }
    @IBAction func onClickTimeLine(_ sender: Any) {
        
        let nextvc = storyboard?.instantiateViewController(withIdentifier: "idTimelineVC")as! TimelineVC
        self.navigationController?.pushViewController(nextvc, animated: true)
        
    }
    
    @objc func didPullRefresh() {
        refreshControl.beginRefreshing()
        AllBookArray.removeAll()
        docallAllBookApi()
        doapicategorycall()
        refreshControl.endRefreshing()
    }
    
    
    
    override func viewWillLayoutSubviews() {
        if self.AllBookArray.count>0 {
            self.heightofclv.constant = self.clvNewBook.contentSize.height
        }
    }
    
    @IBAction func onClickSeeAll(_ sender: Any) {
        let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "idAllCategoryVC")as!AllCategoryVC
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
    
    func docallAllBookApi()  {
        let params = ["view_all_user_book_category_join": "view_all_user_book_category_join",
                      "book_category_id":"0",
                      "onlyallbook":"onlyallbook"]
        let request = AlamofireSingleTon.sharedInstance
        request.requestPost(serviceName: ServiceNameConstants.joinAllbookController, parameters: params) { (json, error) in
            if json != nil {
                do {
                    print(json as Any)
                    let response = try JSONDecoder().decode(BookResponse.self, from:json!)
                    if response.status == "200" {
                
                        self.AllBookArray.append(contentsOf: response.book)
                        self.filterArray = self.AllBookArray
                        self.filterArray.reverse()
                        self.clvNewBook.reloadData()
                        
                    }else {
                        print("error data")
                    }
                } catch {
                    print("parse error")
                }
            }else{
                print("error",json as Any)
            }
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        self.clvNewBook.reloadData()
    }
    
    func doapicategorycall(){
        let params = ["getAllCategories": "getAllCategories"]
        let request = AlamofireSingleTon.sharedInstance
        request.requestPost(serviceName: ServiceNameConstants.bookcategory, parameters: params) { (json, error) in
            if json != nil {
                do {
                    print(json as Any)
                    let response = try JSONDecoder().decode(CategoryResponse.self, from:json!)
                    
                    if response.status == 200 {
                        self.arrcategory.append(contentsOf: response.categories)
                        self.clvcategories.reloadData()
                    }else {
                        
                    }
                } catch {
                    print("parse error")
                    
                }
            }else{
                print("error",json as Any)
            }
        }
    }
}
extension HomeVC : UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,onClickSave{
    func doSave(index: IndexPath) {
    
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == clvcategories{
            var count = 0
            if arrcategory.count<9{
                count = arrcategory.count
            }
            else{
                count = 9
            }
            return count
        }
        else {
            print(filterArray.count)
            return filterArray.count
        }
        
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == clvcategories{
            let cell = clvcategories.dequeueReusableCell(withReuseIdentifier: itemcell, for: indexPath)as! CategoryCell
            cell.lblCategoryCell.text = arrcategory[indexPath.row].catName
            cell.ImgView.backgroundColor = backgroundcolour[indexPath.row]
            utils.setImageFromUrl(imageView: cell.imgCategoryCell, urlString: arrcategory[indexPath.row].catIcon)
            cell.cellView.layer.cornerRadius = 5
            return cell
        }
        else  {
            let cell = clvNewBook.dequeueReusableCell(withReuseIdentifier: itemcell2, for: indexPath)as! AllbookCell
            
            cell.lblbookname.text = filterArray[indexPath.row].bookName
            cell.lblbookDescription.text = filterArray[indexPath.row].bookDescription
            utils.setImageFromUrl(imageView: cell.ivbook, urlString: filterArray[indexPath.row].bookImages[0].bookImageUrl)
            
            
  
            if filterArray[indexPath.row].bookIsPrime == "0"{
                cell.ivprime.isHidden = true
                print("hhhhhhhhhhhhhhhhhhhhhhhh")
            }else{
                cell.ivprime.isHidden = false
                print("2")
            }
            
            cell.rentWidth.constant = 50
            cell.sellWidth.constant = 50
            cell.lblrent.layer.cornerRadius = 5
            cell.lblsell.layer.cornerRadius = 5
            
            if filterArray[indexPath.row].rentPrice == "0" {
                cell.rentWidth.constant = 0
                cell.sellWidth.constant = 50
            }else if filterArray[indexPath.row].sellPrice == "0" {
                cell.rentWidth.constant = 50
                cell.sellWidth.constant = 0
            }
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        if collectionView == clvcategories{
            return 1
        }
        else  {
            return 0
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat{
          if collectionView == clvcategories{
                  return 1
              }
              else  {
                  return 0
              }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == clvcategories{
            
            let yourwidth = clvcategories.bounds.width/3
            return CGSize(width: yourwidth - 1, height: 90)
        }
        else  {
            let yourwidth = clvNewBook.bounds.width/2
            return CGSize(width: yourwidth-0 , height: 200)
        }
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == clvcategories{
            let nextVC = self.storyboard?.instantiateViewController(identifier: "idCategoryViseBookVC")as! CategoryViseBookVC
            nextVC.cat_name = arrcategory[indexPath.row].catName
            nextVC.categoryArr = arrcategory[indexPath.row]
            self.navigationController?.pushViewController(nextVC, animated: true)
        }
        else if collectionView == clvNewBook {
            if dogetlocaldatauser().userPremiumStatus == "1"{
                
                let nextVC = self.storyboard?.instantiateViewController(identifier: "idAllBookVC")as! AllBookVC
                nextVC.BookDetailArray = filterArray[indexPath.row]
                self.navigationController?.pushViewController(nextVC, animated: true)
                
            }else  if dogetlocaldatauser().userPremiumStatus == "0"{
                
                if filterArray[indexPath.row].bookIsPrime == "1"{
                    let nextVC = self.storyboard?.instantiateViewController(identifier: "id PrimeRegistrationVC")as! PrimeRegistrationVC
                    self.navigationController?.pushViewController(nextVC, animated: true)
                    
                }else  if filterArray[indexPath.row].bookIsPrime == "0"{
                    let nextVC = self.storyboard?.instantiateViewController(identifier: "idAllBookVC")as! AllBookVC
                    nextVC.BookDetailArray = filterArray[indexPath.row]
                    self.navigationController?.pushViewController(nextVC, animated: true)
                }
            }
        }
    }
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        viewWillLayoutSubviews()
    }
}
extension HomeVC : iCarouselDelegate,iCarouselDataSource{
    func numberOfItems(in carousel: iCarousel) -> Int {
        return PagerData.count
    }
    func carousel(_ carousel: iCarousel, viewForItemAt index: Int, reusing view: UIView?) -> UIView {
        let cell = (Bundle.main.loadNibNamed("PagerCell", owner: self, options: nil)?[0] as! UIView)as! PagerCell
        cell.frame = pagerView.frame
        cell.ivPager.image = PagerData[index].image
        return cell
    }
    func carouselDidScroll(_ carousel: iCarousel) {
        pagerCount.currentPage = carousel.currentItemIndex
    }
    
    
}

