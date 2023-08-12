//
//  ImageCreateView.swift
//  Senpai
//
//  Created by Hamza Butt on 8/9/23.
//

import SwiftUI

struct GenerateView: View {

    
    @StateObject private var viewModel = GenerateViewViewModel()
    @State var isLoading = false
    @State private var inputText: String = ""
    
    
    var body: some View {
        
        NavigationView {
            
            ActivityIndicatorLoading(isShowing: $isLoading) {
                
                VStack(spacing:32){
                    
                    HeaderView(title: "Generate")
                        .padding(.horizontal,24)
                    
                    ScrollView(showsIndicators: false) {
                        
                        InputView(inputText: $inputText)
                            .padding(.horizontal,24)
                        Spacer(minLength: 30)

                        BaseButton(title: "Generate")
                            .padding(.horizontal,24)
                        
                        StyleSelectionView()
                        
                    }
                }
            }
        }
        
        
        
        
        
//        VStack {
//            Button("Create Video") {
//                viewModel.callImageCreate()
//            }
//
//            if let image = viewModel.convertBase64ToImage() {
//                image
//                    .resizable()
//                    .aspectRatio(contentMode: .fit)
//                    .frame(height: 300)
//            }
//        }
        
        
    }
    
    
}

struct GenerateView_Previews: PreviewProvider {
    static var previews: some View {
        GenerateView()
    }
}
