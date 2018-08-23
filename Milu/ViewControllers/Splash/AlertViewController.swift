//
//  AlertViewController.swift
//  Milu
//
//  Created by user on 8/8/17.
//  Copyright © 2017 Clio. All rights reserved.
//

import UIKit
//import FBSDKLoginKit
//import FBSDKCoreKit
//import FBSDKLoginKit
//import FacebookCore
//import FacebookLogin
//import MBProgressHUD


class AlertViewController: BaseViewController {
    
    @IBOutlet weak var msgLabel: UILabel!
    @IBOutlet weak var fbButton: UIButton!
    @IBOutlet weak var mView: UIView!
    
    var msg : String?
    var userToken : String? = nil
    var dict : [String : Any]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.isOpaque = false
        self.initView()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    func initView(){
        
        mView.layer.cornerRadius = 12
        mView.layer.masksToBounds = true
        
        fbButton.layer.cornerRadius = 10
        fbButton.layer.masksToBounds = true
        msgLabel.text = msg
        
        
        
    }
   
    override var prefersStatusBarHidden: Bool { return true }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        self.tabBarController?.tabBar.isHidden = true
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        self.tabBarController?.tabBar.isHidden = false
    }
    @IBAction func logoutAction(_ sender: Any) {
        performSegue(withIdentifier: "goLogin", sender: nil)
        self.appDelegate().bIsSkip = false
        
    }
    @IBAction func loginAction(_ sender: Any) {       
        
        performSegue(withIdentifier: "goHome", sender: nil)
        self.appDelegate().bIsSkip = false
        
    }
//    @IBAction func didTapOnLogout(_ sender: Any) {
//        
////        UserDefaults.standard.set("", forKey: "photo_url")
////        UserDefaults.standard.set("", forKey: "email")
////        UserDefaults.standard.set("" , forKey: "userName")
////        UserDefaults.standard.set("", forKey: "token")
//
//    }
//    @IBAction func didTapOnLogin(_ sender: Any) {
//
//
////        let fbLoginManager : FBSDKLoginManager = FBSDKLoginManager()
////        fbLoginManager.logIn(withReadPermissions: ["email","user_friends","public_profile","user_location","user_photos","user_birthday","user_posts","user_likes","user_posts","user_photos","user_events"], from: self) { (result, error) in
////            if (error == nil){
////                let fbloginresult : FBSDKLoginManagerLoginResult = result!
////                if fbloginresult.grantedPermissions != nil {
////                    self.userToken = fbloginresult.token.tokenString
////
////                    if(fbloginresult.grantedPermissions.contains("email"))
////                    {
////                        self.getFBUserData()
////                    }
////                }
////            }else{
////                let alert = UIAlertController(title: "Alert", message: "user simple login error! ", preferredStyle: UIAlertControllerStyle.alert)
////                alert.addAction(UIAlertAction(title: "Click", style: UIAlertActionStyle.default, handler: nil))
////                self.present(alert, animated: true, completion: nil)
////
////                DispatchQueue.main.async {
////                    MBProgressHUD.hide(for: self.view, animated: true)
////                }
////            }
////        }
//
//    }
//
////    func getFBUserData(){
////        MBProgressHUD.showAdded(to: self.view, animated: true)
////
////        if((FBSDKAccessToken.current()) != nil){
////            FBSDKGraphRequest(graphPath: "me", parameters: ["fields": "id, name, about,location{location}, first_name, last_name, picture.type(large), email,cover,posts{picture},age_range,gender"]).start(completionHandler: { (connection, result, error) -> Void in
////                if (error == nil){
////                    self.dict = result as! [String : AnyObject]
////                    // self.registeronQuickBlox(userDataDic: self.dict)
////                    //  self.insertData(userDataDic: self.dict)
////
////                    let dict = self.dict["picture"] as! [String:Any]
////                    let subDict = dict["data"] as! [String:Any]
////
////                    UserDefaults.standard.set(subDict["url"] as! String, forKey: "photo_url")
////                    UserDefaults.standard.set(self.dict["email"] as! String, forKey: "email")
////                    UserDefaults.standard.set((self.dict["first_name"] as! String) + " " + (self.dict["last_name"] as! String) , forKey: "userName")
////                    UserDefaults.standard.set(self.userToken, forKey: "token")
////                    self.performSegue(withIdentifier: "goHome", sender: nil)
////                }
////                else{
////                    print("error!")
////                    let alert = UIAlertController(title: "Alert", message: "Can't get the detail info you want! ", preferredStyle: UIAlertControllerStyle.alert)
////                    alert.addAction(UIAlertAction(title: "Click", style: UIAlertActionStyle.default, handler: nil))
////                    self.present(alert, animated: true, completion: nil)
////
////                    DispatchQueue.main.async {
////                        MBProgressHUD.hide(for: self.view, animated: true)
////                    }
////                }
////            })
////        }
////    }
}
