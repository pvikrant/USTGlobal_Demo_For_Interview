//
//  String.swift
//  USTGlobal_Interview_Demo
//
//  Created by Pinalkumar Prajapati on 10/03/20.
//  Copyright © 2020 AppEdify TechnoWorld. All rights reserved.
//

import Foundation

extension String{
    func isValidEmail() -> Bool{
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
        let emailpredicate = NSPredicate(format:"SELF MATCHES [c]%@",emailRegex)
        return (emailpredicate.evaluate(with: self))
    }
    
}
