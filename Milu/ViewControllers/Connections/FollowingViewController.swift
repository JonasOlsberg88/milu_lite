//
//  FollowingViewController.swift
//  Milu
//
//  Created by Admin on 8/23/18.
//  Copyright © 2018 Admintest. All rights reserved.
//

import UIKit

class FollowingViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var tabIndexView: SCTableIndex!
    
    var indexSections = ["A","B","D","E","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z","#"]
    
    var sections = ["A","C","H","I"]
    var sectionDict = [String:[String]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initData()
        let nib = UINib(nibName: "ConnectionsHeader", bundle: nil)
        tableView.register(nib, forHeaderFooterViewReuseIdentifier: "ConnectionsHeader")
        tabIndexView.setView(indexSections)
        tabIndexView.delegate = self
        // Do any additional setup after loading the view.
    }
    
    func initData(){
        
        sectionDict["a"] = ["beau beuler","abe abbot","adam alexander","austin adams"]
        sectionDict["c"] = ["amanda angles","alexandra alman","harvey specter"]
        sectionDict["h"] = ["austin adams","abe abbot","adam alexander","beau beuler"]
        sectionDict["i"] = ["beau beuler","adam alexander","abe abbot","austin adams"]
    }
    
    

    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        let key = sections[section].lowercased()
        if let values = sectionDict[key]{
            return values.count
        }
        
        return 0
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        // Dequeue with the reuse identifier
        let cell = self.tableView.dequeueReusableHeaderFooterView(withIdentifier: "ConnectionsHeader")
        let header = cell as! ConnectionsHeader
        header.titleLabel.text = sections[section].uppercased()
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 52
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
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "FollowingTableViewCell", for: indexPath as IndexPath) as! FollowingTableViewCell
       
        
        cell.fullNameLabel.text = sectionDict[sections[indexPath.section].lowercased()]![indexPath.row]
        cell.userNameLabel.text = sectionDict[sections[indexPath.section].lowercased()]![indexPath.row].replacingOccurrences(of: " ", with: "")
        cell.followButton.setTitle("UNFOLLOW", for: .normal)
        cell.divider.isHidden = false
        if (sectionDict[sections[indexPath.section].lowercased()]?.count)!-1 == indexPath.row{
            cell.divider.isHidden = true
        }
        
        return cell
    }
    
}

extension FollowingViewController: SCTableIndexDelegate {
    // Move starting point item that select initial text
    func scTableIndexReturnInitialText(_ strInitial: String, index: Int) {
        
        if sections.contains(indexSections[index]) {
            
            
            tableView.scrollToRow(at: IndexPath(row: 0, section: sections.index(of: indexSections[index])!), at: .top, animated: true)
           
        }
        
        
    }
}

