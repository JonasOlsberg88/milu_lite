//
//  BaseViewController.swift
//  milu
//
//  Created by admin on 3/5/18.
//  Copyright © 2018 milu. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    var isStatusBarHide = false
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(forName:NSNotification.Name(rawValue: "showAlert"), object:nil, queue:nil, using:showAlert)
        // Do any additional setup after loading the view.
    }
    override var prefersStatusBarHidden: Bool { return isStatusBarHide }
    
    func showAlert(notification:Notification) -> Void {
        
         appDelegate().stopTimer()
        
         var alert : AlertViewController?
         alert = (self.storyboard?.instantiateViewController(withIdentifier: "AlertViewController") as! AlertViewController)
         alert?.modalPresentationStyle = .overFullScreen
         alert?.msg = "oops! you must be logged."
         self.present(alert!, animated: true, completion: nil)
        
        self.isStatusBarHide = true
        self.setNeedsStatusBarAppearanceUpdate()
    }
}
