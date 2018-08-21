//
//  AddHostsViewController.swift
//  Milu
//
//  Created by Admin on 8/21/18.
//  Copyright © 2018 Admintest. All rights reserved.
//

import UIKit

class AddHostsViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var searchView: UIView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchField: UITextField!
    @IBOutlet weak var headerView: UIVisualEffectView!
    
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
        
        self.hideKeyboardOnTap()
        
        searchField.attributedPlaceholder = NSAttributedString(string: "type a name or handle",
                                                                        attributes: [NSAttributedStringKey.foregroundColor: UIColor.lightGray])
        
    }

    @IBAction func didTapBack(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 15
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 52
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let vw = UIView()
        vw.backgroundColor = UIColor.clear
        
        return vw
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell :UITableViewCell
        
        let hostCell = tableView.dequeueReusableCell(withIdentifier: "HostItemTableViewCell", for: indexPath as IndexPath) as! HostItemTableViewCell
        hostCell.button.tag = indexPath.row
        hostCell.button.addTarget(self, action: #selector(didTapOnButton(button:)), for: .touchUpInside)
        cell = hostCell
        
        return cell
    }
    
    @objc func didTapOnButton(button: UIButton){
       
        let cell = tableView.cellForRow(at: IndexPath.init(row: button.tag, section: 0)) as! HostItemTableViewCell
        
        if cell.checkImageView.image == UIImage(named: "path_inactive") {
            cell.checkImageView.image = UIImage(named: "path")
        }else{
            cell.checkImageView.image = UIImage(named: "path_inactive")
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
//        var rect : CGRect = self.searchView.frame
//        rect.origin.y += previousOffset - scrollView.contentOffset.y
//        previousOffset = scrollView.contentOffset.y
//
//        self.searchView.frame = CGRect(x: rect.origin.x, y: rect.origin.y, width: self.view.frame.width, height: searchView.frame.height)
    }
    
}
