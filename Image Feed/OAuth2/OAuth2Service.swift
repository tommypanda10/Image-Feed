//
//  OAuth2Service.swift
//  Image Feed
//
//  Created by tommy tm on 11.03.2023.
//

import UIKit

class OAuth2Service {
    
    private enum NetworkError: Error {
        case codeError
        case unableToDecodeStringFromData
    }
    
    static func fetchAuthToken(code: String, handler: @escaping (Result<String, Error>) -> Void) {
        let url = URL(string: "https://unsplash.com/oauth/token")!
        var request = URLRequest(url: url)
        let params: [String: Any] = [
            "client_id": accessKey,
            "client_secret": secretKey,
            "redirect_uri": redirectURI,
            "code": code,
            "grant_type": "authorization_code"
        ]
        request.httpMethod = "POST"
        
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: params, options: .prettyPrinted)
        } catch let error {
            print(error.localizedDescription)
            return
        }
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                DispatchQueue.main.async {
                    handler(.failure(error))
                }
                return
            }
            
            if let response = response as? HTTPURLResponse,
               response.statusCode < 200 || response.statusCode >= 299 {
                DispatchQueue.main.async {
                    handler(.failure(NetworkError.codeError))
                }
                return
            }
            
            guard let data = data,
                  let oAuthToken = String(data: data, encoding: .utf8) else {
                DispatchQueue.main.async {
                    handler(.failure(NetworkError.unableToDecodeStringFromData))
                }
                return
            }
            DispatchQueue.main.async {
                handler(.success(oAuthToken))
            }
        }
        task.resume()
    }
}
