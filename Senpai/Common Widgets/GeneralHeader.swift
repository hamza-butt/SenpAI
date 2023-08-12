//
//  GeneralPresentDismiss.swift
//  Senpai
//
//  Created by Hamza Butt on 8/12/23.
//

import SwiftUI

struct GeneralHeader: View {
    @Environment(\.presentationMode) var presentationMode
    
    @State var title:String = ""
    
    var body: some View {
       
        ZStack{
            
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
            
            
            Text(title)
                .font(.system(size: 20))
                .bold()
            
            
        }
        .padding(.horizontal,24)
        
        
    }
}
struct GeneralHeader_Previews: PreviewProvider {
    static var previews: some View {
        GeneralHeader(title: "Settings")
    }
}
