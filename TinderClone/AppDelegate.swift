//
//  AppDelegate.swift
//  TinderClone
//
//  Created by NL33 on 2/12/15.
//  Copyright (c) 2015 NL33. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        
       Parse.setApplicationId("Nx47gJZx9yExd1FPnsfz9dvkNoUQoDgwCYVauRW8", clientKey: "i1UZV2VUmN3yjatTpoUPqBsIZoeQp3P2FT8q5KgC") //both numbers from Parse keys. First number is Application Id, Second Number is client key
        
        PFFacebookUtils.initializeFacebook()
        
        //the following is for setting up Push Notifications:
        var pushSettings: UIUserNotificationSettings = UIUserNotificationSettings(forTypes: .Alert, categories: nil)  //this just describes what type of notification we want to use. We are here choosing "alert"
        
        application.registerUserNotificationSettings(pushSettings) //here we register the user notification settings
        
        application.registerForRemoteNotifications() //here we register for remote notifications
        
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication!) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    func application(application: UIApplication,
        openURL url: NSURL,
        sourceApplication: String?,
        annotation: AnyObject?) -> Bool {
            return FBAppCall.handleOpenURL(url, sourceApplication:sourceApplication,
                withSession:PFFacebookUtils.session())
    }
    
    func applicationDidBecomeActive(application: UIApplication) {
        FBAppCall.handleDidBecomeActiveWithSession(PFFacebookUtils.session())
    }
 
  
}

