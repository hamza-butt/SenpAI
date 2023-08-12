//
//  ExploreSectionView.swift
//  Senpai
//
//  Created by Hamza Butt on 8/11/23.
//

import SwiftUI

struct ExploreSectionView: View {
    
    var aiAnimatorTapped:(()->Void)?
    var imageCreatorTapped:(()->Void)?
    
    var body: some View {
        
        VStack(alignment: .leading,spacing: 20){
           
            Text("Explore")
                .font(.system(size: 20))
                .bold()
           
            HStack(spacing:22) {
                getImageItem(imageName: "aiAnimationIcon", color: Color.init(hex: 0x881D00),title: "AI Animator",subtitle: "Create GIFs through AI")
                
                getImageItem(imageName: "dreamCrafterIcon", color: Color.init(hex: 0x85CBE1),title: "Dream Crafter",subtitle: "Bring your ideas to life")
            }
        }
        .padding(.horizontal,24)
        
        
        
    }
    
    func getImageItem(imageName:String, color:Color, title:String, subtitle:String) -> some View{
        
        Button {
            title == "AI Animator" ? aiAnimatorTapped?() : imageCreatorTapped?()
            
        } label: {
            
            VStack(spacing:8){
                
                Image(imageName)
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(20)
                    .shadow(color: color.opacity(0.6), radius: 20, x: 0, y: 2)
                
                
                VStack {
                    Text(title)
                        .font(.system(size: 18))
                        .fontWeight(.semibold)
                        .foregroundColor(Color.black)
                    
                    Text(subtitle)
                        .font(.system(size: 12))
                        .fontWeight(.medium)
                        .foregroundColor(Color.black)
                    
                }
                
            }
        }

        
        
       
        
    }
}

struct ExploreSectionView_Previews: PreviewProvider {
    static var previews: some View {
        ExploreSectionView()
    }
}
