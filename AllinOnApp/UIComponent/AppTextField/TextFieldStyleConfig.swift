//
//  TextFieldStyleConfig.swift
//  AllinOnApp
//
//  Created by ahmed hussien on 01/02/2024.
//

import Foundation
import SwiftUI

struct TextFieldStyleConfig {
    // TextField Style
    public var textColor: Color
    public var placeholderColor: Color
    
    public var backgroundColor: Color
    public var errorBackgroundColor: Color
    public var successBackgroundColor: Color
    
    public var cornerStyle: CornerStyle
    
    // Bottom Label
    public var bottomLabelColor: Color = .black
    public var bottomLabelErrorColor: Color = .red
    public var bottomLabelSuccessColor: Color = .green
    
    // Border Style
    public var borderColor: Color
    public var errorBorderColor: Color = .red
    public var successBorderColor: Color = .green
    public var borderWidth: CGFloat
    
    // Disable Style
    public var disabledForegroundColor: Color
    public var disabledBackgroundColor: Color
    public var disableStrokeColor: Color
}

enum CornerStyle {
    case ellipse
    case cornerRadius(radius: CGFloat)
    case rectangle
}
