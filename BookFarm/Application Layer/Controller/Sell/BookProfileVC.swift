//
//  BookProfileVC.swift
//  BookFarm
//
//  Created by Hardik on 1/28/20.
//  Copyright © 2020 Mac. All rights reserved.
//

import UIKit
import YPImagePicker

class BookProfileVC: UIViewController {
    var bookName = ""
    var bookAuthorName = ""
    var booklanguage = ""
    var bookDescription = ""
    var bookEdition = ""
    var bookcatname = ""
    var selectedimages = [UIImage]()
    let itemcell = "AddProfileCell"
    var commonResponse = [CommonResponse]()
    var bookCatID = ""
    @IBOutlet weak var clvBookImages: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib(nibName: itemcell, bundle: nil)
        clvBookImages.register(nib, forCellWithReuseIdentifier: itemcell)
        clvBookImages.dataSource = self
        clvBookImages.delegate = self
        
    }
    
    @IBAction func onClickAddPhoto(_ sender: Any) {
        var config = YPImagePickerConfiguration()
        // [Edit configuration here ...]
        // Build a picker with your configuration
        config.showsPhotoFilters = false
        config.library.mediaType = YPlibraryMediaType.photo
        config.library.maxNumberOfItems = 5
        config.library.minNumberOfItems = 1
        config.library.numberOfItemsInRow = 4
        config.hidesStatusBar = false
        config.hidesBottomBar = false
        config.screens = [.photo,.library]
        config.startOnScreen = .library
        config.showsCrop = .none
        config.targetImageSize = .cappedTo(size:720)
        let picker = YPImagePicker(configuration: config)
        
        picker.didFinishPicking { [unowned picker] items, cancelled in
            
            _ = items.map { print("🧀 \($0)") }
            print("item count",items.count)
            for item in items {
                switch item {
                case .photo(let photo):
                    print(self.selectedimages.count)
                    self.selectedimages.append(photo.image)
                    self.clvBookImages.reloadData()
                    picker.dismiss(animated: true, completion: nil)
                    break;
                //                    print(photo.image)
                case .video(let video):
                    print(video)
                }
            }
            picker.dismiss(animated: true, completion: nil)
        }
        
        present(picker, animated: true, completion: nil)
        
    }
    
    @IBAction func onClickNext(_ sender: Any) {
        let nextVC = storyboard?.instantiateViewController(withIdentifier: "idSellTypeVC")as! SellTypeVC
        
        nextVC.bookName = bookName
        nextVC.bookAuthorName = bookAuthorName
        nextVC.booklanguage = booklanguage
        nextVC.bookDescription = bookDescription
        nextVC.bookEdition = bookEdition
        nextVC.bookcatname = bookcatname
        nextVC.selectedimages = selectedimages
        nextVC.bookCatID = bookCatID
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
    
    @IBAction func onClickBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}
extension BookProfileVC : UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,deleteimage{
    func dodeleteImage(indexpath: IndexPath) {
        selectedimages.remove(at: indexpath.row)
        clvBookImages.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return selectedimages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = clvBookImages.dequeueReusableCell(withReuseIdentifier: itemcell, for: indexPath)as! AddProfileCell
        
        cell.ivProfile.image = selectedimages[indexPath.row]
        cell.delegate = self
        cell.indexpath = indexPath
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let yourwidth = clvBookImages.bounds.width/4
        return CGSize(width: yourwidth - 1, height: 90)
    }
    
}
