//
//  AppManager.swift
//  AllinOnApp
//
//  Created by ahmed hussien on 27/12/2023.
//

import SwiftUI

class AppManager:ObservableObject{
    
    static let shared = AppManager()
    
    //MARK: @Published
    @Published var selectTap = 2
    
}
