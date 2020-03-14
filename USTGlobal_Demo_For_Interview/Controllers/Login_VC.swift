//
//  ViewController.swift
//  USTGlobal_Interview_Demo
//
//  Created by AppEdify TechnoWorld on 27/02/2020.
//  Copyright © 2020 AppEdify TechnoWorld. All rights reserved.
//

import UIKit

class Login_VC: UIViewController {
    
    //MARK: Properties

    @IBOutlet weak var lblTitle: UILabel!
        {
            didSet
            {
                lblTitle.text = "Start Networking!"
                lblTitle.textColor = UIColor.GetColor(fromHEX: Utilities.shared.App_Text_Color)
            }
        }
    @IBOutlet weak var btnNext: UIButton!
        {
            didSet
            {
               
                
                btnNext.backgroundColor = UIColor.GetColor(fromHEX: Utilities.shared.App_Main_Color)
                btnNext.setTitleColor(UIColor.GetColor(fromHEX: Utilities.shared.App_Color_White), for: .normal)
                
            }
        }
    @IBOutlet weak var txtEmail: UITextField!
        {
            didSet
            {
                txtEmail.text = "pvikrant.ios@gmail.com"
                txtEmail.textColor = UIColor.GetColor(fromHEX: Utilities.shared.App_Text_Color)
                
            }
        }
    @IBOutlet weak var viewOfBorder: UIView!
        {
            didSet
            {
                viewOfBorder.backgroundColor = UIColor.GetColor(fromHEX: Utilities.shared.App_Main_Color)
            }
        }
    @IBOutlet weak var lblDetails: UILabel!
        {
            didSet
            {
                lblDetails.textColor = UIColor.GetColor(fromHEX: Utilities.shared.App_Text_Color)
            }
        }
    @IBOutlet weak var btnPrivacyPolicy: UIButton!
        {
            didSet
            {
                btnPrivacyPolicy.setTitleColor(UIColor.GetColor(fromHEX: Utilities.shared.App_Text_Color), for: .normal)
            }
        }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
    }
    
    //MARK: Controller

    @IBAction func btnNextAction(_ sender: Any)
    {
        if let txt = txtEmail.text {
            
            if (txt.isValidEmail()) {
                NavigateToListingPage()
            } else {
                
                alert()
            }
            
        }
        
    }
    
    func NavigateToListingPage()
    {
        let controller = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "EventList_VC") as! EventList_VC
        self.navigationController?.pushViewController(controller, animated: true)
    }
    func alert()
    {
        let alert = UIAlertController(title: "Warning", message: "Email not in proper format", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Okay", style: UIAlertAction.Style.default, handler: nil))
        
        self.present(alert, animated: true, completion: nil)
    }
    
}


