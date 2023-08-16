//
//  ReplicateManager.swift
//  Senpai
//
//  Created by Hamza Butt on 8/13/23.
//


import SwiftUI

class ReplicateManager: ObservableObject {
    
    
    private let apiToken = "r8_fJmgXmxouMafMr8rMUmZjQmbiteEsJi1PdR9B"
    @Published var videoData: Data? = nil
    
    
    func runModel() {
        print("function called")
        guard let url = URL(string: "https://api.replicate.ai/v1/run") else {
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("Bearer \(apiToken)", forHTTPHeaderField: "Authorization")
        
        let requestData: [String: Any] = [
            "version": "lucataco/animate-diff:1531004ee4c98894ab11f8a4ce6206099e732c1da15121987a8eef54828f0663",
            "input": [
                "motion_module": "mm_sd_v14"
            ]
        ]
        
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: requestData, options: [])
            request.httpBody = jsonData
        } catch {
            print("Error creating request body: \(error)")
            return
        }
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                print("Error fetching data: \(error?.localizedDescription ?? "Unknown error")")
                return
            }
            
            // Assuming the response data contains the video content
            DispatchQueue.main.async {
                self.videoData = data
                print("videoData ",self.videoData)
            }
        }.resume()
    }
}


class ReplicateViewModel: ObservableObject {
    private let baseURL = URL(string: "https://api.replicate.ai")!
    private let apiToken = "r8_fJmgXmxouMafMr8rMUmZjQmbiteEsJi1PdR9B"

    private var cancellables = Set<AnyCancellable>()

    func runModel() {
        guard let url = URL(string: "/run", relativeTo: baseURL) else { return }

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("Bearer \(apiToken)", forHTTPHeaderField: "Authorization")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        let inputData: [String: Any] = [
            "input": [
                "motion_module": "mm_sd_v14"
            ]
        ]

        let jsonData = try? JSONSerialization.data(withJSONObject: inputData)
        request.httpBody = jsonData

        URLSession.shared.dataTaskPublisher(for: request)
            .map(\.data)
            .decode(type: ReplicateResponse.self, decoder: JSONDecoder())
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print("Error: \(error)")
                }
            }, receiveValue: { response in
                print("Output: \(response.output)")
            })
            .store(in: &cancellables)
    }
}
