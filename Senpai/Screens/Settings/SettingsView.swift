//
//  SettingsView.swift
//  Senpai
//
//  Created by Hamza Butt on 8/12/23.
//

import SwiftUI

struct SettingsView: View {
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView {
            
            VStack {
                GeneralHeader(presentationMode: _presentationMode, title: "Settings")
                SettingsSectionView()
            }
            
        }
        
        
        
    }
    
    
    
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
