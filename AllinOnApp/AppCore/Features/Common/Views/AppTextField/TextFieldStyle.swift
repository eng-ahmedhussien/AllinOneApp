//
//  TextFieldStyle.swift
//  AllinOnApp
//
//  Created by ahmed hussien on 01/02/2024.
//

import Foundation
import SwiftUI

enum TextFieldStyle {
    case `default`(borderColor:Color = .clear)
    case custom(config: TextFieldStyleConfig)
}

extension TextFieldStyle {
    var styleConfig: TextFieldStyleConfig {
        switch self {
        case .default(borderColor: let borderColor):
            
            return TextFieldStyleConfig(textColor: .black,
                                        placeholderColor: .gray,
                                        backgroundColor: .gray.opacity(0.3),
                                        errorBackgroundColor: .red,
                                        successBackgroundColor: .green,
                                        cornerStyle: .ellipse,
                                        borderColor: borderColor,
                                        borderWidth: 1,
                                        disabledForegroundColor: .gray,
                                        disabledBackgroundColor: .gray,
                                        disableStrokeColor: .clear)
            
        case .custom(config: let config):
            return config
        }
    }
}
