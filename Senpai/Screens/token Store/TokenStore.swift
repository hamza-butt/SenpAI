//
//  TokenStore.swift
//  Senpai
//
//  Created by Hamza Butt on 8/12/23.
//

import SwiftUI

struct TokenStore: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        
        ZStack {
            
            VStack {
                
                ScrollView {
                    TokeStoreHeaderView()
                    TokePricesView()
                }
                .padding(.top,30)
                .ignoresSafeArea()
                
                BaseButton(title: "Continue")
                    .padding(.horizontal,34)
            }

            crossButton
            
            
        }
        .navigationBarBackButtonHidden(true)
        
        
        
        
    }
    
    
    var crossButton:some View{

        VStack {
            HStack{
                Button {
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Image("corss")
                        .resizable()
                        .frame(width: 46, height: 46)
                        .shadow(color: Color(hex: 0x05185C).opacity(0.2), radius: 5, x: 0, y: 4)
                }
                Spacer()
            }
            Spacer()
        }
        .padding(.horizontal,24)


    }
    
    
    
}



struct TokenStore_Previews: PreviewProvider {
    static var previews: some View {
        TokenStore()
    }
}

