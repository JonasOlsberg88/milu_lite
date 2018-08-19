//
//  EventHostViewController.swift
//  Milu
//
//  Created by Admin on 8/19/18.
//  Copyright © 2018 Admintest. All rights reserved.
//

import UIKit

class EventHostViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
   
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

    }
    
    override var preferredStatusBarStyle : UIStatusBarStyle {
        return .lightContent
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        switch indexPath.row {
        case 0:
            return self.view.bounds.width * 223/320 + 20
        case 1:
            return 80
        default:
            break
        }
        
        return 290
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
        
        switch indexPath.row {
        case 0:
            
            let headerCell = tableView.dequeueReusableCell(withIdentifier: "EventHostHeaderTableViewCell", for: indexPath as IndexPath) as! EventHostHeaderTableViewCell
//            posterCell.posterButton.addTarget(self, action: #selector(goPosterView(button:)), for: .touchUpInside)
//            posterCell.liveButton.addTarget(self, action: #selector(goLive(button:)), for: .touchUpInside)
            cell = headerCell
            break
        case 1:
            
            let timeCell = tableView.dequeueReusableCell(withIdentifier: "EventTImeCell", for: indexPath as IndexPath) as! EventTImeCell
            cell = timeCell
            break
        default:
            cell = tableView.dequeueReusableCell(withIdentifier: "EventHostHeaderTableViewCell", for: indexPath as IndexPath) as! EventHostHeaderTableViewCell
            break
        }
        
        return cell
    }

}

