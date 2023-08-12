//
//  Explore.swift
//  Senpai
//
//  Created by Hamza Butt on 8/9/23.
//

import SwiftUI

struct Explore: View {
    
    @State var presentingSettingScreen = false
    @Binding var selectedTab: Int
    
    
    var body: some View {
        VStack(spacing: 32) {
            ExploreHeader(presentingSettingScreen: $presentingSettingScreen)
                .padding(.leading, 10)
                .padding(.trailing, 20)
            
            ScrollView {
                ExploreSectionView {
                    selectedTab = 1
                } imageCreatorTapped: {
                    selectedTab = 2
                }

                
                
                InspirationSectionView()
            }
        }
        .fullScreenCover(isPresented: $presentingSettingScreen) {
            SettingsView()
        }
    }

}

struct Explore_Previews: PreviewProvider {
    static var previews: some View {
        Explore( selectedTab: .constant(1))
    }
}
