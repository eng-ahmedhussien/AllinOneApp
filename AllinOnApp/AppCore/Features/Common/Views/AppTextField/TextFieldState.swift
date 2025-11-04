//
//  TextFieldState.swift
//  AllinOnApp
//
//  Created by ahmed hussien on 01/02/2024.
//

import Foundation

enum TextFieldState {
    case normal
    case disabled
    case error(labelText: String?)
    case success(labelText: String?)
}

extension TextFieldState: Equatable {
    static func == (lhs: TextFieldState, rhs: TextFieldState) -> Bool {
        switch (lhs, rhs) {
        case (.normal, .normal):
            return true
        case (.disabled, .disabled):
            return true
        case (.error(_), .error(_)):
            return true
        case (.success(_), .success(_)):
            return true
        case (.success(_), .normal):
            return false
        case (.success(_), .disabled):
            return false
        case (.success(_), .error(_)):
            return false
        case (.error(_), .normal):
            return false
        case (.error(_), .disabled):
            return false
        case (.error(_), .success(_)):
            return false
        case (.disabled, .normal):
            return false
        case (.disabled, .error(_)):
            return false
        case (.disabled, .success(_)):
            return false
        case (.normal, .disabled):
            return false
        case (.normal, .error(_)):
            return false
        case (.normal, .success(_)):
            return false
        }
    }
}
