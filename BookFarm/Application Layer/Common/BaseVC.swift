//
//  BaseVC.swift
//  BookFarm
//
//  Created by Mac on 18/12/19.
//  Copyright © 2019 Mac. All rights reserved.
//

import  UIKit
import Kingfisher
class BaseVC: UIViewController, SWRevealViewControllerDelegate {
    let overlyView = UIView()
    let baseurl = "http://192.168.64.2/BookFarm/"
    public let refreshControl = UIRefreshControl()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    func dogetlocaldatauser() -> LoginResponse {
        var userLocalData : LoginResponse? = nil
        
        if let data = UserDefaults.standard.data(forKey: ConstantStrings.LoginDone), let decode = try? JSONDecoder().decode(LoginResponse.self, from: data ){
            userLocalData = decode
        }
        return userLocalData!
        
    }
    func dogetforgotpassword() -> LoginResponse {
        var userLocalData : LoginResponse? = nil
        
        if let data = UserDefaults.standard.data(forKey: ""), let decode = try? JSONDecoder().decode(LoginResponse.self, from: data ){
            userLocalData = decode
        }
        return userLocalData!
        
    }
    func dogetbookdatauser() -> Book {
        var bookLocalData : Book? = nil
        
        if let data = UserDefaults.standard.data(forKey: ConstantStrings.LoginDone), let decode = try? JSONDecoder().decode(Book.self, from: data ){
            bookLocalData = decode
        }
        return bookLocalData!
        
    }
    
 func hideKeyboardOnTouch() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard (_:)))
        self.view.addGestureRecognizer(tapGesture)
    }
    
    @objc func dismissKeyboard (_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
  
    func convertImageToBase64(imageview: UIImageView) -> String{
        let imageData = imageview.image?.jpegData(compressionQuality: 0.25)
        let strBase64 = imageData!.base64EncodedString(options: .lineLength64Characters)
        return strBase64
        
    }
    func doAddSlideMenuToController(bMenu:UIButton) {
        revealViewController().delegate = self
        if self.revealViewController() != nil {
            bMenu.addTarget(self.revealViewController(), action: #selector(SWRevealViewController.revealToggle(_:)), for: .touchUpInside)
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
    }
    
    func revealController(_ revealController: SWRevealViewController!, willMoveTo position: FrontViewPosition) {
        
        if revealController.frontViewPosition == FrontViewPosition.left     // if it not statisfy try this --> if
        {
            overlyView.frame = CGRect(x: 0, y: 60, width: self.view.frame.size.width, height: self.view.frame.size.height)
            //overlyView.backgroundColor = UIColor.red
            self.view.addSubview(overlyView)
            //self.view.isUserInteractionEnabled = false
        }
        else
        {
            overlyView.removeFromSuperview()
            //self.view.isUserInteractionEnabled = true
        }
    }
    
    func addRefreshControlTo(collectionView : UICollectionView){
        if #available(iOS 10.0, *) {
            collectionView.refreshControl = refreshControl
        } else {
            collectionView.addSubview(refreshControl)
        }
        refreshControl.addTarget(self, action: #selector(pullToRefreshData(_:)), for: .valueChanged)
    }
    
    func addRefreshControlTo(tableView:UITableView){
        if #available(iOS 10.0, *) {
            tableView.refreshControl = refreshControl
        } else {
            tableView.addSubview(refreshControl)
        }
        refreshControl.addTarget(self, action: #selector(pullToRefreshData(_:)), for: .valueChanged)
        
    }
    
    @objc func pullToRefreshData(_ sender:Any){
        fetchNewDataOnRefresh()
    }
    func fetchNewDataOnRefresh(){
        refreshControl.beginRefreshing()
//        AllBookArray.removeAll()
//        docallAllBookApi()
//        doapicategorycall()
        refreshControl.endRefreshing()
    }
    
    
//    func toast(message:String!,type:Int!){
//        switch (type) {
//            case 0: //success toast
//            self.view.makeToast(message,duration:2,position:.bottom,style:self.successStyle)
//            break;
//            case 1: //faliure toast
//            self.view.makeToast(message,duration:2,position:.bottom,style:self.failureStyle)
//            break;
//            case 2: //warning toast
//            self.view.makeToast(message,duration:2,position:.bottom,style:self.warningStyle)
//            break;
//            case 3: //info toast
//            self.view.makeToast(message,duration:2,position:.bottom,style:self.infoStyle)
//            break;
//            default:
//            break;
//        }
//    }

}
extension Date{
    var milisecondsSince1970 : Int64{
        return Int64((self.timeIntervalSince1970 * 1000.0).rounded())
    }
    init(miliseconds:Int) {
        self = Date(timeIntervalSince1970: TimeInterval(miliseconds / 1000))
    }
    
}

