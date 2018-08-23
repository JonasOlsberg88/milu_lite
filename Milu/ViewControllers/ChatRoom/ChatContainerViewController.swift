//
//  ChatContainerViewController.swift
//  Milu
//
//  Created by Admin on 8/22/18.
//  Copyright © 2018 Admintest. All rights reserved.
//

import UIKit

class ChatContainerViewController: UIViewController {

    @IBOutlet weak var containerView: UIView!
    var chatViewController: ChatViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        chatViewController = (storyboard?.instantiateViewController(withIdentifier: "ChatViewController") as! ChatViewController)
        activeViewController = chatViewController
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

}
