//
//  ContentView.swift
//  Senpai
//
//  Created by Hamza Butt on 8/12/23.
//

import AlertToast
import SwiftUI


struct ContentView: View {
    @ObservedObject var replicateManager = ReplicateManager()
    
    var body: some View {
        
        Button {
            replicateManager.runModel()
        } label: {
            Text("Create Video")
        }

        
//        VStack {
//            if let videoData = replicateManager.videoData,
//               let videoURL = URL(string: "data:video/mp4;base64,\(videoData.base64EncodedString())") {
//                VideoPlayer(player: AVPlayer(url: videoURL))
//                    .onAppear {
//                        replicateManager.runModel()
//                    }
//            } else {
//                Text("Loading video...")
//            }
//        }
        
        
        
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
