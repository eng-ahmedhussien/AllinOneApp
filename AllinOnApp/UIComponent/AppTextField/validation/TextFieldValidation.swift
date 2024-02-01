//
//  TextFieldValidation.swift
//  AllinOnApp
//
//  Created by ahmed hussien on 01/02/2024.
//

import Foundation

//TODO: Add validation messages
extension AppTextField {
    func validate(text: String) {
        
        if data.isClear == true {
            data.isClear = false
            return
        }
        
        // varible
        
        // Email
        func validEmail()->Bool{
            let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
            let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
            return emailPred.evaluate(with: text) ? false : true
        }
        
        // Mobile
        func validMobile()->Bool{
            let formatter: NumberFormatter = NumberFormatter()
            formatter.locale = NSLocale(localeIdentifier: "EN") as Locale
            let number = formatter.number(from: text)
            if number == nil || text.count < 10 {
                return false
            }else{
                return true
            }
        }
       
        
        
        guard let validation = validation else {
            data.isValid = true
            return
        }
        
        switch validation {
        case .isEmpty:
            if text.isEmpty {
                data.state = .error(labelText: "Please fill the field".localized())
                data.isValid = false
                return
            }
        case .mobileNumber:
         
            
            if validMobile() == false {
                data.state = .error(labelText: "Please enter a valid phone number".localized())
                data.isValid = false
                return
            }
            
        case .email:
           
            
            if validEmail() {
                data.state = .error(labelText: "Please enter a valid email".localized())
                data.isValid = false
                return
            }
            
        case .password:
            if !(text.count >= 6 && text.count <= 255) {
                data.state = .error(labelText: "Password should be at least 6 characters long".localized())
                data.isValid = false
                return
            }
            
        case .confirmPassword(let password):
            if password.wrappedValue != text {
                data.state = .error(labelText: "The password doesn't match".localized())
                data.isValid = false
                return
            }
            
        case .limit(min: let min, max: let max):
            // TODO: Add implementation
            break
            
        case .equal(number: let number):
            if text.count != number {
                data.state = .error(labelText: "The number of characters should equal to".localized() + "\(number)")
                data.isValid = false
                return
            }
            
        case .numeric:
            if !CharacterSet.decimalDigits.isSuperset(of: CharacterSet(charactersIn: text)) {
                data.state = .error(labelText: "Please enter a number".localized())
                data.isValid = false
                return
            }
            
        case .numbericFloat:
            let formatter = NumberFormatter()
            formatter.allowsFloats = true
            if formatter.number(from: text) == nil {
                data.state = .error(labelText: "Please enter a number".localized())
                data.isValid = false
                return
            }
            
        case .nationalID:
            if text.count != 10 {
                data.state = .error(labelText: "Please enter a valid national ID".localized())
                data.isValid = false
                return
            }
        case .mobile_Email:
            if text.first == "0"{
                if validMobile() == false {
                    data.state = .error(labelText: "Please enter a valid phone number".localized())
                    data.isValid = false
                    return
                }
            }else{
                if validEmail() {
                    data.state = .error(labelText: "Please enter a valid email".localized())
                    data.isValid = false
                    return
                }
            }
        }
        
        data.isValid = true
        data.state = .normal
    }
}
