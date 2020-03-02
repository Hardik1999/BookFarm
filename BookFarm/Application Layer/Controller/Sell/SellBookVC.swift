//
//  SellBookVC.swift
//  BookFarm
//
//  Created by Mac on 19/12/19.
//  Copyright © 2019 Mac. All rights reserved.
//

import UIKit
struct categorylist {
    let name : String!
    let image : UIImage!
    var more : Bool!
    let book_cat_id : String!
}

class SellBookVC: UIViewController {
    
    var BookCategory = [categorylist]()
    @IBOutlet weak var cvSellCategory: UICollectionView!
    let itemcell = "SellCategoryCell"
    var backGroundColour = [#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0),#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0),#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0),#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0),#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0),#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0),#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0),#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0),#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)]
    var flag : Int!
    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib(nibName: itemcell, bundle: nil)
        cvSellCategory.register(nib, forCellWithReuseIdentifier: itemcell)
        cvSellCategory.dataSource = self
        cvSellCategory.delegate = self
        
        BookCategory.append(categorylist(name: "Agriculture", image: UIImage(named: "agricultur"), more: false, book_cat_id: "1"))
        BookCategory.append(categorylist(name: "Architecture", image: UIImage(named: "Architecture"), more: false, book_cat_id: "2"))
        BookCategory.append(categorylist(name: "Art & Photography", image: UIImage(named: "art & photography"), more: false, book_cat_id: "3"))
        BookCategory.append(categorylist(name: "Biography", image: UIImage(named: "biography"), more: false, book_cat_id: "4"))
        BookCategory.append(categorylist(name: "Business & Finance", image: UIImage(named: "business"), more: false, book_cat_id: "5"))
        BookCategory.append(categorylist(name: "Children Books", image: UIImage(named: "ChildrenBook"), more: false, book_cat_id: "6"))
        BookCategory.append(categorylist(name: "Computer Science", image: UIImage(named: "ComputerScience"), more: false, book_cat_id: "7"))
        BookCategory.append(categorylist(name: "More Category", image: UIImage(named: "more"), more:true , book_cat_id: ""))
        
    }
    
    
    @IBAction func onClickCancel(_ sender: Any) {
        let nextVC = storyboard?.instantiateViewController(withIdentifier: "idViewVC")as! ViewVC
        nextVC.view.backgroundColor = UIColor.black.withAlphaComponent(0.7)
        addChild(nextVC)
        view.addSubview(nextVC.view)
    }
}
extension SellBookVC : UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return BookCategory.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = cvSellCategory.dequeueReusableCell(withReuseIdentifier: itemcell, for: indexPath)as!SellCategoryCell
        cell.layer.cornerRadius = 5
        cell.lblCategoryName.text = BookCategory[indexPath.row].name
        cell.icategory.image = BookCategory[indexPath.row].image
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let yourwidth = cvSellCategory.frame.width/2
        return CGSize(width: yourwidth-1, height: collectionView.frame.height/4)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if BookCategory[indexPath.row].more == true{
            let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "idmoreCategoryDetailsVC")as!moreCategoryDetailsVC
            
            self.navigationController?.pushViewController(nextVC, animated: true)
        }
        else {
            if flag == 1{
                let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "idSellDetailsVC")as!SellDetailsVC
                nextVC.bookCatID = BookCategory[indexPath.row].book_cat_id
                nextVC.bookcatname = BookCategory[indexPath.row].name
                self.navigationController?.pushViewController(nextVC, animated: true)
            }else if flag == 2{
                let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "idEbookSellDetailsVC")as!EbookSellDetailsVC
//                nextVC.bookCatID = BookCategory[indexPath.row].book_cat_id
                nextVC.Flag = flag
                nextVC.bookcatname = BookCategory[indexPath.row].name
                self.navigationController?.pushViewController(nextVC, animated: true)
            }
            
        }
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    
}
