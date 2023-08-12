//
//  StyleSelectionView.swift
//  Senpai
//
//  Created by Hamza Butt on 8/9/23.
//

import SwiftUI
struct GenerateModel{
    let imageName:String
    let color:UInt32
    
}


struct StyleSelectionView: View {
    
    @State var selectedIndex:Int = 0
    
    let generateModel:[GenerateModel] = [
        GenerateModel.init(imageName: "mode1", color: 0x00E1EF),
        GenerateModel.init(imageName: "mode2", color: 0xEA6276),
        GenerateModel.init(imageName: "mode3", color: 0x8341D3),
        GenerateModel.init(imageName: "mode4", color: 0x85CBE1)
    ]
    
    var body: some View {
        VStack(spacing:0) {
            HStack {
                Text("Select Style")
                    .font(.system(size: 16))
                    .bold()
                Spacer()
            }
            .padding(.horizontal,24)
            
            ScrollView {
                LazyVGrid(columns: [GridItem(.flexible(), spacing: 30), GridItem(.flexible(), spacing: 30)],
                          spacing: 30,
                          content: {
                    
                    ForEach(0..<generateModel.count, id: \.self) { index in
                        getImageItem(index)
                    }
                    
                })
                .padding(.horizontal,24)
                .padding(.top,25)
                .padding(.bottom,25)
            }
        }
    }

    
    
    func getImageItem(_ index:Int) -> some View{
        
        
        Button {
            selectedIndex = index
        } label: {
            
            ZStack(alignment:.topTrailing) {
                
                Image(generateModel[index].imageName)
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(20)
                    .shadow(color:Color(hex: generateModel[index].color).opacity(0.6), radius: 15, x: 0, y: 0)
                
                
                if selectedIndex == index{
                    
                    Image("checkCircle")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 30, height: 30)
                        .padding(.top,10)
                        .padding(.trailing,10)
                        .shadow(color: Color.black.opacity(0.5), radius: 4, x: 0, y: 4)
                    
                }
                
            }
            
        }
        
        
    }
    
}

struct StyleSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        StyleSelectionView()
    }
}
