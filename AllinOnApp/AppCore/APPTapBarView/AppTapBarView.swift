//
//  AppTapBarView.swift
//  AllinOnApp
//
//  Created by ahmed hussien on 27/12/2023.
//

import SwiftUI

struct TapBarView: View {

    @StateObject var appManager = AppManager.shared
    
    init() {
        let image = UIImage.gradientImageWithBounds(
            bounds: CGRect( x: 0, y: 0, width: UIScreen.main.scale, height: 8),
            colors: [
                UIColor.clear.cgColor,
                UIColor.black.withAlphaComponent(0.1).cgColor
            ]
        )
        let appearance = UITabBarAppearance()
        appearance.configureWithTransparentBackground()
        appearance.backgroundColor =  UIColor(Color.primary)
        appearance.backgroundImage = UIImage()
        appearance.shadowImage = image
        UITabBar.appearance().standardAppearance = appearance
        UITabBar.appearance().scrollEdgeAppearance = appearance
    }
    
    var body: some View {
        TabView(selection: $appManager.selectTap) {
    
                    CustomTabItem(imageName: "shopsIcon", title: "shopTapBar", tag: 0) {
                        NavigationView {
                            Text("shopTapBar")
                                .navigationBarWithLogo()
                                .onAppear {
                                    UITabBar.showTabBar(animated: true)
                                }
                        }
                    }
                
                CustomTabItem(imageName: "discountIcon", title: "offersTapBar", tag: 1) {
                    Text("offers")
                       // .navigationBarWithLogo()
                }
                
                CustomTabItem(imageName: "homeIcon", title:"HomeTapBar", tag: 2) {
                    NavigationView {
                        MainHomeView()
                       // networkingtest()
//                            .onAppear {
//                                UITabBar.showTabBar(animated: true)
//                            }
                    }
                }
                
                CustomTabItem(imageName: "location", title:"servicesTapBar", tag: 3) {
                    NavigationView {
                       Text("MainServicesView")
                            .navigationBarWithLogo()
                            .onAppear {
                                UITabBar.showTabBar(animated: true)
                            }
                    }
                }
                
                CustomTabItem(imageName: "profileIcon", title: "cartTapBar", tag: 4) {
                    NavigationView {
                        Text("CartPageView")
                            .navigationBarWithLogo()
                            .onAppear {
                                UITabBar.showTabBar(animated: true)
                            }
                    }
                }
                .badge(5)
            }
        .accentColor(Color.gray)
        .environment(\.locale, .init(identifier: "ar"))
            

    }
}

#Preview {
    TapBarView()
}

//MARK: - CustomTabItem
struct CustomTabItem<Content: View>: View {
    var imageName: String
    var title: String
    var tag: Int
    var content: Content
    
    init(imageName: String, title: String,tag:Int,@ViewBuilder content: () -> Content) {
        self.imageName = imageName
        self.title = title
        self.tag = tag
        self.content = content()
    }
    
    var body: some View {
        content
            .tabItem {
                VStack {
                    Image(imageName)
                    Text(title)
                }
            }
            .tag(tag)
            .navigationTitle(title)
    }
}


