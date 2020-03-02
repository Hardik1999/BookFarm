//
//  TimelinePostVC.swift
//  BookFarm
//
//  Created by Hardik on 2/17/20.
//  Copyright © 2020 Mac. All rights reserved.
//

import UIKit
import YPImagePicker

class TimelinePostVC: BaseVC , UITextViewDelegate{
let itemcell = "AddProfileCell"
    var Pickimages = [UIImage]()
    var flag = "0"
    @IBOutlet weak var ivCollection: UIImageView!
    @IBOutlet weak var viewUserImage: UIView!
    @IBOutlet weak var lblUserName: UILabel!
    @IBOutlet weak var clvPostTimeLine: UICollectionView!
    @IBOutlet weak var tvAbout: UITextView!
    @IBOutlet weak var ivUser: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        let nib = UINib(nibName: itemcell, bundle: nil)
               clvPostTimeLine.register(nib, forCellWithReuseIdentifier: itemcell)
               clvPostTimeLine.dataSource = self
               clvPostTimeLine.delegate = self
        
        tvAbout.delegate = self
        tvAbout.text = " write your idea.... "
        tvAbout.textColor = UIColor.lightGray
        let data = dogetlocaldatauser().userProfile
        utils.setImageFromUrl(imageView: ivUser, urlString: data)
        print(data as Any)
        lblUserName.text = dogetlocaldatauser().userName
        ivUser.layer.cornerRadius = ivUser.frame.width/2
        
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if tvAbout.textColor == UIColor.lightGray {
            tvAbout.text = nil
            tvAbout.textColor = UIColor.black
        }
    }

   func textViewDidEndEditing(_ textView: UITextView) {
        if tvAbout.text.isEmpty {
            tvAbout.text = "write your idea...."
            tvAbout.textColor = UIColor.lightGray
        }
    }
    
    
    
    @IBAction func onClickCancel(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func onClickPost(_ sender: Any) {
    doPostApi()
    }
    func doPostApi()  {
        if Pickimages.count == 0{
            flag = "1"
        }else{
            flag = "0"
        }
        let param = ["TimelineRegister":"TimelineRegister",
                     "timeline_about":tvAbout.text!,
                     "user_id": dogetlocaldatauser().userId!,
                     "post_type":flag]
        let request = AlamofireSingleTon.sharedInstance
        
        request.requestPostMultipart(serviceName: ServiceNameConstants.Timeline, parameters: param, imagesArray: Pickimages, compression: 0, paramName: "photo[]") { (json, error) in
            if json != nil{
                do{
                    let response = try JSONDecoder().decode(CommonResponse.self, from: json!)
                    
                    if response.status == "200"{
                         print(response as Any)
                        
                        self.navigationController?.popViewController(animated: true)
                    }
                    
                }catch{
                    
                }
            }
        }
    }
    @IBAction func onClickImage(_ sender: Any) {
      photoPick()
    }
    func photoPick()  {
        
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
                                 print(self.Pickimages.count)
                                 self.Pickimages.append(photo.image)
                                 self.clvPostTimeLine.reloadData()
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
    
}
extension TimelinePostVC : UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,deleteimage{
    func dodeleteImage(indexpath: IndexPath) {
        Pickimages.remove(at: indexpath.row)
        clvPostTimeLine.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Pickimages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = clvPostTimeLine.dequeueReusableCell(withReuseIdentifier: itemcell, for: indexPath)as! AddProfileCell
        cell.ivProfile.image = Pickimages[indexPath.row]
        cell.delegate = self
        cell.indexpath = indexPath
        
        
        if collectionView == nil {
            ivCollection.isHidden = false
        }else{
            ivCollection.isHidden = true
        }
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let yourWidth = clvPostTimeLine.frame.width/4
        return CGSize(width: yourWidth-1, height: 90)
    }
    
    
}
