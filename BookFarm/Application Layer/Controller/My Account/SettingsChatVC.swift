//
//  SettingsChatVC.swift
//  BookFarm
//
//  Created by Hardik on 2/17/20.
//  Copyright © 2020 Mac. All rights reserved.
//

import UIKit

class SettingsChatVC: UIViewController {
    let itemcell = "SettingsChatVC"

    @IBOutlet weak var tbvSettingChat: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib(nibName: itemcell, bundle: nil)
        tbvSettingChat.register(nib, forCellReuseIdentifier: itemcell)
        tbvSettingChat.delegate = self
        tbvSettingChat.dataSource = self

       
    }
    

}
extension SettingsChatVC : UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tbvSettingChat.dequeueReusableCell(withIdentifier: itemcell, for: indexPath)as! SettingsChatCell
        return cell
    }
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    
    
}
