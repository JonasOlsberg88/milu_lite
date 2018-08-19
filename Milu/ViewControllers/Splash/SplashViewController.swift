//
//  ViewController.swift
//  Milu
//
//  Created by Admin on 8/15/18.
//  Copyright © 2018 Admintest. All rights reserved.
//

import UIKit

class SplashViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
             self.performSegue(withIdentifier: "goOnboarding", sender: nil)
        }       
       
    }

    override var preferredStatusBarStyle : UIStatusBarStyle {
        return .lightContent
    }

}

