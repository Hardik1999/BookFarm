//
//  ViewVC.swift
//  BookFarm
//
//  Created by Hardik on 2/24/20.
//  Copyright © 2020 Mac. All rights reserved.
//

import UIKit

class ViewVC: UIViewController {
    
    @IBOutlet weak var clvView: UICollectionView!
    var viewListArr = [Book]()
    let itemcell = "NewAllBookCell"
    let itemcell2 = "NewBookCell"
    let itemcell3 = "GallaryViewCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib(nibName: itemcell, bundle: nil)
        clvView.register(nib, forCellWithReuseIdentifier: itemcell)
        
        let nib2 = UINib(nibName: itemcell2, bundle: nil)
        clvView.register(nib2, forCellWithReuseIdentifier: itemcell2)
        
        let nib3 = UINib(nibName: itemcell3, bundle: nil)
        clvView.register(nib3, forCellWithReuseIdentifier: itemcell3)
        
        clvView.dataSource = self
        clvView.delegate = self
        
    }
    @IBAction func onClickBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
}
extension ViewVC : UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewListArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
         if indexPath.item == 0{
            let cell = clvView.dequeueReusableCell(withReuseIdentifier: itemcell, for: indexPath)as!NewAllBookCell
            return cell
            
        } else if indexPath.item == 1{
            let cell = clvView.dequeueReusableCell(withReuseIdentifier: itemcell2, for: indexPath)as!NewBookCell
            return cell
            
        }
        let cell = clvView.dequeueReusableCell(withReuseIdentifier: itemcell3, for: indexPath)as!GallaryViewCell
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.row == 0{
            let yourwidth = clvView.frame.width
            return CGSize(width: yourwidth, height: 110)
        }else if indexPath.row == 1{
            let yourwidth = clvView.frame.width/2
            return CGSize(width: yourwidth - 1, height: 120)
        }
        let yourwidth = clvView.frame.width
        return CGSize(width: yourwidth , height: 400)
    }
}




