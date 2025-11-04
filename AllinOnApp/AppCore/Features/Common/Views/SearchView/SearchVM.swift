//
//  SearchVM.swift
//  AllinOnApp
//
//  Created by ahmed hussien on 01/02/2024.
//


import Foundation
import Combine

class SearchVM:ObservableObject{

    @Published var searchSuggestionsText: TextFieldData = TextFieldData()
    private var cancellable =  Set<AnyCancellable>()
    
    init(){
        self.subscriberData()
    }
    
    
    func subscriberData(){

        searchSuggestionsSubscriber()
    }
    
    func searchSuggestionsSubscriber(){
        $searchSuggestionsText
            .sink { TF_suggestion in
               // print("searchSuggestionsText : = \(TF_suggestion)")
            }
            .store(in: &cancellable)
    }
    
}

