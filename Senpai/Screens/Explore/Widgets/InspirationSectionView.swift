//
//  InspirationSectionView.swift
//  Senpai
//
//  Created by Hamza Butt on 8/12/23.
//

import SwiftUI

struct InspirationImageModel{
    let name:String
    let isAvailable:Bool
}

struct InspirationSectionView: View {
    
    let items: [GridItem] = [ GridItem(.flexible()), GridItem(.flexible()) ]
    
    //let iconHeightList:[CGFloat] = [230, 150, 150, 230, 220, 177]
    
    
    let leftImages:[InspirationImageModel] = [
        InspirationImageModel.init(name: "inspiration0", isAvailable: true),
        InspirationImageModel.init(name: "inspiration2", isAvailable: true),
        InspirationImageModel.init(name: "inspiration4", isAvailable: true)]
    
    
    let rightImages:[InspirationImageModel] = [
        InspirationImageModel.init(name: "inspiration1", isAvailable: false),
        InspirationImageModel.init(name: "inspiration3", isAvailable: true),
        InspirationImageModel.init(name: "inspiration5", isAvailable: true)]
    
    
    
    var body: some View {
        
        VStack(alignment:.leading,spacing: 20){
            
            Text("Inspiration")
                .bold()
                .font(.system(size: 20))
            
            ScrollView {
                
                
                HStack {
                    
                    LazyVGrid(columns: [GridItem(.flexible())], spacing: 16) {
                        ForEach(0..<leftImages.count, id: \.self) { index in
                            getImageItem(leftImages[index])
                        }
                    }
                    
                    LazyVGrid(columns: [GridItem(.flexible())], spacing: 16) {
                        ForEach(0..<rightImages.count, id: \.self) { index in
                            getImageItem(rightImages[index])
                        }
                    }
                }
                
            }
            
        }
        .padding(.horizontal,24)
        .padding(.top,30)
        
        
    }
    
    
    func getImageItem(_ item:InspirationImageModel) -> some View{
        
        ZStack(alignment:.topTrailing) {
            
            Image(item.name)
                .resizable()
                .scaledToFit()
                .cornerRadius(20)
                .shadow(color: Color.black.opacity(0.3), radius: 5, x: 0, y: 4)
            
            
            if !item.isAvailable{
                
                Image("Locked")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 30, height: 30)
                    .padding(.top,10)
                    .padding(.trailing,10)
                    .shadow(color: Color.black.opacity(0.3), radius: 4, x: 0, y: 2)
                
            }
            
        }
        .onTapGesture {
            
        }
        
    }
    
    
    
    
}

struct InspirationSectionView_Previews: PreviewProvider {
    static var previews: some View {
        InspirationSectionView()
    }
}
