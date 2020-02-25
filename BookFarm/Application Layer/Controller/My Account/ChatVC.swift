//
//  ChatVC.swift
//  BookFarm
//
//  Created by Hardik on 2/6/20.
//  Copyright © 2020 Mac. All rights reserved.
//

import UIKit
struct Chat {
    let message : String!
}

class ChatVC: UIViewController {
    let itemCell = "chatCell"
    @IBOutlet weak var ivProfile: UIImageView!
    @IBOutlet weak var lblname: UILabel!
    @IBOutlet weak var tfMessage: UITextField!
    @IBOutlet weak var tbvChat: UITableView!
    var ChatArr = [Chat]()
    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib(nibName: itemCell, bundle:nil)
        tbvChat.register(nib, forCellReuseIdentifier: itemCell)
        tbvChat.delegate = self
        tbvChat.dataSource = self
        ivProfile.layer.cornerRadius = ivProfile.frame.width/2
    }
    
    @IBAction func onClickSend(_ sender: Any) {
        ChatArr.append(Chat(message: tfMessage.text!))
        tbvChat.reloadData()
        tfMessage.text = nil
    }
    
    @IBAction func onClickBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}

extension ChatVC : UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ChatArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tbvChat.dequeueReusableCell(withIdentifier: itemCell, for: indexPath)as! chatCell
        cell.lblMessage.text = ChatArr[indexPath.row].message
        return cell
    }

     func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
           return UITableView.automaticDimension
        }
        func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
           return UITableView.automaticDimension
        }
    
}
