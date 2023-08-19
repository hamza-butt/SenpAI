//
//  ContentView.swift
//  Senpai
//
//  Created by Hamza Butt on 8/12/23.
//

import AlertToast
import SwiftUI


struct ContentView: View {
    
    var body: some View {
        VStack {
            Text("Replicate API Demo")
                .font(.largeTitle)
                .padding()
            
            Button("Make Prediction") {
                
                ReplicateAPI.shared.makePrediction()
            }
            .padding()
            
            
            
        }
        .padding()
    }
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
