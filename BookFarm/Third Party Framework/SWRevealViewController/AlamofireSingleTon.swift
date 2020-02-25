//
//  AlamofireSingleTon.swift
//  MadesInQatar
//
//  Created by anjali on 19/12/18.
//  Copyright © 2018 anjali. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class AlamofireSingleTon: NSObject {
    // let baseUer = "https://www.silverwingtechnologies.com/products/bms/resident_api/"
    
  //  let baseUer = "https://www.fincasys.com/resident_api/"
    

    
    
  //  let baseUer = UserDefaults.standard.string(forKey: StringConstants.KEY_BASE_URL)! + "resident_api/"
    
   
   let mainUrl = "https://www.fincasys.com/main_api/"
    
    
    
     static let sharedInstance = AlamofireSingleTon()

    func requestPost(serviceName:String,parameters: [String:Any]?, completionHandler: @escaping (Data?, NSError?) -> ()) {
        let baseUer = BaseVC().baseurl
 
        Alamofire.request(baseUer+serviceName, method: .post, parameters: parameters, encoding: URLEncoding.default, headers: nil).responseJSON { (response:DataResponse<Any>) in
            
            switch(response.result) {
                
            case .success(_):
                
                if response.result.value != nil{
                    let json = JSON(response.data!)
                    print("json data" , json)
                    completionHandler(response.data,nil)
                }
                break
                
            case .failure(_):
                completionHandler(nil,response.result.error as NSError?)
                break
                
            }
        }
    }
    
    func requestPostMain(serviceName:String,parameters: [String:Any]?, completionHandler: @escaping (Data?, NSError?) -> ()) {
       
        print("hgsdh" , mainUrl+serviceName)
        Alamofire.request(mainUrl+serviceName, method: .post, parameters: parameters, encoding: URLEncoding.default, headers: nil).responseJSON { (response:DataResponse<Any>) in
            
            switch(response.result) {
                
            case .success(_):
                if response.result.value != nil{
                    let json = JSON(response.data!)
                    print("json data" , json)
                    completionHandler(response.data,nil)
                }
                break
                
            case .failure(_):
                completionHandler(nil,response.result.error as NSError?)
                break
                
            }
        }
    }
    func requestPostMultipart(serviceName:String,parameters: [String:Any]?,imagesArray:[UIImage],compression :CGFloat!,paramName:String!, completionHandler: @escaping (Data?, NSError?) -> ()) {
        let baseUer = "http://localhost:8080/BookFarm/"
        print(parameters as Any)
        
        Alamofire.upload(multipartFormData: { multipartFormData in
            for (key,value) in parameters! {
                if let value = value as? String {
                    multipartFormData.append(value.data(using: String.Encoding.utf8)!, withName: key)
                }
            }
            print("image array size",imagesArray.count)
            for image in imagesArray {
                if  let imageData = image.jpegData(compressionQuality:compression) {
                    multipartFormData.append(imageData, withName: paramName, fileName: "xyz", mimeType: "image/*")
                }
            }
        },
        to:baseUer+serviceName)
        { (result) in
            switch result {
            case .success(let upload, _, _):
                upload.responseJSON { response in
                    print(response.data)
                    print("error in api call",response.result.error as NSError?)
                    if response.result.value != nil{
                        let json = JSON(response.data!)
                        print("json data" , json)
                        completionHandler(response.data,response.result.error as NSError?)
                    }else{
                        
                    }
                }
                break
                
            case .failure(let encodingError):
                completionHandler(nil,encodingError as NSError)
                print("fail" , encodingError)
            }
        }
    }
//    func requestPostMultipart(serviceName:String,parameters: [String:Any]?, completionHandler: @escaping (Data?, NSError?) -> ()) {
//        let baseUer = BaseVC().baseUrl()
//
//        Alamofire.upload(.POST,URlString:baseUer+serviceName,multipartFormData:{
//            multi in
//            MultipartFormData.app
//        })
//
//        Alamofire.upload(multipartFormData: { (MultipartFormData) in
//            MultipartFormData.append(<#T##data: Data##Data#>, withName: <#T##String#>)
//        }, usingThreshold: <#T##UInt64#>, to: <#T##URLConvertible#>, method: <#T##HTTPMethod#>, headers: <#T##HTTPHeaders?#>, encodingCompletion: <#T##((SessionManager.MultipartFormDataEncodingResult) -> Void)?##((SessionManager.MultipartFormDataEncodingResult) -> Void)?##(SessionManager.MultipartFormDataEncodingResult) -> Void#>)
//
//        Alamofire.request(baseUer+serviceName, method: .post, parameters: parameters, encoding: URLEncoding.default, headers: nil).responseJSON { (response:DataResponse<Any>) in
//
//            switch(response.result) {
//
//            case .success(_):
//
//                if response.result.value != nil{
//                    let json = JSON(response.data!)
//                    print("json data" , json)
//                    completionHandler(response.data,nil)
//                }
//                break
//
//            case .failure(_):
//                completionHandler(nil,response.result.error as NSError?)
//                break
//
//            }
//        }
//    }
    
}



// api call

//func doLoadPersonalFeed(){
//    showProgress()
//    let params = ["key":ServiceNameConstants.API_KEY,
//                  "getMyFeed":"getMyFeed",
//                  "society_id":memMainResponse.societyId!,
//                  "user_id":memMainResponse.userId!,
//                  "unit_id":memMainResponse.unitId!,
//                  "user_name":memMainResponse.userFullName!,
//                  "block_name":memMainResponse.blockName!]
//
//    print("param" , params)
//
//    let request = AlamofireSingleTon.sharedInstance
//
//    request.requestPost(serviceName: ServiceNameConstants.newsFeedController, parameters: params) { (json, error) in
//        self.hideProgress()
//        if json != nil {
//            do {
//                let response = try JSONDecoder().decode(FeedResponse.self, from:json!)
//                if response.status == "200" {
//                    self.feedArray.append(contentsOf: response.feed)
//                    self.tbvTimeline.reloadData()
//                }else {
//
//                }
//            } catch {
//                print("parse error")
//            }
//        }
//    }
//}
