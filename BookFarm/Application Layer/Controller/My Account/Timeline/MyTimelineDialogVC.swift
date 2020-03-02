//
//  MyTimelineDialogVC.swift
//  BookFarm
//
//  Created by Hardik on 3/2/20.
//  Copyright © 2020 Mac. All rights reserved.
//

import UIKit

class MyTimelineDialogVC: UIViewController {
    var mytimelinearr : Timeline!
    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
    
    @IBAction func onClickBackground(_ sender: Any) {
        removeFromParent()
        view.removeFromSuperview()
    }
    
    @IBAction func onClickDelete(_ sender: Any) {
        doDeleteTimeline()
    }
    func doDeleteTimeline()  {
        print("param"+mytimelinearr.timelineId!)
        let param = ["user_timeline_delete":"user_timeline_delete",
                     "timeline_id": mytimelinearr.timelineId!]
        let request = AlamofireSingleTon.sharedInstance
        
        request.requestPost(serviceName: ServiceNameConstants.deleteTimelineController, parameters: param) { (Data, error) in
            if Data != nil{
                do{
                    let response = try JSONDecoder().decode(TimelineResponse.self, from: Data!)
                    if response.status == "200"{
                        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "idMyTimelineAccountVC") as! MyTimelineAccountVC
                                //   let appDelegate = UIApplication.shared.delegate as! AppDelegate
                                // appDelegate.window?.rootViewController = testController
                                 let nav : UINavigationController = UINavigationController()
                                 nav.viewControllers  = [vc]
                                 nav.isNavigationBarHidden = true
                                 
                                 UIApplication.shared.windows.first?.rootViewController = nav
                                 UIApplication.shared.windows.first?.makeKeyAndVisible()
                    }else{
                        print("response 201")
                    }
                    
                }catch{
                    print("parse error" as Any)
                    
                }
            }else{
                print("error" as Any)
            }
        }
        
    }
}
