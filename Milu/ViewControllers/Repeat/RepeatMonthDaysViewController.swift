//
//  RepeatMonthDaysViewController.swift
//  Milu
//
//  Created by Admin on 8/21/18.
//  Copyright © 2018 Admintest. All rights reserved.
//

import UIKit

class RepeatMonthDaysViewController: UIViewController,MJCalendarViewDelegate,UIPickerViewDelegate,UIPickerViewDataSource {
    func calendar(_ calendarView: MJCalendarView, didChangePeriod periodDate: Date, bySwipe: Bool) {
        
    }
    
    func calendar(_ calendarView: MJCalendarView, didSelectDate date: Date) {
        
    }
    
    func calendar(_ calendarView: MJCalendarView, backgroundForDate date: Date) -> UIColor? {
        return nil
    }
    
    func calendar(_ calendarView: MJCalendarView, textColorForDate date: Date) -> UIColor? {
        return nil
    }
    
    
    @IBOutlet var checkMarks: [UIImageView]!
    @IBOutlet weak var headerView: UIVisualEffectView!
    @IBOutlet weak var calendarView: MJCalendarView!
    @IBOutlet weak var scrollViewHeight: NSLayoutConstraint!
    @IBOutlet weak var pickerView: CustomPicker!
    
    var selectedIndex = 0
    var originPos = CGPoint()
    let firstItems = ["first","second","third","fourth","last"]
    let secondItems =  ["sunday","monday","tuesday","wednesday","thursday","friday","saturday"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initView()
        self.setUpCalendarConfiguration()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        scrollViewHeight.constant = 114 + self.view.bounds.width
        originPos = self.calendarView.origin()
    }
    
    override var preferredStatusBarStyle : UIStatusBarStyle {
        return .lightContent
    }
    
    func initView(){
        self.headerView.layer.shadowOffset = CGSize(width: 0, height: 3)
        self.headerView.layer.shadowRadius = 2
        self.headerView.layer.shadowOpacity = 0.24
        self.headerView.layer.shadowColor = UIColor.black.cgColor
        
        self.checkMarks.forEach({
            $0.isHidden = true
        })
        self.checkMarks[selectedIndex].isHidden = false
        
        if selectedIndex == 0 {
            self.calendarView.alpha = 1
            self.pickerView.alpha = 0
            
        }else{
            self.calendarView.alpha = 0
            self.pickerView.alpha = 1
        }
        
        self.pickerView.selectorColor = UIColor.white
    }
    
    func setUpCalendarConfiguration() {
        self.calendarView.calendarDelegate = self
        self.calendarView.configuration.startDayType = .monday
        // Set displayed period type. Available types: Month, ThreeWeeks, TwoWeeks, OneWeek
        self.calendarView.configuration.periodType = .month
        
        // Set shape of day view. Available types: Circle, Square
        self.calendarView.configuration.dayViewType = .circle
        
        // Set selected day display type. Available types:
        // Border - Only border is colored with selected day color
        // Filled - Entire day view is filled with selected day color
        self.calendarView.configuration.selectedDayType = .filled
        
        // Set day text color
        self.calendarView.configuration.dayTextColor = UIColor.white
        
        // Set day background color
        self.calendarView.configuration.dayBackgroundColor = UIColor.clear
        
        // Set selected day text color
        self.calendarView.configuration.selectedDayTextColor = UIColor(hex:0x00c0ff)!
        
        // Set selected day background color
        self.calendarView.configuration.selectedDayBackgroundColor = UIColor.clear
        
        // Set other month day text color. Relevant only if periodType = .Month
        self.calendarView.configuration.otherMonthTextColor = UIColor(hex:0x757575)!
        
        // Set other month background color. Relevant only if periodType = .Month
        self.calendarView.configuration.otherMonthBackgroundColor = UIColor.clear
        
        // Set week text color
        self.calendarView.configuration.weekLabelTextColor = UIColor(hex:0x757575)!
        
        // Set start day. Available type: .Monday, Sunday
        self.calendarView.configuration.startDayType = .sunday
        
        self.calendarView.configuration.lettersInWeekDayLabel = .one
        
        // Set day text font
        self.calendarView.configuration.dayTextFont = UIFont(name: "Montserrat-Light", size: 25)!
        
        //Set week's day name font
        self.calendarView.configuration.weekLabelFont = UIFont(name: "Montserrat-Light", size: 14)!
        
        //Set day view size. It includes border width if selectedDayType = .Border
        self.calendarView.configuration.dayViewSize = CGSize(width: 50, height: 50)
        
        //Set height of row with week's days
        self.calendarView.configuration.rowHeight = 50
        
        // Set height of week's days names view
        self.calendarView.configuration.weekLabelHeight = 50
        
        
        //Set min date
        //   self.calendarView.configuration.minDate = Date().subtractingDays(600)
        
        //Set max date
        //     self.calendarView.configuration.maxDate = (Date() as NSDate).addingDays(600)
        
        //        self.calendarView.configuration.outOfRangeDayBackgroundColor = UIColor(hexString: "E7E7E7")!
        //        self.calendarView.configuration.outOfRangeDayTextColor = UIColor(hexString: "6f787c")!
        
        self.calendarView.configuration.selectDayOnPeriodChange = false
        
        // To commit all configuration changes execute reloadView method
        self.calendarView.reloadView()
    }
    
    
    @IBAction func didTapBack(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func didTapUntilItem(_ sender: UIButton) {
        
        if sender.tag == 0 {
            self.checkMarks[sender.tag].isHidden = false
            self.checkMarks[sender.tag + 1].isHidden = true
            //            self.calendarView.isHidden = true
            
            UIView.animate(withDuration: 0.5, animations: {
                
                self.calendarView.alpha = 1
                self.pickerView.alpha = 0
            })
            
        }else{
            self.checkMarks[sender.tag].isHidden = false
            self.checkMarks[sender.tag - 1].isHidden = true
            //            self.calendarView.isHidden = false
            UIView.animate(withDuration: 0.5) {
                self.calendarView.alpha = 0
                self.pickerView.alpha = 1
            }
        }
    }
    
   
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        if component == 0 {
            return 5
        }else{
            return 7
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        if component == 0 {
            return firstItems[row]
        }else{
            return secondItems[row]
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        
        if component == 0 {
            return NSAttributedString(string: firstItems[row], attributes: [NSAttributedStringKey.foregroundColor:UIColor.white,NSAttributedStringKey.font:UIFont(name: "Montserrat-Light", size: 17)!])
        }else{
            return NSAttributedString(string: secondItems[row], attributes: [NSAttributedStringKey.foregroundColor:UIColor.white,NSAttributedStringKey.font:UIFont(name: "Montserrat-Light", size: 17)!])
        }
    }
    
}

