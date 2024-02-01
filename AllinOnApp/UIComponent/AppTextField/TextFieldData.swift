//
//  TextFieldData.swift
//  AllinOnApp
//
//  Created by ahmed hussien on 01/02/2024.
//

import Foundation
import Combine
import SwiftUI

struct TextFieldData {
    var text: String = ""
    var isValid: Bool = false
    var state: TextFieldState = .normal
    var delegate: TextFieldDataDelegate?
    var isClear: Bool = false
    
    mutating func clearData(){
        isClear = true
        isValid = false
        state  = .normal
        text = ""
    }
}

protocol TextFieldDataDelegate: AnyObject {
    func textFieldDataDidChangeValidity(_ data: TextFieldData)
}
