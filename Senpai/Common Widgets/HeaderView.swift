//
//  HeaderView.swift
//  Senpai
//
//  Created by Hamza Butt on 8/9/23.
//

import SwiftUI

struct HeaderView: View {
    
    @State var title:String = "Animate"
    
    var body: some View {
        HStack {
            Text(title)
                .font(.system(size: 24))
                .fontWeight(.bold)
            
            
            Spacer()
            
            
            HStack(spacing:8){
                
                Image("coinIcon")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 24, height: 24)
                    .shadow(color: Color.black.opacity(0.25), radius: 10, x: 0, y: 2)
                
                Text("42")
                    .font(.system(size: 18))
                    .fontWeight(.bold)
                
            }
            
        }
        .frame(height: 30)
        
        
        
       
    }
}


struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView()
    }
}
