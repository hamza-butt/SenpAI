//
//  ExploreHeader.swift
//  Senpai
//
//  Created by Hamza Butt on 8/9/23.
//

import SwiftUI

struct ExploreHeader: View {
    
    @Binding var presentingSettingScreen:Bool
    
    var body: some View {
        HStack {
            
            HStack(spacing:8){
                
                Image("Logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 80, height: 80)
                    .shadow(color: Color.black.opacity(0.3), radius: 5, x: 0, y: 2)
                
                Text("SenpAI")
                    .font(.system(size: 24))
                    .fontWeight(.bold)
                
            }
            
            Spacer()
            
            
            Button {
                presentingSettingScreen = true
                
            } label: {
                
                Image("person")
                    .resizable()
                    .frame(width: 46, height: 46)
                    .shadow(color: Color(hex: 0x05185C).opacity(0.2), radius: 5, x: 0, y: 4)
            }
            
        }
        .frame(height: 60)
        
        
       
    }
}

struct ExploreHeader_Previews: PreviewProvider {
    static var previews: some View {
        ExploreHeader(presentingSettingScreen: .constant(false))
    }
}
