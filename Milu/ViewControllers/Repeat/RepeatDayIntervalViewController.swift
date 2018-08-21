//
//  RepeatIntervalViewController.swift
//  Milu
//
//  Created by Admin on 8/21/18.
//  Copyright © 2018 Admintest. All rights reserved.
//

import UIKit

class RepeatDayIntervalViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var hearderView: UIVisualEffectView!
    @IBOutlet weak var tableView: UITableView!
    
    var dayInterval = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initView()
       
    }
   
    override var preferredStatusBarStyle : UIStatusBarStyle {
        return .lightContent
    }
    
    func initView(){
        
        self.hearderView.layer.shadowOffset = CGSize(width: 0, height: 3)
        self.hearderView.layer.shadowRadius = 2
        self.hearderView.layer.shadowOpacity = 0.24
        self.hearderView.layer.shadowColor = UIColor.black.cgColor
        
    }
    
    @IBAction func didTapBack(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 12
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let vw = UIView()
        vw.backgroundColor = UIColor.clear
        
        return vw
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell :UITableViewCell
        
        let intervalCell = tableView.dequeueReusableCell(withIdentifier: "RepeatIntervalTableViewCell", for: indexPath as IndexPath) as! RepeatIntervalTableViewCell
        
        if indexPath.row == self.dayInterval-1 {
            intervalCell.checkImageView.isHidden = false
        }else{
            intervalCell.checkImageView.isHidden = true
        }
        if indexPath.row > 0 {
            intervalCell.intervalItemLabel.text = "\(indexPath.row + 1) days"
        }else{
            intervalCell.intervalItemLabel.text = "\(indexPath.row + 1) day"
        }
        
        cell = intervalCell
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        self.dayInterval = indexPath.row + 1
        self.tableView.reloadData()
    }
}
