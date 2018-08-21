//
//  EventEditViewController.swift
//  Milu
//
//  Created by Admin on 8/19/18.
//  Copyright © 2018 Admintest. All rights reserved.
//

import UIKit

class EventEditViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,EditCoverPhotoViewControllerDelegate,RepeatViewControllerDelegate {
    

    @IBOutlet weak var tableView: TPKeyboardAvoidingTableView!
    @IBOutlet weak var headerView: UIVisualEffectView!
    @IBOutlet weak var bgImageView: UIImageView!
    
    var bIsShowPicker = false
    var bIsShowDurationPicker = false
    var startDate = ""
    var duration = ""
    var eventDesciption = ""
    let dateFormatter = DateFormatter()
    let durationFormatter = DateFormatter()
    var previousOffset:CGFloat = 0
    var coverPhoto = UIImage()
    var repeatIndex = 0
    let repeatItems = ["none","daily","weekly","monthly","yearly"]
    
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
        coverPhoto = UIImage(named: "dog")!
        
        durationFormatter.dateFormat = "H'h' m'm'"
        duration = durationFormatter.string(from: calendar.date(from: components)!)
    }

    @IBAction func didTapOnBack(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 19
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        switch indexPath.row {
        case 0:
            return 36
        case 1:
            return self.view.bounds.width * 0.8
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
        case 9:
            return 36
        case 10:
            return 48
        case 11:
            return 12
        case 12:
            return 180
        case 13:
            return 48
        case 14:
            return 36
        case 15:
            return 36
        case 16:
            return 12
        case 17:
            return 60
        case 18:
            return 24
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
            addPhotoCell.addButton.addTarget(self, action: #selector(didTapOnAdd(button:)), for: .touchUpInside)
            cell = addPhotoCell
            break
        case 1:
            let photoCell = tableView.dequeueReusableCell(withIdentifier: "EventPhotoCell", for: indexPath as IndexPath) as! EventPhotoCell
            photoCell.coverPhotoImageView.image = coverPhoto
            cell = photoCell
            break
        case 2:
            let titleCell = tableView.dequeueReusableCell(withIdentifier: "TitleCell", for: indexPath as IndexPath) as! TitleCell
            titleCell.titleField.attributedPlaceholder = NSAttributedString(string: "title",
                                                                 attributes: [NSAttributedStringKey.foregroundColor: UIColor.lightGray])
            cell = titleCell
            break
        case 3:
            let addressCell = tableView.dequeueReusableCell(withIdentifier: "AddressCell", for: indexPath as IndexPath) as! AddressCell
            addressCell.addressField.attributedPlaceholder = NSAttributedString(string: "address",
                                                                                attributes: [NSAttributedStringKey.foregroundColor: UIColor.lightGray])
            cell = addressCell
            break
        case 4:
            let websiteCell = tableView.dequeueReusableCell(withIdentifier: "websiteCell", for: indexPath as IndexPath) as! TitleCell
            websiteCell.titleField.attributedPlaceholder = NSAttributedString(string: "website url",
                                                                                         attributes: [NSAttributedStringKey.foregroundColor: UIColor.lightGray])
            cell = websiteCell
            break
        case 5:
            let ticketCell = tableView.dequeueReusableCell(withIdentifier: "TicketCell", for: indexPath as IndexPath) as! AddressCell
            
            ticketCell.addressField.attributedPlaceholder = NSAttributedString(string: "ticket url",
                                                                              attributes: [NSAttributedStringKey.foregroundColor: UIColor.lightGray])
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
        case 9:
            let repeatCell = tableView.dequeueReusableCell(withIdentifier: "RepeatCell", for: indexPath as IndexPath) as! RepeatCell
            repeatCell.repeatButton.addTarget(self, action: #selector(didTapOnRepeat(button:)), for: .touchUpInside)
            repeatCell.weeklyButton.setTitle(repeatItems[repeatIndex], for: .normal)
            cell = repeatCell
            break
        case 10:
            let hostCell = tableView.dequeueReusableCell(withIdentifier: "HostCell", for: indexPath as IndexPath) as! HostCell
            cell = hostCell
            break
        case 11:
            let emptyCell = tableView.dequeueReusableCell(withIdentifier: "emptyCell", for: indexPath as IndexPath)
            cell = emptyCell
            break
        case 12:
            let descCell = tableView.dequeueReusableCell(withIdentifier: "DescriptionCell", for: indexPath as IndexPath) as! DescriptionCell
            cell = descCell
            break
        case 13:
            let inviteCell = tableView.dequeueReusableCell(withIdentifier: "InviteCell", for: indexPath as IndexPath) as! InviteCell
            cell = inviteCell
            break
        case 14:
            let privateCell = tableView.dequeueReusableCell(withIdentifier: "PrivateCell", for: indexPath as IndexPath) as! PrivateCell
            cell = privateCell
            break
        case 15:
            let allowCell = tableView.dequeueReusableCell(withIdentifier: "AllowCell", for: indexPath as IndexPath) as! AllowCell
            cell = allowCell
            break
        case 16:
            let emptyCell = tableView.dequeueReusableCell(withIdentifier: "emptyCell1", for: indexPath as IndexPath)
            cell = emptyCell
            break
        case 17:
            let saveCell = tableView.dequeueReusableCell(withIdentifier: "SavebuttonCell", for: indexPath as IndexPath) as! SavebuttonCell
            cell = saveCell
            break
        case 18:
            let emptyCell = tableView.dequeueReusableCell(withIdentifier: "emptyCell2", for: indexPath as IndexPath)
            cell = emptyCell
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
    
    @objc func didTapOnAdd(button: UIButton){
        
        let editCoverPhotoViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "EditCoverPhotoViewController") as? EditCoverPhotoViewController
        editCoverPhotoViewController?.delegate = self
        present(editCoverPhotoViewController!, animated: false, completion: nil)
        
    }
    
    @objc func didTapOnRepeat(button: UIButton){
        
        let repeatViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "RepeatViewController") as? RepeatViewController
        repeatViewController?.delegate = self
        self.navigationController?.pushViewController(repeatViewController!, animated: true)
        
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
    
    func circleCropDidCancel() {
        dismiss(animated: false, completion: nil)
    }
    
    func circleCropDidCropImage(_ image: UIImage) {
        coverPhoto = image
        tableView.reloadData()
        dismiss(animated: false, completion: nil)
    }
    
    func backAction(index: Int) {
        repeatIndex = index
        self.tableView.reloadData()
        
    }
    
    
}

extension EventEditViewController : TimePickerViewDelegate{
    
    func timePickerChangedValue(_ timePicker: TimePickerView) {
        durationPickerChanged(sender: timePicker)
    }
}
