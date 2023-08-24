//
//  ReplicateManager.swift
//  Senpai
//
//  Created by Hamza Butt on 8/13/23.
//s

import SwiftUI


class ReplicateAPI {
    static let shared = ReplicateAPI()
    
    
    func makePrediction(){
        
//        let getUrl = "https://api.replicate.com/v1/predictions/kb4nrzzb2bn5laayqrjxyoft2a"
//        let version = "1531004ee4c98894ab11f8a4ce6206099e732c1da15121987a8eef54828f0663"
//        self.getPredictiedItemStatus(getUrl: getUrl, version: version)
        
        
        
        
        getPredictionUrls { replicatePredictionIdResponse in
            print("replicatePredictionIdResponse ",replicatePredictionIdResponse)

        } failure: { errorString in
            print("error string")
        }

        
    }
    
    
    private func getPredictionUrls(success: @escaping ((ReplicatePredictionIdResponse) -> Void), failure: @escaping ((String) -> Void)) {
        print("function called")
        
        let baseURL = URL(string: "https://api.replicate.com/v1/predictions")!

        
        let input = ["text": "German boy wlaking on road"]
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


            if let string = String(data: data, encoding: .utf8) {
                print("string ",string)

            }
            
            
//            let decoder = JSONDecoder()
//            do{
//                let response = try decoder.decode(ReplicatePredictionIdResponse.self, from: data)
//                success(response)
//
//            }catch{
//                failure(error.localizedDescription)
//            }


        }.resume()


    }



    private func getPredictiedItemStatus(getUrl:String, version:String) {
        let baseURL = URL(string: getUrl)!
        let requestData: [String: Any] = [
            "version": version,
            "input": [
                "prompt": "a geramn boy walking on road"
            ]
        ]

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

        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print(error.localizedDescription)
                return
            }

            guard let data = data else {
                print("Response data is nil")
                return
            }


            if let string = String(data: data, encoding: .utf8) {
                print("string ",string)

            }



        }.resume()
    }
    
    
}

