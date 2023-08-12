//
//  tokeStoreHeaderView.swift
//  Senpai
//
//  Created by Hamza Butt on 8/12/23.
//

import SwiftUI

struct TokeStoreHeaderView: View {
    var body: some View {
        
        ZStack() {
            
            Image("tokeStoreHeader")
                .resizable()
                .scaledToFill()
                .frame(height: 400)
                .padding(.horizontal,-20)
        }
        
        
        
    }
    
    
    
    func getColoredText(_ text:String, _ isColored:Bool)-> some View{
        Text(text)
            .font(.system(size: 12))
            .fontWeight(.semibold)
            .foregroundColor(isColored ? Color.BlueColor : Color.black)
        
    }
}

struct TokeStoreHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        TokeStoreHeaderView()
    }
}
