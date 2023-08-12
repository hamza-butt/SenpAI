//
//  ImageCreateViewModel.swift
//  Senpai
//
//  Created by Hamza Butt on 8/9/23.
//

import SwiftUI
import Combine

class GenerateViewViewModel: ObservableObject {
 
    @Published var base64Response = ""
    
    func callImageCreate() {
        print("function called")
        
        let url = URL(string: "https://110602490-sharedlora.gateway.alpha.fal.ai")!
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let headers = [
            "Authorization": "Basic \(KEY_ID):\(KEY_SECRET)"
        ]
        request.allHTTPHeaderFields = headers
        
        let body: [String: Any] = [
            "prompt": "photo of a european medieval 40 year old queen, silver hair, highly detailed face, detailed eyes, head shot, intricate crown, age spots, wrinkles",
            "model_name": "https://civitai.com/api/download/models/105035",
            "lora_weights": ["https://civitai.com/api/download/models/107366"],
            
            // Optional parameters
            "negative_prompt": "cartoon, painting, illustration, (worst quality, low quality, normal quality:2), (watermark), immature, child, (big nose:1.4)",
            "seed": 3088576288,
            "width": 544,
            "height": 960,
            "num_inference_steps": 40,
            "guidance_scale": 4,
            "lora_scale": 1
        ]
        
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: body, options: [])
            request.httpBody = jsonData
        } catch {
            print("Error serializing JSON: \(error)")
            return
        }
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Error: \(error)")
                return
            }
            
            if let data = data {
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
                    guard let json = json else { return }
                    guard let base64Values = json["result"] as? String else { return }
                    print("base64Values ",base64Values)
                    self.base64Response = base64Values
                } catch {
                    print("Error parsing JSON: \(error)")
                }
            }
        }.resume()
    }
    
    
    func convertBase64ToImage() -> Image? {
        guard let data = Data(base64Encoded: base64Response),
              let uiImage = UIImage(data: data) else {
            return nil
        }
        
        // Convert UIImage to Image (SwiftUI)
        let image = Image(uiImage: uiImage)
        return image
    }

}

