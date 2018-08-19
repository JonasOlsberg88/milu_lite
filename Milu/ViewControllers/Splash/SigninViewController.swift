//
//  SigninViewController.swift
//  Milu
//
//  Created by Admin on 8/18/18.
//  Copyright © 2018 Admintest. All rights reserved.
//

import UIKit

class SigninViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func didTapOnFB(_ sender: Any) {
        
        self.performSegue(withIdentifier: "goHome", sender: nil)
    }
    
}
