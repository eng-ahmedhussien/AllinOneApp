//
//  NavigationBarWithLogo.swift
//  AllinOnApp
//
//  Created by ahmed hussien on 27/12/2023.
//

import SwiftUI

struct NavigationBarWithLogoMoifier : ViewModifier{
    func body(content: Content) -> some View {
        content
            .navigationTitle("")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                ToolbarItem(placement: .principal) {
                    Image("logo")
                        .resizable()
                        .frame(width: 70,height: 70)
                }
                
            }.padding(.bottom,0)
           
    }
}
extension View{
    func navigationBarWithLogo()-> some View{
        self.modifier(NavigationBarWithLogoMoifier())
    }
}

