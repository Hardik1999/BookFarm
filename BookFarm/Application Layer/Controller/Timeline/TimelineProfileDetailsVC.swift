//
//  TimelineProfileDetailsVC.swift
//  BookFarm
//
//  Created by Hardik on 2/19/20.
//  Copyright © 2020 Mac. All rights reserved.
//

import UIKit

class TimelineProfileDetailsVC: BaseVC {
    @IBOutlet weak var viewUserProfile: UIView!
    @IBOutlet weak var lblbUserName: UILabel!
    @IBOutlet weak var ivUserProfile: UIImageView!
    @IBOutlet weak var tbvProfileDetails: UITableView!
    let itemcell = "TimelineCell"
    let itemcell2 = "TimelineWithOutImageCell"
    var detailsArr : Timeline!
    var profiledetailsArr = [Timeline]()
    var imgArr = [UIImage]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib(nibName: itemcell, bundle: nil)
        tbvProfileDetails.register(nib, forCellReuseIdentifier: itemcell)
        
        let nib2 = UINib(nibName: itemcell2, bundle: nil)
        tbvProfileDetails.register(nib2, forCellReuseIdentifier: itemcell2)
        
        tbvProfileDetails.delegate = self
        tbvProfileDetails.dataSource = self
        utils.setImageFromUrl(imageView: ivUserProfile, urlString: detailsArr.userProfilePicture)
        lblbUserName.text = detailsArr.userName
        viewUserProfile.layer.cornerRadius = viewUserProfile.frame.width/2
        ivUserProfile.layer.cornerRadius = ivUserProfile.frame.width/2
        tbvProfileDetails.isHidden = true
        
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(handleGesture))
        swipeRight.direction = .right
        self.view.addGestureRecognizer(swipeRight)
        
        print(detailsArr as Any)
        
        
        addRefreshControlTo(tableView: tbvProfileDetails)
        
    }
    override func fetchNewDataOnRefresh(){
        refreshControl.beginRefreshing()
        profiledetailsArr.removeAll()
        doUserProfileAPI()
        refreshControl.endRefreshing()
    }
    
    
    @objc func handleGesture(gesture: UISwipeGestureRecognizer) -> Void {
        if gesture.direction == .right {
            for nextVC in self.navigationController!.viewControllers as Array{
                if nextVC.isKind(of: TimelineVC.self){
                    self.navigationController?.popToViewController(nextVC, animated: true)
                    break
                }
            }
        }
    }
    
    @IBAction func onClickTimeline(_ sender: Any) {
        tbvProfileDetails.isHidden = false
        doUserProfileAPI()
    }
    func  doUserProfileAPI() {
        let param = ["selectAllTimelines_by_user":"selectAllTimelines_by_user",
                     "user_id": detailsArr.userId! ]
        print(param)
        let request = AlamofireSingleTon.sharedInstance
        
        request.requestPostMultipart(serviceName: ServiceNameConstants.Timeline, parameters: param as [String : Any] , imagesArray: imgArr  , compression: 0, paramName: "photo[]") { (Data, error) in
            if Data != nil{
                do{
                    let response = try JSONDecoder().decode(TimelineResponse.self, from: Data!)
                    
                    
                    if response.status == "200"{
                        self.profiledetailsArr.append(contentsOf: response.timeline)
                        self.profiledetailsArr.reverse()
                        self.tbvProfileDetails.reloadData()
                        
                    }else{
                        print("error" as Any)
                    }
                }catch{
                    print("parse error" as Any)
                }
            }
        }
    }
}
extension TimelineProfileDetailsVC : UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return profiledetailsArr.count
    } 
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        if profiledetailsArr[indexPath.row].postTypeFlag == "1"{
            let cell = tbvProfileDetails.dequeueReusableCell(withIdentifier: itemcell2, for: indexPath)as! TimelineWithOutImageCell
            utils.setImageFromUrl(imageView: cell.ivUserProfile, urlString: detailsArr.userProfilePicture)
            cell.lblUserName.text = detailsArr.userName
            cell.lblAbout.text = profiledetailsArr[indexPath.row].timelineAbout
            cell.ivUserProfile.cornerRadius = cell.ivUserProfile.frame.width/2
            return cell
        }else if profiledetailsArr[indexPath.row].postTypeFlag == "0"{
            let cell = tbvProfileDetails.dequeueReusableCell(withIdentifier: itemcell, for: indexPath)as! TimelineCell
            cell.lblUserName.text = detailsArr.userName
            cell.lblAbout.text = profiledetailsArr[indexPath.row].timelineAbout
            cell.ivUserProfile.cornerRadius = cell.ivUserProfile.frame.width/2
            utils.setImageFromUrl(imageView: cell.ivUserProfile, urlString: detailsArr.userProfilePicture)
            cell.setImage(imgArr: profiledetailsArr[indexPath.row].timelineImage)
            return cell
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
