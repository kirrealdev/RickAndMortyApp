//
//  NetworkManager.swift
//  RickAndMortyApp
//
//  Created by KirRealDev on 27.03.2022.
//

// Можно улучшить используя Generics

import Foundation

private enum ServerError: Error {
    case noDataProvided
    case failedToDecode
}

final class NetworkManager: NetworkManagering {
    func makeGetRequest(urlString: String) -> URLRequest? {
        guard let url = URL(string: urlString) else {
            return nil
        }
        let request = URLRequest(url: url)
        
        return request
    }
    
    func performGetCharacterRequest(url: String, onComplete: @escaping (Page) -> Void, onError: @escaping (Error) -> Void) {
        guard let request = makeGetRequest(urlString: url) else {
            return
        }
        
        let session = URLSession.shared
        
        let task = session.dataTask(with: request) { (data, response, error) in
            if let error = error {
                onError(error)
                return
            }
            if let httpResponse = response as? HTTPURLResponse {
                debugPrint("HTTPURLResponse: \(httpResponse.statusCode)")
            }
            guard let  data = data else {
                onError(ServerError.noDataProvided)
                return
            }
            guard let info = try? JSONDecoder().decode(Page.self, from: data) else {
                debugPrint("Could not decode")
                onError(ServerError.failedToDecode)
                return
            }
            DispatchQueue.main.async {
                onComplete(info)
            }
        }
        
        task.resume()
    }
}
