//
//  ContentView.swift
//  Senpai
//
//  Created by Hamza Butt on 8/12/23.
//

import AlertToast
import SwiftUI


struct ContentView: View {
    @State private var predictionResponse: PredictionResponse?
    
    var body: some View {
        VStack {
            Text("Replicate API Demo")
                .font(.largeTitle)
                .padding()
            
            Button("Make Prediction") {
                ReplicateAPI.shared.makePrediction { result in
                    switch result {
                    case .success(let response):
                        DispatchQueue.main.async {
                            self.predictionResponse = response
                        }
                    case .failure:
                        // Handle error
                        break
                    }
                }
            }
            .padding()
            
            if let predictionResponse = predictionResponse {
                Text("Prediction Status: \(predictionResponse.status)")
                if let output = predictionResponse.output {
                    Text("Prediction Output: \(output)")
                }
            }
        }
        .padding()
    }
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
