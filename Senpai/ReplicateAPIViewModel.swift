//
//  ReplicateAPIViewModel.swift
//  Senpai
//
//  Created by Hamza Butt on 9/4/23.
//

import SwiftUI
import Combine

class ReplicateAPIViewModel: ObservableObject {
    @Published var output: String? = nil
    
    private let version = "1531004ee4c98894ab11f8a4ce6206099e732c1da15121987a8eef54828f0663"
    private var cancellable: AnyCancellable?
    
    
    func makePrediction() {
        getPredictionUrls()
    }
    
    private func getPredictionUrls() {
        print("getPredictionUrls")
        
        let baseURL = URL(string: "https://api.replicate.com/v1/predictions")!
        
        let input = [
            "prompt": "a german boy, 22 years old, walking on road, black pant coat, red hat",
            "n_prompt": "badhandv4, easynegative, ng_deepnegative_v1_75t, verybadimagenegative_v1.3, bad-artist, bad_prompt_version2-neg, teeth"]
        
        let requestData: [String: Any] = ["version": version, "input": input]
        
        var request = URLRequest(url: baseURL)
        request.httpMethod = "POST"
        request.addValue("Token \(API_TOKEN)", forHTTPHeaderField: "Authorization")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: requestData)
        } catch {
            print("Request data serialization error:", error)
            return
        }
        
        cancellable = URLSession.shared.dataTaskPublisher(for: request)
            .map(\.data)
            .decode(type: ReplicatePredictionIdResponse.self, decoder: JSONDecoder())
            .sink(
                receiveCompletion: { completion in
                    switch completion {
                    case .finished:
                        break
                    case .failure(let error):
                        print("Request failed with error: \(error.localizedDescription)")
                    }
                },
                receiveValue: { [weak self] response in
                    self?.getPredictiedItemStatus(getUrl: response.urls?.get ?? "")
                }
            )
    }
    
    
    
    
    private func getPredictiedItemStatus(getUrl: String) {
        print("getPredictiedItemStatus")
        
        
        let baseURL = URL(string: getUrl)!
        let requestData: [String: Any] = ["version": version]
        
        var request = URLRequest(url: baseURL)
        request.httpMethod = "POST"
        request.addValue("Token \(API_TOKEN)", forHTTPHeaderField: "Authorization")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: requestData)
        } catch {
            print("Request data serialization error:", error)
            return
        }
        
        cancellable = URLSession.shared.dataTaskPublisher(for: request)
            .map(\.data)
            .sink(
                receiveCompletion: { completion in
                    switch completion {
                    case .finished:
                        break
                    case .failure(let error):
                        print("Request failed with error: \(error.localizedDescription)")
                    }
                },
                receiveValue: { [weak self] data in
                    do {
                        guard let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] else {
                            print("Cannot convert response into JSON")
                            return
                        }
                        let status = json["status"] as? String
                        print("status ",status)
                        
                        if status == "succeeded" {
                            let output = json["output"] as? String
                            
                            DispatchQueue.main.async {
                                self?.output = output
                            }
                            
                        } else {
                            // Retry after 5 seconds
                            
                            DispatchQueue.global().asyncAfter(deadline: .now() + 10) { [weak self] in
                                self?.getPredictiedItemStatus(getUrl: getUrl)
                            }
                        }
                    } catch {
                        print("Error parsing JSON: \(error)")
                    }
                }
            )
    }
}
