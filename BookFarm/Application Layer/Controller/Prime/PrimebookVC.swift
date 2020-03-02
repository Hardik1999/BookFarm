//
//  PrimebookVC.swift
//  BookFarm
//
//  Created by Hardik on 1/31/20.
//  Copyright © 2020 Mac. All rights reserved.
//

import UIKit

class PrimebookVC: UIViewController {

    @IBOutlet weak var clvBook: UICollectionView!
    let itemcell = "EbookCell"
    var primeBookArr = [Book]()
    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib(nibName: itemcell, bundle: nil)
        clvBook.register(nib, forCellWithReuseIdentifier: itemcell)
        clvBook.delegate = self
        clvBook.dataSource = self
        doPrimeAllBookApi()
    }
      func doPrimeAllBookApi()  {
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
                    
                        self.primeBookArr.append(contentsOf: response.book)
                        
                        self.primeBookArr.reverse()
                        self.clvBook.reloadData()
                        
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

    @IBAction func onClickBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }

}
extension PrimebookVC : UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return primeBookArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = clvBook.dequeueReusableCell(withReuseIdentifier: itemcell, for: indexPath)as! EbookCell
        utils.setImageFromUrl(imageView: cell.ivBook, urlString: primeBookArr[indexPath.row].bookImages[0].bookImageUrl)
        cell.lblEbookname.text! = primeBookArr[indexPath.row].bookName
        return cell
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let yourWidth = clvBook.frame.width/2
        return CGSize(width: yourWidth-1, height: 170)
    }
    
}
