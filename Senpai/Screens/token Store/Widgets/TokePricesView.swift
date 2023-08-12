//
//  TokePricesView.swift
//  Senpai
//
//  Created by Hamza Butt on 8/12/23.
//

import SwiftUI

struct TokePricesView: View {
    
    @State var selectedIndex:Int = 0
    
    
    var body: some View {
        
        VStack(spacing:20) {
            
            getPriceView(0, 50, "9.99")
            getPriceView(1, 250, "19.99")
            getPriceView(2, 500, "34.99")
            
        }
        .padding(.top,50)
        
       
    }
    
    func getPriceView(_ tag: Int, _ tokenValue: Int, _ price: String) -> some View {
        
        Button {
            selectedIndex = tag
        } label: {
            
            ZStack {
                
                HStack() {
                    HStack(spacing: 10) {
                        Image(selectedIndex == tag ? "selectedToken" :  "unSelectedToken")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20, height: 20)
                        
                        Text("\(tokenValue) Tokens")
                            .font(.system(size: 16))
                            .foregroundColor(.black)
                            .fontWeight(.medium)
                    }
                    
                    Spacer()
                    
                    Text("$\(price)")
                        .font(.system(size: 16))
                        .foregroundColor(.black)
                        .fontWeight(.medium)
                }
                
            }
            .padding(.horizontal, 63)
            .frame(height: 56)
            .cornerRadius(14)
            .overlay(
                RoundedRectangle(cornerRadius: 14)
                    .stroke(Color.black, lineWidth: 3)
                    .padding(.horizontal, 45)
            )
            .overlay(
                
                getPopularView(tag)
                
                )
        }
    }
    
    
    func getPopularView(_ tag:Int)-> AnyView{
        if tag == 0{
           return AnyView(EmptyView())
            
        }else{
            
            return AnyView(
            
                HStack{
                    Spacer()
                    
                    Text(tag == 1 ? "Most Popular" : "Most Value")
                        .padding(.horizontal,6)
                        .padding(.vertical,3)
                        .background(Color.BlueColor)
                        .foregroundColor(Color.white)
                        .cornerRadius(3)
                        .padding(.horizontal, 63)
                        .padding(.top, -40)

                    
                }
            )
        }
        
        
    }

}

struct TokePricesView_Previews: PreviewProvider {
    static var previews: some View {
        TokePricesView()
    }
}



