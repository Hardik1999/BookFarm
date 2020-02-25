//
//  CategoryViseBookVC.swift
//  BookFarm
//
//  Created by Mac on 16/01/20.
//  Copyright © 2020 Mac. All rights reserved.
//

import UIKit


class CategoryViseBookVC: UIViewController {
    var CategoryVisearray = [Book]()
    var categoryArr : Category!
    
    var vc : FilterVC!
    var cellViewType = "GallaryViewCell"
    let itemCell = "NewBookCell"
    let itemcell2 = "NewAllBookCell"
    let itemcell3 = "GallaryViewCell"
    @IBOutlet weak var filterView: UIView!
    @IBOutlet weak var clvBook: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib(nibName: itemCell, bundle: nil)
        clvBook.register(nib, forCellWithReuseIdentifier: itemCell)
        
        let nib2 = UINib(nibName: itemcell2, bundle: nil)
        clvBook.register(nib2, forCellWithReuseIdentifier: itemcell2)
        
        let nib3 = UINib(nibName: itemcell3, bundle: nil)
        clvBook.register(nib3, forCellWithReuseIdentifier: itemcell3)
        
        clvBook.delegate = self
        clvBook.dataSource = self
        filterView.layer.repeatCount = 5
        filterView.layer.borderWidth = 1
        
        docallCategoryviseBook()
    }
    @IBAction func onClickBAck(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func onClickFilter(_ sender: Any) {
        let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "idFilterVC") as! FilterVC
        nextVC.filterArr = categoryArr!
        //        nextVC.bookfilterArr = CategoryVisearray[Indexpath]
        self.navigationController?.pushViewController(nextVC, animated: true)   
    }
    func docallCategoryviseBook() {
        let param = ["selectAllBooksByUser":"selectAllBooksByUser",
                     "book_category_id":categoryArr.catID!
        ]
        print("param" ,param)
        let request = AlamofireSingleTon.sharedInstance
        request.requestPost(serviceName: ServiceNameConstants.AllMybook, parameters: param){
            (json,error)in
            if json != nil{
                do{
                    print(json as Any)
                    let response = try JSONDecoder().decode(BookResponse.self, from: json!)
                    if response.status == "200" {
                        self.CategoryVisearray.append(contentsOf: response.books)
                        self.clvBook.reloadData()
                    }
                    else{
                        
                    }
                }catch{
                    print("parse error")
                }
            }
            else{
                print(error!)
            }
        }
        
    }
    
}
extension CategoryViseBookVC : UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return CategoryVisearray.count
        
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = UICollectionViewCell()
        if cellViewType == "GallaryViewCell"{
            let cell = clvBook.dequeueReusableCell(withReuseIdentifier: itemcell3, for: indexPath) as! GallaryViewCell
            cell.lblBookName.text = CategoryVisearray[indexPath.row].bookName
            cell.lblSellPrice.text = CategoryVisearray[indexPath.row].sellPrice
            cell.lblRentPrice.text = CategoryVisearray[indexPath.row].rentPrice
            cell.lblauthorName.text = CategoryVisearray[indexPath.row].authorName
            cell.lblBookDetails.text = CategoryVisearray[indexPath.row].bookDescription
            utils.setImageFromUrl(imageView: cell.ivBookImage, urlString: CategoryVisearray[indexPath.row].bookImages[0].bookImageURL)
            return cell
        }else if cellViewType == "ListView"{
            let cell = clvBook.dequeueReusableCell(withReuseIdentifier: itemcell2, for: indexPath) as! NewAllBookCell
            cell.lblBookName.text = CategoryVisearray[indexPath.row].bookName
            cell.lblRentPrice.text = CategoryVisearray[indexPath.row].sellPrice
            utils.setImageFromUrl(imageView: cell.ivBookImage, urlString: CategoryVisearray[indexPath.row].bookImages[0].bookImageURL)
            return cell
        }else if cellViewType == "MosaicView"{
            let cell = clvBook.dequeueReusableCell(withReuseIdentifier: itemCell, for: indexPath) as! NewBookCell
            cell.lblName.text = CategoryVisearray[indexPath.row].bookName
            cell.lblSellPrice.text = CategoryVisearray[indexPath.row].sellPrice
            utils.setImageFromUrl(imageView: cell.ibook, urlString: CategoryVisearray[indexPath.row].bookImages[0].bookImageURL)
            return cell
        }
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat{
        return 1
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if cellViewType == "GallaryViewCell"{
            let yourWidth = Int(clvBook.bounds.width)
            return CGSize(width: yourWidth , height: 350)
        } else if cellViewType == "ListView" {
            let yourWidth = Int(clvBook.bounds.width/2)
            return CGSize(width: yourWidth , height: 130)
        }
        let yourWidth = Int(clvBook.bounds.width/2)
        return CGSize(width: yourWidth - 1 , height: 160)
    }
}


