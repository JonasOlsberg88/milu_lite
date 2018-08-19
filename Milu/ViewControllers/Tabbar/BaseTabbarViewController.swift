//
//  BaseTabbarViewController.swift
//  Milu
//
//  Created by Admin on 3/8/17.
//  Copyright © 2017 Clio. All rights reserved.
//

import UIKit

class BaseTabbarViewController: UITabBarController,UITabBarControllerDelegate
{

    @IBOutlet weak var tab_bar: UITabBar!
    
    
    let greycolor = UIColor(red : 159/255, green : 159/255, blue : 159/255, alpha : 1)
    let bluecolor = UIColor(red : 0/255, green : 200/255, blue : 255/255, alpha : 1)
    var strTabOn : NSMutableArray  = []
    var strTabOff : NSMutableArray  = []
    var currentDay : Int?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.delegate = self
        for i in 1...31 {
            
            if (i < 10){
                strTabOn.add("tab_bar_calendar_selected0" + String(i))
                strTabOff.add("tab_bar_calendar0" + String(i))
            }else{
                strTabOn.add("tab_bar_calendar_selected" + String(i))
                strTabOff.add("tab_bar_calendar" + String(i))
            }
           
        }
        
        let date = Date()
        let calendar = Calendar.current
        currentDay = calendar.component(.day, from: date)
        
        self.initTabbar()
    }

    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        let tabBarIndex = tabBarController.selectedIndex
        if tabBarIndex == 4 {
            let appDelegate : AppDelegate = (UIApplication.shared.delegate as? AppDelegate)!
           // appDelegate.isOwnerProfile = true
        }
    }

    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        
//        let tabBarIndex = tabBarController.selectedIndex
//        
//        if UserDefaults.standard.string(forKey: "token") == nil || UserDefaults.standard.string(forKey: "token")! == "" {
//            
//            if tabBarIndex == 4 {
//                return false
//            }
//        }
        
        return true
        
    }
   
    
    func initTabbar(){
        
        
        let tabArray = self.tab_bar.items as NSArray?
        self.tab_bar.tintColor = bluecolor
//        self.tabbar.barTintColor = UIColor.clear
        self.tab_bar.isTranslucent = true
        
//        self.tabbar.backgroundImage = UIImage.imageWithView(view: clear.clearColor)
    //   self.tabBar.backgroundColor = UIColor.darkGray
       // self.tabBar.layer.backgroundColor = UIColor.clear.withAlphaComponent(0.7).cgColor
//        self.tabBar.backgroundImage = nil
//        self.tabBar.shadowImage = nil
       
        
        self.tabBar.layer.shadowOffset = CGSize(width: 0, height: -4)
        self.tabBar.layer.shadowRadius = 2
        self.tabBar.layer.shadowOpacity = 0.24
        self.tabBar.layer.shadowColor = UIColor.black.cgColor
        
        let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.dark)
        let blurEffectView:UIVisualEffectView =  UIVisualEffectView(effect:blurEffect)
        blurEffectView.frame =  self.tab_bar.bounds
        
        self.tab_bar!.insertSubview(blurEffectView,at:0)
      
        
        let tabItem0 = tabArray?.object(at: 0) as! UITabBarItem
        tabItem0.selectedImage = UIImage(named: strTabOn[currentDay!-1] as! String)!
        tabItem0.image = UIImage(named:strTabOff[currentDay!-1] as! String)?.withRenderingMode(.alwaysOriginal)
        
        let tabItem1 = tabArray?.object(at: 1) as! UITabBarItem
            tabItem1.selectedImage = UIImage(named: "tabitem_messageon")!
            tabItem1.image = UIImage(named:"tabitem_messageoff")?.withRenderingMode(.alwaysOriginal)
      
        let tabItem2 = tabArray?.object(at: 2) as! UITabBarItem
            tabItem2.selectedImage = UIImage(named: "tabitem_useritemon")!
            tabItem2.image = UIImage(named:"tabitem_useritemoff")?.withRenderingMode(.alwaysOriginal)
        
    }
//    // UITabBarDelegate
//    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
//        print("Selected item")
//        print(item)
//        
//    }
//
//    // UITabBarControllerDelegate
//    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
//        print("Selected view controller")
//    }

//    override func viewDidAppear(_ animated: Bool) {
//        self.tabbar.selectedItem = tabbar.items?[1]
//    }
}
extension UIImage {
    class func imageWithView(view: UIView) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(view.bounds.size, view.isOpaque, 0.0)
        view.drawHierarchy(in: view.bounds, afterScreenUpdates: true)
        let img = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return img
    }
}



