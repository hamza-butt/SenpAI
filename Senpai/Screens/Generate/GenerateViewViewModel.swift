//
//  ImageCreateViewModel.swift
//  Senpai
//
//  Created by Hamza Butt on 8/9/23.
//

import SwiftUI
import Combine

class GenerateViewViewModel: ObservableObject {
 
    @Published var prompt: String = ""
    
    @Published var showErrorToast = false
    @Published var errorText = ""
    @Published var showLoading:Bool = false
    
    @Published var promptResponseImage:Image? = nil
    @Published var isImageGenerated:Bool = false

    var isGoNext: Bool{
        return promptResponseImage != nil
    }
    
    func checkInput(){
        
        if prompt.isEmpty{
            showErrorToast = true
            errorText = "Please Enter Prompt"
            return
        }
        
        callImageCreate()
        
        
    }
    
    func callImageCreate() {
        print("function called")
        showLoading = true
        
        let url = URL(string: "https://110602490-sharedlora.gateway.alpha.fal.ai")!
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let headers = [
            "Authorization": "Basic \(KEY_ID):\(KEY_SECRET)"
        ]
        request.allHTTPHeaderFields = headers
        
        let body: [String: Any] = [
            "prompt": prompt,
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
            showErrorToast = true
            errorText = error.localizedDescription
            return
        }
        
        
        URLSession.shared.dataTask(with: request) {[weak self] data, response, error in
            guard let self = self else { return }
            
            DispatchQueue.main.async {
                self.showLoading = false
                
                if let error = error {
                    self.showErrorToast = true
                    self.errorText = error.localizedDescription
                    return
                }
                
                if let data = data {
                    do {
                        let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
                        guard let json = json else { return }
                        guard let base64Values = json["result"] as? String else { return }
                        print("base64Values ",base64Values)

                        self.promptResponseImage = self.convertBase64ToImage(base64Values)
                        self.isImageGenerated = true
                        
                    } catch {
                        self.showErrorToast = true
                        self.errorText = error.localizedDescription
                    }
                }
            }
        }.resume()

        
    }
    
    
    func convertBase64ToImage(_ base64Response:String) -> Image? {
        guard let data = Data(base64Encoded: base64Response),
              let uiImage = UIImage(data: data) else {
            return nil
        }
        
        // Convert UIImage to Image (SwiftUI)
        let image = Image(uiImage: uiImage)
        return image
    }

}

