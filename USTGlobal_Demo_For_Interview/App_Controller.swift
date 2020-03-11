//
//  App_Controller.swift
//  USTGlobal_Interview_Demo
//
//  Created by Pinalkumar Prajapati on 10/03/20.
//  Copyright © 2020 AppEdify TechnoWorld. All rights reserved.
//

import UIKit

struct App_Controller
{

    static let shared = App_Controller()
    let App_Name = "Google"
    
    let App_Font_Style_Normal = "myriadpro-light"
    let App_Font_Style_Bold = "myriadpro-bold"
    
    // MARK: Color Codes
    
    let App_Main_Color = "45B5F8"  //  45B5F8 F1854D
    let App_Text_Color = "021F5F"
    let App_Color_Light_Gray = "D3D3D3"
    let App_Color_Dark_Gray = "A9A9A9"
    let App_Color_White = "ffffff"
    let App_Color_Black = "000000"
    
    // MARK: Device Size
    
    var Current_Device_Width320 = 18 as CGFloat // iPhone 5 , 5s , SE
    var Current_Device_Width375 = 22 as CGFloat // iPhone 6 , 6s , 7 , 7s , 8 , 8s , X
    var Current_Device_Width414 = 22 as CGFloat // iPhone 6+ , 7+ , 8+
    var Current_Device_Width1024 = 30  as CGFloat // iPad
    

}




