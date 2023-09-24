//
//  ReplicateManager.swift
//  Senpai
//
//  Created by Hamza Butt on 8/13/23.
//s

import SwiftUI


class ReplicateAPI {
    
    private let version = "1531004ee4c98894ab11f8a4ce6206099e732c1da15121987a8eef54828f0663"
    
    func makePrediction(){
        
        getPredictionUrls { replicatePredictionIdResponse in
            let getUrl = replicatePredictionIdResponse.urls?.get ?? ""
            self.getPredictiedItemStatus(getUrl: getUrl)

        } failure: { errorString in
            print("error string")
        }
        
    }
    
    
    
    
    
    
    
    private func getPredictionUrls(success: @escaping ((ReplicatePredictionIdResponse) -> Void), failure: @escaping ((String) -> Void)) {
        print("getPredictionUrls")
        
        let baseURL = URL(string: "https://api.replicate.com/v1/predictions")!

        let input = [
            "prompt":"a german boy, 22 years old, walking on road, black pant coat, red hat",
            "n_prompt": "badhandv4, easynegative, ng_deepnegative_v1_75t, verybadimagenegative_v1.3, bad-artist, bad_prompt_version2-neg, teeth"]
        
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

    private func getPredictiedItemStatus(getUrl:String) {
        
        print("getUrl ",getUrl)
        
        
        let baseURL = URL(string: getUrl)!
        let requestData: [String: Any] = [ "version": version ]

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

            
            do {
                
                guard let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] else { print("cannot conovert into json"); return }
                let status = json["status"] as? String
                
                if status == "succeeded"{ // completed
                    
                    let output = json["output"] as? String
                    print("output ",output ?? "")
                    
                    
                }else{ // running
                    
                }
                
            } catch{
                
                print("Error parsing JSON: \(error)")
            }

            



        }.resume()
    }
    
    
}

