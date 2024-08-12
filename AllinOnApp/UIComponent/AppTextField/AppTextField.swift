//
//  AppTextField.swift
//  AllinOnApp
//
//  Created by ahmed hussien on 01/02/2024.
//


import SwiftUI

struct AppTextField<ContentLeading: View, ContentTrailing: View>: View {
  
    @Binding var data: TextFieldData
    let style: TextFieldStyle
    let placeholderText: String
    var isSecure: Bool
    let validation: ValidationType?
    let leadingView: ContentLeading
    let trailingView: ContentTrailing
    
    @State private var showPassword: Bool = false
    
    init(data: Binding<TextFieldData>,
         style: TextFieldStyle = .default(),
         placeholderText: String,
         isSecure: Bool = false,
         validation: ValidationType? = nil,
         @ViewBuilder leadingView: () -> ContentLeading = { EmptyView() },
         @ViewBuilder trailingView: () -> ContentTrailing = { EmptyView() }) {
        
        self._data = data
        self.style = style
        self.placeholderText = placeholderText
        self.isSecure = isSecure
        self.validation = validation
        self.leadingView = leadingView()
        self.trailingView = trailingView()
    }
    
    // Getter Attributes
    private var styleConfig: TextFieldStyleConfig {
        get {
            style.styleConfig
        }
    }
    
    private var isDisabled: Bool {
        get {
            data.state == .disabled
        }
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            HStack {
                leadingView
                
                textField
                    .foregroundColor(styleConfig.textColor)
                    .placeholder(when: data.text.isEmpty, placeholder: {
                        Text(placeholderText)
                            .foregroundColor(isDisabled ? styleConfig.disabledForegroundColor : styleConfig.placeholderColor)
                    })
                    .onChange(of: data.text, perform: validate)
                
                if isSecure {
                    showPasswordButton
                } else {
                    trailingView
                }
            }
            .padding(.vertical, 12)
            .padding(.horizontal)
            .background(backgroundView)
            .disabled(isDisabled)
          
            /// Bottom Label
            bottomLabel
            
        }
    }
    
    
    //MARK: Show Password
    private var showPasswordButton: some View {
        Button(action: togglePassword) {
            Image(systemName:
                    showPassword ? "eye" : "eye.slash")
            .foregroundColor(.gray)
        }
    }
    
    private func togglePassword() {
        showPassword.toggle()
    }
    
    //MARK: TextField
    @ViewBuilder private var textField: some View {
      
        if isSecure && !showPassword {
            SecureField("", text: $data.text)
        } else {
            TextField("", text: $data.text)
                
        }
    }
    
    //MARK: Bottom Label
    @ViewBuilder private var bottomLabel: some View {
        switch data.state {
        case .normal, .disabled:
            EmptyView()

        case .error(let labelText):
            if let text = labelText {
                bottomLabel(text: text)
            }

        case .success(let labelText):
            if let text = labelText {
                bottomLabel(text: text)
            }
        }
    }
    
    //MARK: Background View
    @ViewBuilder private var backgroundView: some View {
        
        switch styleConfig.cornerStyle {
        case .ellipse:
            Capsule()
                .strokeBorder(borderColor, lineWidth: styleConfig.borderWidth)
                .background(Capsule().fill(backgroundColor))
            
        case .cornerRadius(radius: let radius):
            RoundedRectangle(cornerRadius: radius)
                .strokeBorder(borderColor, lineWidth: styleConfig.borderWidth)
                .background(RoundedRectangle(cornerRadius: radius).fill(backgroundColor))
            
        case .rectangle:
            Rectangle()
                .strokeBorder(borderColor, lineWidth: styleConfig.borderWidth)
                .background(Rectangle().fill(backgroundColor))
        }
    }
    
    //MARK: Bottom Label
    private func bottomLabel(text: String) -> some View {
        Text(text)
            .font(.subheadline)
            .padding(.horizontal, 16)
            .foregroundColor(bottomLabelColor)
    }
    
    //MARK: Colors
    private var borderColor: Color {
        switch data.state {
        case .normal:
            return styleConfig.borderColor
        case .error:
            return styleConfig.errorBorderColor
        case .success:
            return styleConfig.successBorderColor
        case .disabled:
            return styleConfig.disableStrokeColor
        }
    }
    
    private var bottomLabelColor: Color {
        switch data.state {
        case .normal:
            return styleConfig.bottomLabelColor
        case .error:
            return styleConfig.bottomLabelErrorColor
        case .success:
            return styleConfig.bottomLabelSuccessColor
        case .disabled:
            return styleConfig.disabledForegroundColor
        }
    }
    
    private var backgroundColor: Color {
        switch data.state {
        case .normal:
            return styleConfig.backgroundColor
        case .disabled:
            return styleConfig.disabledBackgroundColor
        case .error(_):
            return styleConfig.errorBackgroundColor
        case .success(_):
            return styleConfig.successBackgroundColor
        }
    }
}


struct AppTextField_Previews: PreviewProvider {
    @State static var normalTextFieldData = TextFieldData(state:
            .normal
    )
    
    @State static var successTextFieldData = TextFieldData(state:
            .success(labelText: "This is a success message")
    )
    
    @State static var errorTextFieldData = TextFieldData(state:
            .error(labelText: "This is an error message")
    )
    
    @State static var disabledTextFieldData = TextFieldData(state:
            .disabled
    )
    
    static var previews: some View {
        VStack(spacing: 20) {
            AppTextField(data: $normalTextFieldData, style: .default(), placeholderText: "Placeholder Text")
                .previewLayout(.sizeThatFits)
            
            AppTextField(data: $successTextFieldData, style: .default(), placeholderText: "Success Placeholder Text")
                .previewLayout(.sizeThatFits)
            
            AppTextField(data: $errorTextFieldData, style: .default(), placeholderText: "Error Placeholder Text")
                .previewLayout(.sizeThatFits)
            
            AppTextField(data: $disabledTextFieldData, style: .default(), placeholderText: "Disabled Placeholder Text")
                .previewLayout(.sizeThatFits)
        }
        .padding()
    }
}

//MARK: Placeholder
extension View {
    func placeholder<Content: View>(
        when shouldShow: Bool,
        alignment: Alignment = .leading,
        @ViewBuilder placeholder: () -> Content) -> some View {

        ZStack(alignment: alignment) {
            placeholder().opacity(shouldShow ? 1 : 0)
            self
        }
    }
}

enum ValidationType {
    case isEmpty
    case mobileNumber
    case email
    case password
    case confirmPassword(password: Binding<String>)
    case limit(min: Int?, max: Int?)
    case equal(number: Int)
    case numeric
    case numbericFloat
    case nationalID
    case mobile_Email
}
