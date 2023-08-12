//
//  unlcokFeatureView.swift
//  Senpai
//
//  Created by Hamza Butt on 8/12/23.
//

import SwiftUI

struct unlcokFeatureView: View {
    
    let price:String = "$24.99"
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ZStack {
            
            VStack {
                Image("unclokBgImage")
                    .resizable()
                    .scaledToFill()
                    .frame(height: 400)
                
                Spacer()
            }
            .ignoresSafeArea()
            
            crossButton
            
            
            
            scrolledItem
            
            
        }
        
        
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
    
    var scrolledItem:some View{
        ScrollView {
            Spacer(minLength: 200)
            
            Text("Unclok \n Everything")
                .fontWeight(.heavy)
                .font(.system(size: 42))
                .multilineTextAlignment(.center)
            
            
            
            Text("Gain access to our premium styles and enjoy a 20% discount with SenpAI PRO")
                .multilineTextAlignment(.center)
                .fontWeight(.semibold)
                .font(.system(size: 16))
                .padding(.top,20)
            
            
            featureView
                .padding(.top,34)
            
            priceView
                .padding(.top,50)
           
            
        }
        .padding(.horizontal,34)
        
    }
    
    var featureView: some View{
        VStack(alignment:.leading,spacing: 14){
            
            getFeatureIcon(title1: "Unlock", title2: "premium art styles")
            getFeatureIcon(title1: "20% Off", title2: "all token packs")
            getFeatureIcon(title1: "Early Access", title2: "to art styles")
            getFeatureIcon(title1: "Ad-Free", title2: "app experience")
        }
    }
    
    func getFeatureIcon(title1:String, title2:String)-> some View{
        HStack(spacing:12) {
            
            Image("unlockFeatureMoreIcon")
                .resizable()
                .scaledToFit()
                .frame(width: 20, height: 20)
            
            HStack (spacing:4){
                Text(title1)
                    .font(.system(size: 14))
                    .fontWeight(.heavy)
                
                Text(title2)
                    .font(.system(size: 14))
                    .fontWeight(.medium)
            }
            
            
        }
        
    }
    
    var priceView: some View{
        VStack(spacing:14){
            
            Text("\(price) per year")
                .font(.system(size: 24))
                .fontWeight(.bold)
            
            
            Text("(less than $0.48 per week)")
                .font(.system(size: 14))
                .fontWeight(.bold)
                .foregroundColor(Color.BlueColor)
        }
    }
    
    
    
    
}

struct unlcokFeatureView_Previews: PreviewProvider {
    static var previews: some View {
        unlcokFeatureView()
    }
}
