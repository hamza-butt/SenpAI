//
//  ImageCreateView.swift
//  Senpai
//
//  Created by Hamza Butt on 8/9/23.
//

import SwiftUI
import AlertToast


struct GenerateView: View {

    
    @StateObject private var viewModel = GenerateViewViewModel()
//    @State var isImageGenerated = false
    
    var body: some View {
        
        NavigationView {
            
            ActivityIndicatorLoading(isShowing: $viewModel.showLoading) {
                
                VStack(spacing:32){
                    
                    HeaderView(title: "Generate")
                        .padding(.horizontal,24)
                    
                    ScrollView(showsIndicators: false) {
                        
                        InputView(inputText: $viewModel.prompt)
                            .padding(.horizontal,24)
                        Spacer(minLength: 30)

                        
                        BaseButton(title: "Generate") {
                            viewModel.checkInput()
                        }
                        .padding(.horizontal,24)
                        StyleSelectionView()
                        
                    }
                    
                    
                    
                    NavigationLink(destination: ImageCompletedView(promptResponseImage: viewModel.promptResponseImage ?? Image("base64.online")),
                                   isActive: $viewModel.isImageGenerated,
                                   label: {
                        EmptyView()
                    })
                    
//                    if let image = viewModel.promptResponseImage {
//
//                        NavigationLink(<#T##titleKey: LocalizedStringKey##LocalizedStringKey#>) {
//                            <#code#>
//                        }
//                         NavigationLink(destination: ImageCompletedView(promptResponseImage: image)) {
//                             EmptyView()
//                         }
//                         .hidden()
//                     }
                    
                    
                }
            }
            
            .toast(isPresenting: $viewModel.showErrorToast){

                AlertToast(displayMode: .hud, type: .image("crossed", .red), title: "Error", subTitle: viewModel.errorText)
            }
        }
        
        
        
        
        

        
        
    }
    
    
}

struct GenerateView_Previews: PreviewProvider {
    static var previews: some View {
        GenerateView()
    }
}



