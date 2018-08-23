//
//  GroupsViewController.swift
//  Milu
//
//  Created by Admin on 8/23/18.
//  Copyright © 2018 Admintest. All rights reserved.
//

import UIKit

class GroupsViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    var sections = ["friends","dickey park ultimate frisbee"]
    var counts = [256,144]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let nib = UINib(nibName: "GroupsHeader", bundle: nil)
        tableView.register(nib, forHeaderFooterViewReuseIdentifier: "GroupsHeader")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 36
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        // Dequeue with the reuse identifier
        let cell = self.tableView.dequeueReusableHeaderFooterView(withIdentifier: "GroupsHeader")
        let header = cell as! GroupsHeader
        header.titleLabel.text = sections[section]
        header.countLabel.text = "\(counts[section])"
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
         return self.view.frame.width/3
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        
        //        if sections.count-1 == section {
        //            return 52
        //        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let vw = UIView()
        vw.backgroundColor = UIColor.clear
        return vw
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell :UITableViewCell
        
        if indexPath.section == 0 {
            let friendsCell = tableView.dequeueReusableCell(withIdentifier: "GroupsFriendsTableViewCell", for: indexPath as IndexPath) as! GroupsFriendsTableViewCell
            cell = friendsCell
        }else{
            let otherCell = tableView.dequeueReusableCell(withIdentifier: "GroupsSecondTableViewCell", for: indexPath as IndexPath) as! GroupsSecondTableViewCell
            cell = otherCell
        }        
        return cell
    }

   
}
