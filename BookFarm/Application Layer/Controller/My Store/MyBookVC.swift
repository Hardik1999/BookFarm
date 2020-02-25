//
//  MyBookVC.swift
//  BookFarm
//
//  Created by Mac on 19/12/19.
//  Copyright © 2019 Mac. All rights reserved.
//

import UIKit
import XLPagerTabStrip


class MyBookVC: BaseVC {
    let itemcell = "NewBookCell"
    var AllBookArray = [Book]()
    @IBOutlet weak var ScollBook: UIScrollView!
    @IBOutlet weak var clvMyBook: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib(nibName: itemcell, bundle: nil)
        
        clvMyBook.register(nib, forCellWithReuseIdentifier: itemcell)
        clvMyBook.dataSource = self
        clvMyBook.delegate = self
        doGetMyAllBook()
    }
    func doGetMyAllBook(){
        let param = ["selectAllBooksByUser":"selectAllBooksByUser",
                     "book_category_id":"0",
                     "user_id":dogetlocaldatauser().userId!]
        let request = AlamofireSingleTon.sharedInstance
        print(param as Any)
        request.requestPost(serviceName: ServiceNameConstants.AllMybook, parameters: param) { (json, error) in
            if json != nil{
                print(json as Any)
                do{
                    let response = try JSONDecoder().decode(BookResponse.self, from: json!)
                    if response.status == "200"{
                        self.AllBookArray.append(contentsOf: response.books)
                        self.AllBookArray.reverse()
                        self.clvMyBook.reloadData()
                    }else{
                        
                    }
                    
                }catch{
                    print("parse error")
                    
                }
            }else{
                print("error",error as Any)
                
            }
        }
    }
    
}
extension MyBookVC :UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return AllBookArray.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = clvMyBook.dequeueReusableCell(withReuseIdentifier: itemcell, for: indexPath)as! NewBookCell
        cell.cellView.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        cell.cellView.layer.borderWidth = 2
        cell.cellView.layer.masksToBounds = false
        cell.cellView.layer.cornerRadius = 2
        cell.lblName.text = AllBookArray[indexPath.row].bookName
        cell.lbldetails.text = AllBookArray[indexPath.row].sellPrice
        utils.setImageFromUrl(imageView: cell.ibook, urlString: AllBookArray[indexPath.row].bookImages[0].bookImageURL)
        cell.cellView.layer.cornerRadius = 5
        cell.cellView.layer.borderWidth = 1
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat{
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let yourwidth = clvMyBook.frame.width/2
        return CGSize(width: yourwidth - 1, height: 190)
    }
    override func viewWillAppear(_ animated: Bool) {
        clvMyBook.reloadData()
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "idMyBookDetailsVC")as! MyBookDetailsVC
        nextVC.MyBookDetailsArr = AllBookArray[indexPath.row]
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
}
extension MyBookVC : IndicatorInfoProvider{
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return "My Book"
    }
}




