//
//  AllCategoryVC.swift
//  BookFarm
//
//  Created by Mac on 18/12/19.
//  Copyright © 2019 Mac. All rights reserved.
//

import UIKit

class AllCategoryVC: UIViewController {
    var arrcategory = [Category]()
    let itemcell = "AllCategoryBookCell"
    @IBOutlet weak var tblAllcategory: UITableView!
    //   var book = ["horror","love story","cooking","comic","animal","art","education","geography","medical"]
    var Bookimage = [#imageLiteral(resourceName: "agricultur"),#imageLiteral(resourceName: "art & photography"),#imageLiteral(resourceName: "Comedy"),#imageLiteral(resourceName: "Horror-1"),#imageLiteral(resourceName: "add book"),#imageLiteral(resourceName: "medical"),#imageLiteral(resourceName: "love story"),#imageLiteral(resourceName: "ChildrenBook"),#imageLiteral(resourceName: "business"),#imageLiteral(resourceName: "home")]
    var colourbackground = [#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1),#colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1),#colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1),#colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1),#colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1),#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1),#colorLiteral(red: 0.9411764741, green: 0.4980392158, blue: 0.3529411852, alpha: 1),#colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1),#colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1),#colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1),#colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1),#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1),#colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1),#colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1),#colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1),#colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1),#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1),#colorLiteral(red: 0.9411764741, green: 0.4980392158, blue: 0.3529411852, alpha: 1),#colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1),#colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1),#colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1),#colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1),#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1),#colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1),#colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1),#colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1),#colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1),#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1),#colorLiteral(red: 0.9411764741, green: 0.4980392158, blue: 0.3529411852, alpha: 1),#colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1),#colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1),#colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1),#colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1),#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1),#colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1),#colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1),#colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1),#colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1),#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1),#colorLiteral(red: 0.9411764741, green: 0.4980392158, blue: 0.3529411852, alpha: 1),#colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1),#colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1),#colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1),#colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)]
    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib(nibName: itemcell, bundle: nil)
        tblAllcategory.register(nib, forCellReuseIdentifier: itemcell)
        tblAllcategory.dataSource = self
        tblAllcategory.delegate = self
        doapicategorycall()
    }
    @IBAction func onClickBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    func doapicategorycall(){
        
        let params = ["getAllCategories": "getAllCategories"]
        
        
        print("param" , params)
        
        let request = AlamofireSingleTon.sharedInstance
        
        request.requestPost(serviceName: ServiceNameConstants.bookcategory, parameters: params) { (json, error) in
            
            if json != nil {
                do {
                    print(json as Any)
                    let response = try JSONDecoder().decode(CategoryResponse.self, from:json!)
                    
                    if response.status == 200 {
                        self.arrcategory.append(contentsOf: response.categories)
                        
                        self.tblAllcategory.reloadData()
                        
                    }else {
                        
                    }
                } catch {
                    print("parse error")
                    
                }
            }else{
                print("error",json)
            }
        }
        
        
    }
    
}

extension AllCategoryVC : UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "idCategoryViseBookVC")as! CategoryViseBookVC
        nextVC.categoryArr = arrcategory[indexPath.row]
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrcategory.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tblAllcategory.dequeueReusableCell(withIdentifier: itemcell, for: indexPath)as!AllCategoryBookCell
        cell.lblAllCateroryCell.text = arrcategory[indexPath.item].catName
//        cell.imgAllCategoryCell.image = Bookimage[indexPath.row]
//        utils.setImageFromUrl(imageView: cell.imgAllCategoryCell!.image, urlString: arrcategory )
        utils.setImageFromUrl(imageView: cell.imgAllCategoryCell, urlString: arrcategory[indexPath.row].catIcon)
        cell.IMGview.backgroundColor = colourbackground[indexPath.row]
        cell.IMGview.layer.cornerRadius = 20
        cell.IMGview.layer.borderColor = #colorLiteral(red: 0.1294117719, green: 0.2156862766, blue: 0.06666667014, alpha: 1)
        cell.IMGview.layer.borderWidth = 1
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
        
    }
    
    
}
