//
//  AppDelegate.swift
//  Milu
//
//  Created by Admin on 8/15/18.
//  Copyright © 2018 Admintest. All rights reserved.
//

import UIKit
import CoreLocation
import GoogleMaps

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    let googleMapsApiKey = "AIzaSyAW-NiJZolvmgcxJxw5eODRF1qMJVLFLTc"
    var bIsSkip = false
    var timer: Timer!
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        GMSServices.provideAPIKey(googleMapsApiKey)
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
        startTimer()
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
        stopTimer()
        
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
        startTimer()
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
        startTimer()
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        
        stopTimer()
        
    }

    
    @objc func runTimedCode() {
        
        if bIsSkip {
            
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "showAlert"), object:nil,
                                            userInfo:nil)
        }
    }
    
    func startTimer(){
        timer = Timer.scheduledTimer(timeInterval: 120, target: self, selector: #selector(runTimedCode), userInfo: nil, repeats: true)
        // timer.fire()
    }
    
    func stopTimer(){
        if timer != nil {
            timer.invalidate()
            //timer = nil
        }
    }

}

