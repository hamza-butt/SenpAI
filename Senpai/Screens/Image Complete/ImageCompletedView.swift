//
//  ImageCompletedView.swift
//  Senpai
//
//  Created by Hamza Butt on 8/13/23.
//

import SwiftUI

struct ImageCompletedView: View {
    
    @State var promptResponseImage:Image = Image("base64.online")
    @Environment(\.presentationMode) var presentationMode
    
    
    
    
    var body: some View {
        VStack {

            VStack {
                GeneralHeader(presentationMode: _presentationMode)
                headerTextView
            }
            
            Spacer()
            
            promptResponseImage
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(minHeight: 300,maxHeight: 550)
                .shadow(color: Color.black.opacity(1), radius: 8, x: 0, y: 4)
            
            Spacer()
            
            VStack {
                BaseButton(title: "Generate Again") {
                    print("tapped")
                }
                .padding(.horizontal,24)
            }
            
        }
        .navigationBarBackButtonHidden(true)
        
        
    }
    
    
    
    
    var headerTextView: some View{
        
        VStack(spacing:20) {
            
            Text("Complete")
                .bold()
                .font(.system(size: 30))
            
            Text("The image has been saved to your iPhone! Regenerate the image for different results.")
                .font(.system(size: 14))
                .fontWeight(.semibold)
                .multilineTextAlignment(.center)
            
        }
        .padding(.horizontal,34)
        
        
    }
}

struct ImageCompletedView_Previews: PreviewProvider {
    static var previews: some View {
        ImageCompletedView()
    }
}
