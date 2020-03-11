//
//  AppDelegate.swift
//  USTGlobal_Interview_Demo
//
//  Created by AppEdify TechnoWorld on 27/02/2020.
//  Copyright © 2020 AppEdify TechnoWorld. All rights reserved.
//

import UIKit

@UIApplicationMain

class AppDelegate: UIResponder, UIApplicationDelegate
{
    var app_Controller = App_Controller()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        TextSize()
        return true
    }
    
    //MARK: Whole application text is automatically resizing according to device size.
    
    fileprivate func TextSize()
    {
        UserDefaults.standard.set(UIScreen.main.bounds.width, forKey: "Current_Screen_Width")
        
        if UIDevice.current.userInterfaceIdiom == .pad
        {
            UserDefaults.standard.set("Main", forKey: "Storyboard_Name")
            UserDefaults.standard.set(self.app_Controller.Current_Device_Width1024, forKey: "Text_Size")
        }
        else
        {
            UserDefaults.standard.set("Main", forKey: "Storyboard_Name")
            
            if (UserDefaults.standard.string(forKey: "Current_Screen_Width") == String(320))
            {
                UserDefaults.standard.set(self.app_Controller.Current_Device_Width320, forKey: "Text_Size")
            }
            else if (UserDefaults.standard.string(forKey: "Current_Screen_Width") == String(375))
            {
                UserDefaults.standard.set(self.app_Controller.Current_Device_Width375, forKey: "Text_Size")
            }
            else if (UserDefaults.standard.string(forKey: "Current_Screen_Width") == String(414))
            {
                UserDefaults.standard.set(self.app_Controller.Current_Device_Width414, forKey: "Text_Size")
            }
            
        }
    }
    
    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

