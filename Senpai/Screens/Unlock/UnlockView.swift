//
//  UnlockView.swift
//  Senpai
//
//  Created by Hamza Butt on 8/12/23.
//

import SwiftUI

struct UnlockView: View {
    var body: some View {
        
        VStack {
            unlcokFeatureView()
            BaseButton(title: "Get SenpAI Pro")
                .padding(.horizontal,34)
        }
        .navigationBarBackButtonHidden(true)
        
       
    }
}

struct UnlockView_Previews: PreviewProvider {
    static var previews: some View {
        UnlockView()
    }
}
