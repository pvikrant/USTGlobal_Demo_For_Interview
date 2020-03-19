//
//  Alert.swift
//  USTGlobal_Demo_For_Interview
//
//  Created by AppEdify TechnoWorld on 19/03/2020.
//  Copyright © 2020 AppEdify TechnoWorld. All rights reserved.
//


import UIKit

extension Login_VC
{
    func alertView(alertTitle:String,alertMassage:String,buttonTitle:String,controller:UIViewController)
        {
            let alert = UIAlertController(title: alertTitle, message: alertMassage, preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: buttonTitle, style: UIAlertAction.Style.default, handler: nil))
            
            controller.present(alert, animated: true, completion: nil)
        }
}


