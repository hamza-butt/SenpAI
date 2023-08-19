//
//  ReplicateManager.swift
//  Senpai
//
//  Created by Hamza Butt on 8/13/23.
//

import SwiftUI



class ReplicateAPI {
    static let shared = ReplicateAPI()
    
    private let baseURL = URL(string: "https://api.replicate.com/v1/predictions")!
    
    
    
    
    func makePrediction(){
        
        getPredictionUrls { replicatePredictionIdResponse in
            
            print("replicatePredictionIdResponse ",replicatePredictionIdResponse)
            self.handlePredictionResponse(replicatePredictionIdResponse)
            
        } failure: { errorString in
            print("error string")
        }
        
        
    }
    
    
    private func getPredictionUrls(success: @escaping ((ReplicatePredictionIdResponse) -> Void), failure: @escaping ((String) -> Void)) {
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
            //completion(.failure(.invalidData))
            return
        }
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            
            if let error = error {
                failure(error.localizedDescription)
                return
            }
            
            
            guard let data = data else {
                failure("Response data is nil")
                return
            }
            
            
            let decoder = JSONDecoder()
            do{
                let response = try decoder.decode(ReplicatePredictionIdResponse.self, from: data)
                success(response)
                
            }catch{
                failure(error.localizedDescription)
            }
            
            
        }.resume()
        
        
    }
    
    
    
    
    private func handlePredictionResponse(_ predictionResponse: ReplicatePredictionIdResponse) {
        // Extract necessary information from the predictionResponse
        if let outputUrls = predictionResponse.urls,
           let getURLString = outputUrls.get {
            
            callSecondAPI(with: getURLString, authorizationToken: API_TOKEN)
        }
    }
    
    private func callSecondAPI(with url: String, authorizationToken: String) {
        guard let secondAPIURL = URL(string: url) else {
            print("Invalid URL:", url)
            return
        }
        
        var request = URLRequest(url: secondAPIURL)
        request.httpMethod = "GET"
        request.addValue("Token \(authorizationToken)", forHTTPHeaderField: "Authorization")
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            // Handle the response of the second API call
            if let error = error {
                print("Second API Error:", error)
                return
            }
            
            
            
            guard let data = data else { return }
            if let responseString = String(data: data, encoding: .utf8) {
                print("Second API Response Data:")
                print(responseString)
                
                // Parse and use the data from the second API response if needed
                // You can use JSONSerialization or JSONDecoder here
                // For example:
                // let decodedData = try? JSONDecoder().decode(YourSecondAPIResponseStruct.self, from: data)
                // ... Handle decodedData ...
            } else {
                print("Failed to convert response data to string.")
            }
            
        }.resume()
    }
    
    
}



