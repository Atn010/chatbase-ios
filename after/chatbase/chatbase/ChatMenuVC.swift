//
//  ChatMenuVC.swift
//  chatbase
//
//  Created by Antonius George S on 09/12/20.
//

import UIKit

class ChatMenuVC: UITableViewController {
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.title = "Bot Menu"
        self.view.backgroundColor = UIColor.secondarySystemBackground
        
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 44
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
         return UITableView.automaticDimension
    }

    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            let vc = ChatVC.init()
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
}

