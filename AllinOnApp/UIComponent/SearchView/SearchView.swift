//
//  SearchView.swift
//  AllinOnApp
//
//  Created by ahmed hussien on 01/02/2024.
//

import SwiftUI

struct SearchView: View {
    @StateObject private var searchVM :SearchVM =  SearchVM()
    
    @State private var showSearchSugestion = false
    

    
    
    var body: some View {
        VStack{
            AppTextField(data: $searchVM.searchSuggestionsText,
                         placeholderText: "Search a product, brands…".localized(),
                         leadingView: {Image("MapSearch")})
        }
        .padding(.vertical)
        .padding(.horizontal,20)
       // .dismissKeyboard(on: [.tap])
       
        
    }
}

#Preview {
    SearchView()
}


