//
//  AddInviteViewController.swift
//  Milu
//
//  Created by Admin on 8/21/18.
//  Copyright © 2018 Admintest. All rights reserved.
//

import UIKit

class AddInviteViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate {

    @IBOutlet weak var searchField: UITextField!
    @IBOutlet weak var headerView: UIVisualEffectView!
    @IBOutlet weak var searchView: UIView!
    @IBOutlet weak var tableView: UITableView!
    
    var previousOffset:CGFloat = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
        // Do any additional setup after loading the view.
    }

    override var preferredStatusBarStyle : UIStatusBarStyle {
        return .lightContent
    }
    
    func initView(){
        self.headerView.layer.shadowOffset = CGSize(width: 0, height: 3)
        self.headerView.layer.shadowRadius = 2
        self.headerView.layer.shadowOpacity = 0.24
        self.headerView.layer.shadowColor = UIColor.black.cgColor
        
      //  self.hideKeyboardOnTap()
        
        searchField.attributedPlaceholder = NSAttributedString(string: "type a group, a name or handle",
                                                               attributes: [NSAttributedStringKey.foregroundColor: UIColor.lightGray])
        
    }

    @IBAction func didTapBack(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 52
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 35
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let vw = UIView()
        vw.backgroundColor = UIColor.clear
        let label = UILabel()
        if section == 0 {
            label.text = "groups"
        }else{
            label.text = "all connections"
        }
        
        label.frame = CGRect(x: 0, y: 0, width: self.view.frame.width - 36, height: 36)
        label.center = CGPoint(x: self.view.frame.width/2, y: 18)
        label.textColor = UIColor.white
        label.alpha = 0.7
        label.font = UIFont(name: "Montserrat-Regular", size: 16)!
        vw.addSubview(label)
        
        return vw
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell :UITableViewCell
        
        let hostCell = tableView.dequeueReusableCell(withIdentifier: "HostItemTableViewCell", for: indexPath as IndexPath) as! HostItemTableViewCell
        hostCell.button.tag = indexPath.row
        cell = hostCell
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let cell = tableView.cellForRow(at: indexPath) as! HostItemTableViewCell
        if cell.checkImageView.image == UIImage(named: "path_inactive") {
            cell.checkImageView.image = UIImage(named: "path")
        }else{
            cell.checkImageView.image = UIImage(named: "path_inactive")
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return true
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
//        var rect : CGRect = self.searchView.frame
//        rect.origin.y += previousOffset - scrollView.contentOffset.y
//        previousOffset = scrollView.contentOffset.y
//        
//        self.searchView.frame = CGRect(x: rect.origin.x, y: rect.origin.y, width: self.view.frame.width, height: searchView.frame.height)
    }
}
