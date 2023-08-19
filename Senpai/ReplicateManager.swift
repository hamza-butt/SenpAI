//
//  ReplicateManager.swift
//  Senpai
//
//  Created by Hamza Butt on 8/13/23.
//

import SwiftUI


enum APIError: Error {
    case requestFailed
    case responseUnsuccessful
    case invalidData
}

class ReplicateAPI {
    static let shared = ReplicateAPI()
    
    private let baseURL = URL(string: "https://api.replicate.com/v1/predictions")!
    
    func makePrediction(completion: @escaping (Result<PredictionResponse, APIError>) -> Void) {
        print("function called")
        
        let input = ["motion_module": "mm_sd_v14"]
        let requestData: [String: Any] = ["version": "1531004ee4c98894ab11f8a4ce6206099e732c1da15121987a8eef54828f0663",
                                          "input": input]
        
        var request = URLRequest(url: baseURL)
        request.httpMethod = "POST"
        request.addValue("Token \(API_TOKEN)", forHTTPHeaderField: "Authorization")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: requestData)
        } catch {
            print("Request data serialization error:", error)
            completion(.failure(.invalidData))
            return
        }
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            
            if let error = error {
                print("Request error:", error)
                completion(.failure(.requestFailed))
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse else {
                print("Invalid response")
                completion(.failure(.responseUnsuccessful))
                return
            }
            
            
            print("httpResponse.statusCode ",httpResponse.statusCode)
            
            if let data = data {
                if let outputString = String(data: data, encoding: .utf8) {
                    print("outputString ",outputString)
                    //self.output = outputString
                }
            }
        }.resume()
        
        
    }
}

struct PredictionResponse: Codable {
    let id: String
    let input: [String: String]
    let output: String?
    let status: String
}


