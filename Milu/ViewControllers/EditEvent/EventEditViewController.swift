//
//  EventEditViewController.swift
//  Milu
//
//  Created by Admin on 8/19/18.
//  Copyright © 2018 Admintest. All rights reserved.
//

import UIKit

class EventEditViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var tableView: TPKeyboardAvoidingTableView!
    @IBOutlet weak var headerView: UIVisualEffectView!
    @IBOutlet weak var bgImageView: UIImageView!
    
    var bIsShowPicker = false
    var bIsShowDurationPicker = false
    var startDate = ""
    var duration = ""
    let dateFormatter = DateFormatter()
    let durationFormatter = DateFormatter()
    var previousOffset:CGFloat = 0
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initView()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.bgImageView.frame = CGRect(x: self.tableView.frame.origin.x, y: self.tableView.frame.origin.y, width: self.bgImageView.frame.width, height: self.tableView.contentSize.height)
    }
    
    override var preferredStatusBarStyle : UIStatusBarStyle {
        return .lightContent
    }
    
    func initView(){
        
        self.headerView.layer.shadowOffset = CGSize(width: 0, height: 3)
        self.headerView.layer.shadowRadius = 2
        self.headerView.layer.shadowOpacity = 0.24
        self.headerView.layer.shadowColor = UIColor.black.cgColor
        
        dateFormatter.dateFormat = "MMM dd, yyyy   HH:mm a"
        startDate = dateFormatter.string(from: Date())
        
        let calendar = Calendar.current
        var components = calendar.dateComponents([.hour,.minute], from: Date())
        components.hour = 0
        components.minute = 0
        
        
        durationFormatter.dateFormat = "H'h' m'm'"
        duration = durationFormatter.string(from: calendar.date(from: components)!)
    }

    @IBAction func didTapOnBack(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 9
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        switch indexPath.row {
        case 0:
            return 36
        case 1:
            return 186
        case 2:
            return 49
        case 3,5:
            return 36
        case 4,6:
            return 49
        case 7:
            
            if self.bIsShowPicker {
                 return 254
            }else{
                 return 37
            }
        case 8:
            
            if self.bIsShowDurationPicker {
                return 300
            }else{
                return 37
            }
//        case 6:
//            return 134
//        case 7:
//            return 44
//        case 8:
//            return UITableViewAutomaticDimension
//        case 9:
//            return 136
//        case 10:
//            return 78 * 3 + 36
        default:
            break
        }
        
        return 390
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
        
        switch indexPath.row {
        case 0:
            
            let addPhotoCell = tableView.dequeueReusableCell(withIdentifier: "AddHeaderPhotoCell", for: indexPath as IndexPath) as! AddHeaderPhotoCell
            cell = addPhotoCell
            break
        case 1:
            let photoCell = tableView.dequeueReusableCell(withIdentifier: "EventPhotoCell", for: indexPath as IndexPath) as! EventPhotoCell
            cell = photoCell
            break
        case 2:
            let titleCell = tableView.dequeueReusableCell(withIdentifier: "TitleCell", for: indexPath as IndexPath) as! TitleCell
            cell = titleCell
            break
        case 3:
            let addressCell = tableView.dequeueReusableCell(withIdentifier: "AddressCell", for: indexPath as IndexPath) as! AddressCell
            cell = addressCell
            break
        case 4:
            let websiteCell = tableView.dequeueReusableCell(withIdentifier: "websiteCell", for: indexPath as IndexPath) as! TitleCell
            cell = websiteCell
            break
        case 5:
            let ticketCell = tableView.dequeueReusableCell(withIdentifier: "TicketCell", for: indexPath as IndexPath) as! AddressCell
            cell = ticketCell
            break
        case 6:
            let alldayCell = tableView.dequeueReusableCell(withIdentifier: "AllDayCell", for: indexPath as IndexPath) as! AllDayCell
            cell = alldayCell
            break
        case 7:
            let startsCell = tableView.dequeueReusableCell(withIdentifier: "StartsCell", for: indexPath as IndexPath) as! StartsCell
            startsCell.dateButton.tag = indexPath.row
            startsCell.dateButton.addTarget(self, action: #selector(didTapOnDate(button:)), for: .touchUpInside)
            if bIsShowPicker {
                startsCell.datePicker.isHidden = false
            }else{
                startsCell.datePicker.isHidden = true
            }
           
            startsCell.dateButton.setTitle(startDate, for: .normal)
            startsCell.datePicker.addTarget(self, action: #selector(datePickerChanged(date_picker:)), for: .valueChanged)
            cell = startsCell
            break
        case 8:
            let durationCell = tableView.dequeueReusableCell(withIdentifier: "DurationCell", for: indexPath as IndexPath) as! DurationCell
            durationCell.timeButton.tag = indexPath.row
            durationCell.timeButton.addTarget(self, action: #selector(didTapOnDuration(button:)), for: .touchUpInside)          
            durationCell.timePicker.timeDelegate = self
            durationCell.timeButton.setTitle(duration, for: .normal)
            if bIsShowDurationPicker {
                durationCell.durationView.isHidden = false
            }else{
                durationCell.durationView.isHidden = true
            }
            cell = durationCell
            break
//        case 8:
//            let descriptionCell = tableView.dequeueReusableCell(withIdentifier: "EventDescriptionCell", for: indexPath as IndexPath) as! EventDescriptionCell
//            cell = descriptionCell
//            break
//        case 9:
//            let goingPeopleCell = tableView.dequeueReusableCell(withIdentifier: "GoingPeopleTableViewCell", for: indexPath as IndexPath) as! GoingPeopleTableViewCell
//            goingPeopleCell.goingCollectionView.reloadData()
//            cell = goingPeopleCell
//            break
//
//        case 10:
//            let moreCell = tableView.dequeueReusableCell(withIdentifier: "EventMoreTableViewCell", for: indexPath as IndexPath) as! EventMoreTableViewCell
//            moreCell.moreTableView.reloadData()
//            cell = moreCell
//            break
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
    
    @objc func didTapOnDate(button: UIButton){
        
        let startsCell = tableView.cellForRow(at: IndexPath.init(row: button.tag, section: 0)) as! StartsCell
        
        self.bIsShowPicker = !self.bIsShowPicker
        self.tableView.reloadData()
        
        if tableView.visibleCells.last == startsCell {
            self.tableView.scrollToRow(at: IndexPath.init(row: button.tag, section: 0), at: .bottom, animated: true)
        }
        
    }
    
    @objc func datePickerChanged(date_picker:UIDatePicker){
        
        startDate = dateFormatter.string(from: date_picker.date)
        self.tableView.reloadData()
        
    }
    
    @objc func didTapOnDuration(button: UIButton){
        
        let durationCell = tableView.cellForRow(at: IndexPath.init(row: button.tag, section: 0)) as! DurationCell
        
        self.bIsShowDurationPicker = !self.bIsShowDurationPicker
        self.tableView.reloadData()
        
        if tableView.visibleCells.last == durationCell {
            self.tableView.scrollToRow(at: IndexPath.init(row: button.tag, section: 0), at: .bottom, animated: true)
        }
        
    }
    
    @objc func timePickerChanged(date_picker:UIDatePicker){
        
        duration = durationFormatter.string(from: date_picker.date)
        self.tableView.reloadData()
        
    }
    
    func durationPickerChanged(sender:TimePickerView){
        
        duration = "\(sender.hour)h \(sender.minutes)m"
        self.tableView.reloadData()
    }
    
    
}

extension EventEditViewController : TimePickerViewDelegate{
    
    func timePickerChangedValue(_ timePicker: TimePickerView) {
        durationPickerChanged(sender: timePicker)
    }
}