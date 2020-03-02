//
//  EbookVC.swift
//  BookFarm
//
//  Created by Hardik on 2/26/20.
//  Copyright © 2020 Mac. All rights reserved.
//

import UIKit

class EbookVC: UIViewController {

    @IBOutlet weak var clvEbook: UICollectionView!
    let itemcell = "EbookCell"
    
    var ebookArr = [Ebook]()
    override func viewDidLoad() {
        super.viewDidLoad()
            let nib = UINib(nibName: itemcell , bundle: nil)
        clvEbook.register(nib, forCellWithReuseIdentifier: itemcell)
        clvEbook.dataSource = self
        clvEbook.delegate = self
        
        doCallEbookAPI()
        
    }
    @IBAction func onClickBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    func doCallEbookAPI() {
        let param = ["selectAllEBooks":"selectAllEBooks"]
        let request = AlamofireSingleTon.sharedInstance
        
        request.requestPost(serviceName: ServiceNameConstants.EbookController, parameters: param) { (Data, error) in
            if Data != nil{
                do{
                    let response = try JSONDecoder().decode(EbookResponse.self, from: Data!)
                    print(response as Any)
                     
                    if response.status == "200"{
                        self.ebookArr.append(contentsOf: response.ebooks)
                        self.ebookArr.reverse()
                        self.clvEbook.reloadData()
                    }else{
                        //print( as Any)
                    }
                }catch{
                    print("parse error")
                }
            }else{
                print("error")
            }
        }
    }
    
}
extension EbookVC : UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,deleteCell{
    func doClickDelete(index: IndexPath) {
       
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return ebookArr.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = clvEbook.dequeueReusableCell(withReuseIdentifier: itemcell, for: indexPath)as! EbookCell
        utils.setImageFromUrl(imageView: cell.ivBook, urlString: ebookArr[indexPath.row].ebook_image)
        cell.lblEbookname.text! = ebookArr[indexPath.row].ebookName
        cell.index = indexPath
        cell.itemdata = self
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let yourwidth = clvEbook.frame.width/2
        return CGSize(width: yourwidth - 1 , height: 170)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let nextVC = storyboard?.instantiateViewController(withIdentifier: "idOpenPdfVC")as! OpenPdfVC
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
}

