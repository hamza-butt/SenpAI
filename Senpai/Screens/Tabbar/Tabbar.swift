//
//  Tabbar.swift
//  Senpai
//
//  Created by Hamza Butt on 8/12/23.
//

import SwiftUI

struct Tabbar: View {
    @State private var selectedTab: Int = 0

    
    init() {
        UITabBar.appearance().unselectedItemTintColor = UIColor.init(red: 158/256, green: 158/256, blue: 158/256, alpha: 1)
    }
    
    var body: some View {
        TabView(selection: $selectedTab) {
            Explore(selectedTab: $selectedTab)
                .tabItem {
                    if selectedTab == 0 {
                        Image("exploreIconSelected")
                            .frame(width: 30, height: 30)
                    } else {
                        Image("exploreIconUnselected")
                            .frame(width: 30, height: 30)
                    }
                    Text("Explore")
                }
                .tag(0)
            
            AnimateeeView()
                .tabItem {
                    if selectedTab == 1 {
                        Image("animateIconSelected")
                    } else {
                        Image("animateIconUnselected")
                    }
                    Text("Animate")
                }
                .tag(1)
            
            GenerateView()
                .tabItem {
                    if selectedTab == 2 {
                        Image("generateIconSelected")
                    } else {
                        Image("generateIconUnselected")
                    }
                    Text("Generate")
                }
                .tag(2)
        }
        .accentColor(.black)
    }

}


struct AnimateeeView: View {
    var body: some View {
        Text("Animate Tab Content")
            .font(.largeTitle)
    }
}


struct Tabbar_Previews: PreviewProvider {
    static var previews: some View {
        Tabbar()
    }
}
