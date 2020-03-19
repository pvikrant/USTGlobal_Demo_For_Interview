//
//  Events_Cell.swift
//  USTGlobal_Interview_Demo
//
//  Created by AppEdify TechnoWorld on 01/03/2020.
//  Copyright © 2020 AppEdify TechnoWorld. All rights reserved.
//

import UIKit

extension String{
    func isValidEmail() -> Bool{
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
        let emailpredicate = NSPredicate(format:"SELF MATCHES [c]%@",emailRegex)
        return (emailpredicate.evaluate(with: self))
    }
    
}

extension UILabel {
    func halfTextColorChange (fullText : String , changeText : String ) {
        let strNumber: NSString = fullText as NSString
        let range = (strNumber).range(of: changeText)
        let attribute = NSMutableAttributedString.init(string: fullText)
        attribute.addAttribute(NSAttributedString.Key.foregroundColor, value: Theme.currentTheme.App_Main_Color , range: range)
        self.attributedText = attribute
    }
}
