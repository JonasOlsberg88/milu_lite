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
    @IBOutlet weak var bgImageView: UIImageView!
    
    var previousOffset:CGFloat = 0
    override func viewDidLoad() {
        super.viewDidLoad()
    }
   
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.bgImageView.frame = CGRect(x: self.bgImageView.frame.origin.x, y: self.bgImageView.frame.origin.y, width: self.bgImageView.frame.width, height: self.tableView.contentSize.height)
    }
    
    override var preferredStatusBarStyle : UIStatusBarStyle {
        return .lightContent
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 11
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        switch indexPath.row {
        case 0:
            return self.view.bounds.width * 223/320
        case 1:
            return 42
        case 2:
            return UITableViewAutomaticDimension
        case 3:
            return 44
        case 4:
            return 60
        case 5:
            return 60
        case 6:
            return 134
        case 7:
            return 44
        case 8:
            return UITableViewAutomaticDimension
        case 9:
            return 136
        case 10:
            return 78 * 3 + 36
        default:
            break
        }
        
        return 390
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
        case 2:
            let titleCell = tableView.dequeueReusableCell(withIdentifier: "EventTitleCell", for: indexPath as IndexPath) as! EventTitleCell
            cell = titleCell
            break
        case 3:
            let goingCell = tableView.dequeueReusableCell(withIdentifier: "GoingTableViewCell", for: indexPath as IndexPath) as! GoingTableViewCell
            cell = goingCell
            break
        case 4:
            let calendarCell = tableView.dequeueReusableCell(withIdentifier: "EventCalendarCell", for: indexPath as IndexPath) as! EventCalendarCell
            cell = calendarCell
            break
        case 5:
            let locationCell = tableView.dequeueReusableCell(withIdentifier: "EventLocationCell", for: indexPath as IndexPath) as! EventLocationCell
            cell = locationCell
            break
        case 6:
            let mapCell = tableView.dequeueReusableCell(withIdentifier: "MapTableViewCell", for: indexPath as IndexPath) as! MapTableViewCell
            cell = mapCell
            break
        case 7:
            let hostCell = tableView.dequeueReusableCell(withIdentifier: "HostedbyCell", for: indexPath as IndexPath) as! HostedbyCell
            cell = hostCell
            break
        case 8:
            let descriptionCell = tableView.dequeueReusableCell(withIdentifier: "EventDescriptionCell", for: indexPath as IndexPath) as! EventDescriptionCell
            cell = descriptionCell
            break
        case 9:
            let goingPeopleCell = tableView.dequeueReusableCell(withIdentifier: "GoingPeopleTableViewCell", for: indexPath as IndexPath) as! GoingPeopleTableViewCell
            goingPeopleCell.goingCollectionView.reloadData()
            cell = goingPeopleCell
            break
            
        case 10:
            let moreCell = tableView.dequeueReusableCell(withIdentifier: "EventMoreTableViewCell", for: indexPath as IndexPath) as! EventMoreTableViewCell
            moreCell.moreTableView.reloadData()
            cell = moreCell
            break
        default:
            cell = tableView.dequeueReusableCell(withIdentifier: "EventHostHeaderTableViewCell", for: indexPath as IndexPath) as! EventHostHeaderTableViewCell
            
            break
        }
        
        return cell
    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        var rect : CGRect = self.bgImageView.frame
        rect.origin.y += previousOffset - scrollView.contentOffset.y
        previousOffset = scrollView.contentOffset.y
        
        self.bgImageView.frame = CGRect(x: rect.origin.x, y: rect.origin.y, width: self.view.frame.width, height: scrollView.contentSize.height)
    }
    
}

