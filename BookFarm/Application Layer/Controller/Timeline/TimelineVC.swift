//
//  TimelineVC.swift
//  BookFarm
//
//  Created by Hardik on 2/13/20.
//  Copyright © 2020 Mac. All rights reserved.
//

import UIKit
import  YPImagePicker

class TimelineVC: BaseVC {
    let itemcell = "TimelineCell"
    let itemcell2 = "TimelineWithOutImageCell"
    @IBOutlet weak var tbvTimeline: UITableView!
    @IBOutlet weak var viewPlus: UIView!
    var timelineList = [Timeline]()
//    {
//        didSet{
//            tbvTimeline.reloadData()
//        }
//    }
    var selecteimages = [UIImage]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib(nibName: itemcell, bundle: nil)
        tbvTimeline.register(nib, forCellReuseIdentifier: itemcell)
        
        let nib2 = UINib(nibName: itemcell2, bundle: nil)
        tbvTimeline.register(nib2, forCellReuseIdentifier: itemcell2)
        tbvTimeline.delegate = self
        tbvTimeline.dataSource = self
        viewPlus.layer.cornerRadius = viewPlus.frame.width/2
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(handleGesture))
        swipeRight.direction = .right
        self.view.addGestureRecognizer(swipeRight)
        
        
        addRefreshControlTo(tableView: tbvTimeline)
        
    }
    
    override func fetchNewDataOnRefresh(){
            refreshControl.beginRefreshing()
            timelineList.removeAll()
            doTimelineAPI()
            tbvTimeline.reloadData()
            refreshControl.endRefreshing()
        }
        
        
    override func viewWillAppear(_ animated: Bool) {
        doTimelineAPI()
        tbvTimeline.estimatedRowHeight = UITableView.automaticDimension
       // tbvTimeline.rowHeight = UITableView.automaticDimension
        tbvTimeline.reloadData()
        
    }
    
    func doTimelineAPI() {
        let param = ["selectAllTimelines":"selectAllTimelines"]
        let request = AlamofireSingleTon.sharedInstance
        
        request.requestPostMultipart(serviceName: ServiceNameConstants.Timeline, parameters: param , imagesArray: selecteimages, compression: 0, paramName: "photo[]") { (json, error) in
            if json != nil{
                print("Data" as Any)
                do{
                    print(json as Any)
                    let response = try JSONDecoder().decode(TimelineResponse.self, from: json!)
                    if response.status == "200"{
                        print(response.status as Any)
                        self.timelineList = response.timeline
                        self.timelineList.reverse()
                        self.tbvTimeline.reloadData()
                        
                    }else{
                        print("Error" as Any)
                    }
                }catch{
                    print("Parse Error" as Any)
                    
                }
                
            }
        }
    }
    
    
    @objc func handleGesture(gesture: UISwipeGestureRecognizer) -> Void {
        if gesture.direction == .right {
            for nextVC in self.navigationController!.viewControllers as Array{
                if nextVC.isKind(of: TabBarVC.self){
                    self.navigationController?.popToViewController(nextVC, animated: true)
                    break
                }
            }
        }
    }
    @IBAction func onClickPlus(_ sender: Any) {
        let nextVC = storyboard?.instantiateViewController(withIdentifier: "idTimelinePostVC")as! TimelinePostVC
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
}
extension TimelineVC : UITableViewDelegate,UITableViewDataSource,OnClicktimeline{
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
       let nextVC = storyboard?.instantiateViewController(withIdentifier: "idtimelineDialogVC")as! timelineDialogVC
        nextVC.dialogarr = timelineList[index.row]
        nextVC.view.backgroundColor = UIColor.black.withAlphaComponent(0.7)
        addChild(nextVC)
        view.addSubview(nextVC.view)
    }
    
    func doclicksave(index: IndexPath) {
        print("save")
    }
    
    func doclickprofile(index: IndexPath) {
        if timelineList[index.row].postTypeFlag == "1"{
        let nextVC = storyboard?.instantiateViewController(withIdentifier: "idTimelineProfileDetailsVC")as! TimelineProfileDetailsVC
        nextVC.detailsArr = timelineList[index.row]
        //print( timelineList  as Any)
        nextVC.imgArr = selecteimages
        self.navigationController?.pushViewController(nextVC, animated: true)
        }else if timelineList[index.row].postTypeFlag == "0"{
                   let nextVC = storyboard?.instantiateViewController(withIdentifier: "idTimelineProfileDetailsVC")as! TimelineProfileDetailsVC
                   nextVC.detailsArr = timelineList[index.row]
                   //print( timelineList  as Any)
                   nextVC.imgArr = selecteimages
                   self.navigationController?.pushViewController(nextVC, animated: true)
            
            
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("timeline count",timelineList.count)
        return timelineList.count
        
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        if timelineList[indexPath.row].postTypeFlag == "1"{
            let cell = tbvTimeline.dequeueReusableCell(withIdentifier: itemcell2, for: indexPath)as! TimelineWithOutImageCell
            utils.setImageFromUrl(imageView: cell.ivUserProfile, urlString: timelineList[indexPath.row].userProfilePicture)
            cell.lblUserName.text = timelineList[indexPath.row].userName
            cell.lblAbout.text = timelineList[indexPath.row].timelineAbout
            cell.ivUserProfile.cornerRadius = cell.ivUserProfile.frame.width/2
            cell.data = self
            cell.index = indexPath
            return cell
            
            
        }else if timelineList[indexPath.row].postTypeFlag == "0"{
            
            
             let cell = tbvTimeline.dequeueReusableCell(withIdentifier: itemcell, for: indexPath)as! TimelineCell
            cell.lblUserName.text = timelineList[indexPath.row].userName
            cell.lblAbout.text = timelineList[indexPath.row].timelineAbout
            cell.setImage(imgArr: timelineList[indexPath.row].timelineImage)
            utils.setImageFromUrl(imageView: cell.ivUserProfile, urlString: timelineList[indexPath.row].userProfilePicture)
            cell.lblAbout.text = timelineList[indexPath.row].timelineAbout
            cell.ivUserProfile.cornerRadius = cell.ivUserProfile.frame.width/2
            cell.data = self
            cell.index = indexPath
             cell.pagerCount.numberOfPages = cell.selecteimage.count
            return cell
        }
    
//        cell.ivUserProfile.layer.cornerRadius = cell.ivUserProfile.frame.width/2
////        cell.imgArr = timelineList[indexPath.row].timelineImage
////        utils.setImageFromUrl(imageView: cell.ivUserProfile, urlString: timelineList[indexPath.row].profileImage)
//        cell.pagerCount.numberOfPages = cell.selecteimage.count
//        cell.data = self
//        cell.index = indexPath
       // cell.onClicktimeline = self
        
      
        
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
         return UITableView.automaticDimension
    }
    
    
}

