//
//  GuestListContainerViewController.swift
//  Milu
//
//  Created by Admin on 8/20/18.
//  Copyright © 2018 Admintest. All rights reserved.
//

import UIKit

class GuestListContainerViewController: UIViewController {

    @IBOutlet weak var headerView: UIVisualEffectView!
    @IBOutlet var goingView: UIView!
    @IBOutlet weak var goingButton: UIButton!
    @IBOutlet weak var maybeView: UIView!
    @IBOutlet weak var maybeButton: UIButton!
    @IBOutlet weak var nopeView: UIView!
    @IBOutlet var nopeButton: UIButton!
    @IBOutlet weak var underlineView: UIView!
    @IBOutlet weak var containerView: UIView!
    
    var goingViewController: GoingViewController?
    var maybeViewController: MaybeViewController?
    var nopeViewController: NopeViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initView()
        goingViewController = (storyboard?.instantiateViewController(withIdentifier: "GoingViewController") as! GoingViewController)
        maybeViewController = (storyboard?.instantiateViewController(withIdentifier: "MaybeViewController") as! MaybeViewController)
        nopeViewController = (storyboard?.instantiateViewController(withIdentifier: "NopeViewController") as! NopeViewController)
        
        activeViewController = goingViewController
    }

    func initView(){
        
        self.headerView.layer.shadowOffset = CGSize(width: 0, height: 3)
        self.headerView.layer.shadowRadius = 2
        self.headerView.layer.shadowOpacity = 0.24
        self.headerView.layer.shadowColor = UIColor.black.cgColor
       
    }

    
    override var preferredStatusBarStyle : UIStatusBarStyle {
        return .lightContent
    }
    
    private var activeViewController: UIViewController? {
        didSet {
            removeInactiveViewController(inactiveViewController: oldValue)
            updateActiveViewController()
        }
    }
    
    private func removeInactiveViewController(inactiveViewController: UIViewController?) {
        if let inActiveVC = inactiveViewController {
            // call before removing child view controller's view from hierarchy
            inActiveVC.willMove(toParentViewController: nil)
            
            inActiveVC.view.removeFromSuperview()
            
            // call after removing child view controller's view from hierarchy
            inActiveVC.removeFromParentViewController()
        }
    }
    
    private func updateActiveViewController() {
        if let activeVC = activeViewController {
            // call before adding child view controller's view as subview
            addChildViewController(activeVC)
            
            activeVC.view.frame = containerView.bounds
            containerView.addSubview(activeVC.view)
            
            // call before adding child view controller's view as subview
            activeVC.didMove(toParentViewController: self)
        }
    }
    
  
    func initTab(){
        self.goingView.alpha = 0.7
        self.maybeView.alpha = 0.7
        self.nopeView.alpha = 0.7
    }
    @IBAction func didTapOnGoing(_ sender: Any) {
        initTab()
        self.goingView.alpha = 1
        moveUnderline(index: 0)
        activeViewController = goingViewController
    }
    
    @IBAction func didTapOnMaybe(_ sender: Any) {
         initTab()
        self.maybeView.alpha = 1
        moveUnderline(index: 1)
         activeViewController = maybeViewController
    }
    
    @IBAction func didTapOnNope(_ sender: Any) {
         initTab()
        self.nopeView.alpha = 1
        moveUnderline(index: 2)
         activeViewController = nopeViewController
    }
    
    
    @IBAction func didTapOnBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    func moveUnderline(index:Int){
        
        UIView.animate(withDuration: 0.2, animations: {
            
            self.underlineView.frame = CGRect(x: self.view.frame.width/3 * (CGFloat)(index), y: self.underlineView.frame.origin.y, width: self.underlineView.frame.width, height: self.underlineView.frame.height)
           
        }, completion: {
            (value : Bool) in
            
        })
        
    }

}
