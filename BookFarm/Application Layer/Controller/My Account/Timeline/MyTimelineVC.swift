//
//  MyTimelineVC.swift
//  BookFarm
//
//  Created by Hardik on 2/21/20.
//  Copyright © 2020 Mac. All rights reserved.
//

import UIKit
import XLPagerTabStrip

class MyTimelineVC: BaseVC {
    
    @IBOutlet weak var tbvMyTimeline: UITableView!
    var myTimelineArr = [Timeline]()
    let itemcell = "TimelineCell"
    let itemcell2 = "TimelineWithOutImageCell"
    var imgArr = [UIImage]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nib = UINib(nibName: itemcell, bundle: nil)
        tbvMyTimeline.register(nib, forCellReuseIdentifier: itemcell)
        
        let nib2 = UINib(nibName: itemcell2, bundle: nil)
        tbvMyTimeline.register(nib2, forCellReuseIdentifier: itemcell2)
        
        tbvMyTimeline.delegate = self
        tbvMyTimeline.dataSource = self
        doMyProfileAPI()
        
        
    }
    func  doMyProfileAPI() {
        let param = ["selectAllTimelines_by_user":"selectAllTimelines_by_user",
                     "user_id": dogetlocaldatauser().userId! ]
        print(param)
        let request = AlamofireSingleTon.sharedInstance
        
        request.requestPostMultipart(serviceName: ServiceNameConstants.Timeline, parameters: param as [String : Any] , imagesArray: imgArr  , compression: 0, paramName: "photo[]") { (Data, error) in
            if Data != nil{
                do{
                    let response = try JSONDecoder().decode(TimelineResponse.self, from: Data!)
                    
                    
                    if response.status == "200"{
                        self.myTimelineArr.append(contentsOf: response.timeline)
                        self.myTimelineArr.reverse()
                        self.tbvMyTimeline.reloadData()
                        
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
extension MyTimelineVC : IndicatorInfoProvider,UITableViewDelegate,UITableViewDataSource,OnClicktimeline{
    func doclicklike(index: IndexPath) {
        print("like")
    }
    
    func doclickcomment(index: IndexPath) {
        print("comment")
    }
    
    func doclickshare(index: IndexPath) {
        print("share")
    }
    
    func doclickmenu(index: IndexPath) {
//        print("Timelinesddd:" + String(myTimelineArr[index.row].timelineId))
        let nextVC = storyboard?.instantiateViewController(withIdentifier: "idMyTimelineDialogVC")as! MyTimelineDialogVC
        nextVC.mytimelinearr = myTimelineArr[index.row]
        nextVC.view.backgroundColor = UIColor.black.withAlphaComponent(0.7)
        addChild(nextVC)
        view.addSubview(nextVC.view)
        
        
    }
    
    func doclicksave(index: IndexPath) {
        print("save")
    }
    
    func doclickprofile(index: IndexPath) {
        print("profile")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return myTimelineArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        if myTimelineArr[indexPath.row].postTypeFlag == "1"{
            let cell = tbvMyTimeline.dequeueReusableCell(withIdentifier: itemcell2, for: indexPath)as! TimelineWithOutImageCell
            utils.setImageFromUrl(imageView: cell.ivUserProfile, urlString: myTimelineArr[indexPath.row].userProfilePicture)
            cell.lblUserName.text = myTimelineArr[indexPath.row].userName
            cell.lblAbout.text = myTimelineArr[indexPath.row].timelineAbout
            cell.ivUserProfile.cornerRadius = cell.ivUserProfile.frame.width/2
            return cell
        }else if myTimelineArr[indexPath.row].postTypeFlag == "0"{
            let cell = tbvMyTimeline.dequeueReusableCell(withIdentifier: itemcell, for: indexPath)as! TimelineCell
            cell.lblUserName.text = myTimelineArr[indexPath.row].userName
            cell.lblAbout.text = myTimelineArr[indexPath.row].timelineAbout
            cell.ivUserProfile.cornerRadius = cell.ivUserProfile.frame.width/2
            utils.setImageFromUrl(imageView: cell.ivUserProfile, urlString: myTimelineArr[indexPath.row].userProfilePicture)
            cell.setImage(imgArr: myTimelineArr[indexPath.row].timelineImage)
            cell.data = self
            cell.index = indexPath
            return cell
        }
        
        return cell
    }
    
    
    
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return "Timeline"
    }
    
    
}
