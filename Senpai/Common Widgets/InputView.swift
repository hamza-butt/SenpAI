//
//  InputView.swift
//  Senpai
//
//  Created by Hamza Butt on 8/9/23.
//

import SwiftUI

struct InputView: View {
    @Binding var inputText: String
    let MAX_LIMIT = 150
    
    var body: some View {
        VStack {
            
            inputHeaderView
            inputView
        }
        
        
    }
    
    
    var inputHeaderView: some View{
        HStack {
            Text("Enter Prompt")
                .font(.system(size: 16))
                .fontWeight(.bold)
            
            Spacer()
            
            Button {
                
            } label: {
                
                HStack{
                    
                    Text("My Art")
                        .foregroundColor(Color.BlueColor)
                        .font(.system(size: 12))
                        .fontWeight(.bold)
                    
                    Image("rightArrow")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 10, height: 10)
                        .foregroundColor(.blue)
                }
                
            }

        }
        
    }
    
    var inputView: some View {
        VStack {
            TextEditor(text: $inputText)
                .padding(8)
                .onChange(of: inputText) { newText in
                    if newText.count > MAX_LIMIT {
                        inputText = String(newText.prefix(MAX_LIMIT))
                    }
                }
            
            HStack {
                Text("\(inputText.count) / \(MAX_LIMIT)")
                    .foregroundColor(Color.gray)
                    .font(.system(size: 12))
                    .fontWeight(.medium)
                
                Spacer()
                
                HStack(spacing: 8) {
                    Image("coinIcon")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 24, height: 24)
                        .shadow(color: Color.black.opacity(0.25), radius: 10, x: 0, y: 2)
                    
                    Text(" = 0\(IMAGE_GENERATE_PRICE)")
                        .font(.system(size: 18))
                        .fontWeight(.bold)
                        .foregroundColor(Color.BlueColor)
                }
            }
            .padding(.horizontal, 16)
            .padding(.bottom,8)
        }
        .frame(height: 140)
        .overlay(
            RoundedRectangle(cornerRadius: 0)
                .stroke(Color.init(hex: 0xE2E2E2), lineWidth: 1)
        )
    }
    
    

        
        
}

struct InputView_Previews: PreviewProvider {
    static var previews: some View {
        InputView(inputText: .constant("Hello"))
    }
}
