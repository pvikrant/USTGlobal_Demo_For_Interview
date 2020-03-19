//
//  ViewController.swift
//  USTGlobal_Interview_Demo
//
//  Created by AppEdify TechnoWorld on 27/02/2020.
//  Copyright © 2020 AppEdify TechnoWorld. All rights reserved.
//

import UIKit

class Login_VC: UIViewController, UITextFieldDelegate
{
    
    //MARK: Properties
    
    
    
    @IBOutlet weak var viewOfBackground: UIView!
    @IBOutlet weak var viewOfBGImage: UIView!
    @IBOutlet weak var imgViewOfBGImage: UIImageView!
    @IBOutlet weak var imgViewOfLogo: UIImageView!
    @IBOutlet weak var viewOfBottom: UIView!
    @IBOutlet weak var btnThemeChange: UISwitch!
    @IBOutlet weak var lblTitle: UILabel!
        {
            didSet
            {
                lblTitle.text = "Start Networking!"
            }
        }
    @IBOutlet weak var btnNext: UIButton!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var viewOfBorder: UIView!
    @IBOutlet weak var lblDetails: UILabel!
        {
            didSet
            {
                lblDetails.text = "By clicking next, you're agree to our Privacy policy"
                let tap = UITapGestureRecognizer(target: self, action: #selector(self.tapOnPrivacyPolicy))
                lblDetails.isUserInteractionEnabled = true
                lblDetails.addGestureRecognizer(tap)
            }
        }
    override func viewDidLoad()
    {
        super.viewDidLoad()
        applyTheme()
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillShow(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillHide(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        
    }
    
    //MARK: Theme Apply
    func applyTheme()
    {
        lblTitle.textColor = Theme.currentTheme.App_Text_Color
        btnNext.backgroundColor = Theme.currentTheme.App_Main_Color
        btnNext.setTitleColor(Theme.currentTheme.app_Tint, for: .normal)
        txtEmail.textColor = Theme.currentTheme.App_Text_Color
        viewOfBorder.backgroundColor = Theme.currentTheme.App_Main_Color
        lblDetails.textColor = Theme.currentTheme.App_Text_Color
        lblDetails.halfTextColorChange(fullText: lblDetails.text!, changeText: "Privacy policy", textColor: Theme.currentTheme.App_Main_Color)
        btnThemeChange.onTintColor = Theme.currentTheme.App_Main_Color
    }
    
    //MARK: Controller
    
    @IBAction func switchTheme(_ sender: UISwitch)
    {
        Theme.currentTheme = sender.isOn ? Light_Theme() : Dark_Theme()
        UserDefaults.standard.set(sender.isOn, forKey: "LightTheme")
        applyTheme()
    }
    
    @objc func tapOnPrivacyPolicy(sender:UITapGestureRecognizer)
    {
        self.alertView(alertTitle: "Information", alertMassage: "Privacy Policy will upload soon", buttonTitle: "Okay", controller: self)
    }

    @IBAction func btnNextAction(_ sender: Any)
    {
        if txtEmail.text != ""
        {
            if ((txtEmail.text?.isValidEmail())!)
            {
                NavigateToListingPage()
            }
            else
            {
                self.alertView(alertTitle: "Warning!", alertMassage: "Email not in proper format", buttonTitle: "Okay", controller: self)
            }
        }
        else
        {
            self.alertView(alertTitle: "Warning!", alertMassage: "Please enter valid email.", buttonTitle: "Okay", controller: self)
        }
    }
    
    //MARK: Default Funcations
   
    func NavigateToListingPage()
    {
        txtEmail.text = ""
        txtEmail.resignFirstResponder()
        let controller = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "EventList_VC") as! EventList_VC
        self.navigationController?.pushViewController(controller, animated: true)
    }

    //MARK: TextField
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
      txtEmail.resignFirstResponder()
        
        return true
    }
    
    //MARK: Keyboard
    
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue
        {
            self.view.frame.origin.y -= keyboardSize.height
        }
    }
    @objc func keyboardWillHide(notification: NSNotification) {
        self.view.frame.origin.y = 0
    }
    
}


