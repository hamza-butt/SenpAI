//
//  BaseButton.swift
//  Senpai
//
//  Created by Hamza Butt on 8/9/23.
//

import SwiftUI

struct BaseButton: View {
    
    @State var title:String = "Generate"
    var buttonTapped:(()->Void)?
    
    var body: some View {
        Button {
            buttonTapped?()
        } label: {
            
            HStack{
                Spacer()
                Text(title)
                    .font(.system(size: 20))
                    .bold()
                    .foregroundColor(.white)
                Spacer()
            }
            .frame(height: 60)
            .background(Color.black)
            .cornerRadius(16)
            .shadow(color: Color.black.opacity(0.25), radius: 5, x: 0, y: 4)
            
            
            
        }

    }
}

struct BaseButton_Previews: PreviewProvider {
    static var previews: some View {
        BaseButton()
    }
}
