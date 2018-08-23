//
//  ConnectionsViewController.swift
//  Milu
//
//  Created by Admin on 8/23/18.
//  Copyright © 2018 Admintest. All rights reserved.
//

import UIKit

class ConnectionsViewController: UIViewController {

    @IBOutlet weak var headerView: UIVisualEffectView!
    @IBOutlet weak var underLineView: UIView!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var followingLabel: UILabel!
    @IBOutlet weak var followingCountLabel: UILabel!
    @IBOutlet weak var followersLabel: UILabel!
    @IBOutlet weak var followersCountLabel: UILabel!
    @IBOutlet weak var groupsLabel: UILabel!
    @IBOutlet weak var groupsCountLabel: UILabel!
    
    
    
    var followingViewController: FollowingViewController?
    var followersViewController: FollowersViewController?
    var groupsViewController: GroupsViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initView()
        initTab()
        followingViewController = (storyboard?.instantiateViewController(withIdentifier: "FollowingViewController") as! FollowingViewController)
        followersViewController = (storyboard?.instantiateViewController(withIdentifier: "FollowersViewController") as! FollowersViewController)
        groupsViewController = (storyboard?.instantiateViewController(withIdentifier: "GroupsViewController") as! GroupsViewController)
        
        activeViewController = followingViewController
        self.followingLabel.alpha = 1
        self.followingCountLabel.alpha = 1
        self.followingLabel.font = UIFont(name: "Montserrat-Light", size: 14)
        self.followingCountLabel.font = UIFont(name: "Montserrat-Light", size: 12)
    }

    override var preferredStatusBarStyle : UIStatusBarStyle {
        return .lightContent
    }
    
    func initView(){
        
        self.headerView.layer.shadowOffset = CGSize(width: 0, height: 3)
        self.headerView.layer.shadowRadius = 2
        self.headerView.layer.shadowOpacity = 0.24
        self.headerView.layer.shadowColor = UIColor.black.cgColor
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
        self.followingLabel.alpha = 0.7
        self.followingCountLabel.alpha = 0.7
        self.followersLabel.alpha = 0.7
        self.followersCountLabel.alpha = 0.7
        self.groupsLabel.alpha = 0.7
        self.groupsCountLabel.alpha = 0.7
        
        self.followingLabel.font = UIFont(name: "Montserrat-ExtraLight", size: 14)
        self.followersLabel.font = UIFont(name: "Montserrat-ExtraLight", size: 14)
        self.groupsLabel.font = UIFont(name: "Montserrat-ExtraLight", size: 14)
        
        self.followingCountLabel.font = UIFont(name: "Montserrat-ExtraLight", size: 12)
        self.followersCountLabel.font = UIFont(name: "Montserrat-ExtraLight", size: 12)
        self.groupsCountLabel.font = UIFont(name: "Montserrat-ExtraLight", size: 12)
        
    }
    
    @IBAction func didTapOnBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func didTapOnTab(_ sender: UIButton) {
        initTab()
        moveUnderline(index: sender.tag)
        switch sender.tag {
        case 0:
            self.followingLabel.alpha = 1
            self.followingCountLabel.alpha = 1
            activeViewController = followingViewController
            
            self.followingLabel.font = UIFont(name: "Montserrat-Light", size: 14)
            self.followingCountLabel.font = UIFont(name: "Montserrat-Light", size: 12)
            
            break
        case 1:
            self.followersLabel.alpha = 1
            self.followersCountLabel.alpha = 1
            activeViewController = followersViewController
            self.followersLabel.font = UIFont(name: "Montserrat-Light", size: 14)
            self.followersCountLabel.font = UIFont(name: "Montserrat-Light", size: 12)
            break
        case 2:
            self.groupsLabel.alpha = 1
            self.groupsCountLabel.alpha = 1
            activeViewController = groupsViewController
            self.groupsLabel.font = UIFont(name: "Montserrat-Light", size: 14)
            self.groupsCountLabel.font = UIFont(name: "Montserrat-Light", size: 12)
            break
        default:
            break
        }
    }
    
    func moveUnderline(index:Int){
        
        UIView.animate(withDuration: 0.2, animations: {
            
            self.underLineView.frame = CGRect(x: self.view.frame.width/3 * (CGFloat)(index), y: self.underLineView.frame.origin.y, width: self.underLineView.frame.width, height: self.underLineView.frame.height)
            
        }, completion: {
            (value : Bool) in
            
        })
        
    }
    
}
