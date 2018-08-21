//
//  RepeatViewController.swift
//  Milu
//
//  Created by Admin on 8/21/18.
//  Copyright © 2018 Admintest. All rights reserved.
//

import UIKit

protocol RepeatViewControllerDelegate
{
    
    func backAction(index: Int)
    
}

class RepeatViewController: UIViewController {

    @IBOutlet weak var headerView: UIVisualEffectView!
    @IBOutlet var checkMarks: [UIImageView]!
    
    @IBOutlet weak var dailyView: UIView!
    @IBOutlet weak var weeklyView: UIView!
    @IBOutlet weak var monthlyView: UIView!
    @IBOutlet weak var yearlyView: UIView!
    @IBOutlet weak var dailyConstraint: NSLayoutConstraint!
    @IBOutlet weak var weeklyConstraint: NSLayoutConstraint!
    @IBOutlet weak var monthlyConstraint: NSLayoutConstraint!
    @IBOutlet weak var yearlyConstraint: NSLayoutConstraint!
    
    
    
    var delegate: RepeatViewControllerDelegate?
    var selectedIndex = 0
    override func viewDidLoad() {
        super.viewDidLoad()

        initView()
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
        self.weeklyConstraint.constant = 12
        self.monthlyConstraint.constant = 12
        self.yearlyConstraint.constant = 12
        reloadViews()
    }
    
    func reloadViews(){
        self.dailyView.isHidden = true
        self.weeklyView.isHidden = true
        self.monthlyView.isHidden = true
        self.yearlyView.isHidden = true
        
        switch selectedIndex {
        case 1:
            self.dailyView.isHidden = false
            break
        case 2:
            self.weeklyView.isHidden = false
            break
        case 3:
            self.monthlyView.isHidden = false
            break
        case 4:
            self.yearlyView.isHidden = false
            break
        default:
            break
        }
        
        
    }

    @IBAction func didTapBack(_ sender: Any) {
        
        self.delegate?.backAction(index: selectedIndex)
        self.navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func didTapOnRepeatItem(_ sender: UIButton) {
        
        selectedIndex = sender.tag
        self.checkMarks.forEach({
            $0.isHidden = true
        })
        self.checkMarks[selectedIndex].isHidden = false
        reloadViews()
    }
    
    @IBAction func didTapOnDayInterval(_ sender: Any) {
        self.performSegue(withIdentifier: "goInterval", sender: nil)
    }
    
    @IBAction func didTapOnWeekInterval(_ sender: Any) {
         self.performSegue(withIdentifier: "goWeekInterval", sender: nil)
    }
    
    @IBAction func didTapMonthInterval(_ sender: Any) {
        self.performSegue(withIdentifier: "goMonthInterval", sender: nil)
    }
    
    @IBAction func didTapOnYearInterval(_ sender: Any) {
        self.performSegue(withIdentifier: "goYearInterval", sender: nil)
    }
    
    @IBAction func didTapOnDayUntil(_ sender: Any) {
        self.performSegue(withIdentifier: "goRepeatUntil", sender: nil)
    }
    
    @IBAction func didTapOnWeekUntil(_ sender: Any) {
        self.performSegue(withIdentifier: "goRepeatUntil", sender: nil)
    }
    
    @IBAction func didTapOnMonthUntil(_ sender: Any) {
        self.performSegue(withIdentifier: "goRepeatUntil", sender: nil)
    }
    
    @IBAction func didTapOnYearUntil(_ sender: Any) {
        self.performSegue(withIdentifier: "goRepeatUntil", sender: nil)
    }
    
    @IBAction func didTapWeekOnday(_ sender: Any) {
        self.performSegue(withIdentifier: "goWeekDays", sender: nil)
    }
    
    @IBAction func didTapMonthOnday(_ sender: Any) {
        self.performSegue(withIdentifier: "goMonthDays", sender: nil)
    }
    
}
