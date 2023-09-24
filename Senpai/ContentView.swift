//
//  ContentView.swift
//  Senpai
//
//  Created by Hamza Butt on 8/12/23.
//

import AlertToast
import SwiftUI
import AVFoundation
import AVKit



struct ContentView: View {
    
    
    @State private var player: AVPlayer?
    @ObservedObject var viewModel = ReplicateAPIViewModel()
    
    var body: some View {
        VStack {
            if let player = player {
                VideoPlayer(player: player)
                    .onDisappear {
                        // Pause the player when the view disappears
                        player.pause()
                    }
            } else {
                Text("Loading Video...")
            }
            
            Button("Make Prediction") { viewModel.makePrediction() }
        }
        .onReceive(viewModel.$output) { output in
            if let outputURLString = output, let url = URL(string: outputURLString) {
                let player = AVPlayer(url: url)
                self.player = player
                player.play()
            }
        }
    }
}






//    var body: some View {
//        VStack {
//            Text("Replicate API Demo")
//                .font(.largeTitle)
//                .padding()
//
//
//            .padding()
//
//
//
//        }
//        .padding()
//    }
//}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
