//
//  APIService.swift
//  Unspash
//
//  Created by Кирилл on 19.11.2022.
//

import UIKit

enum Errors: Error {
    case invalidURL
    case noData
    case decodingError
}

class APIService {
    
    static let shared = APIService()
    
    let apiAccessKey = "8S9Fu2tFnIdja3vHoH2XzXMQu3JbAxTrBqw0k2luTjM"
    
    func getUnsplashData(completion: @escaping ([DataModel]) -> Void) async {
        let fetchResponse: [DataModel]? = await fetchIt()
        if let theResponse = fetchResponse {
            completion(theResponse)
        }
        
    }
    
    func fetchIt<T: Decodable>() async -> T? {
        
        let parameters = self.getParameters(searchTerm: "")
        let url = self.getURL(parameters: parameters)
        var request = URLRequest(url: url)
        
        request.allHTTPHeaderFields = ["Authorization": "Client-ID \(apiAccessKey)"]
        request.httpMethod = "get"
        
        do {
            
            let (data, response) = try await URLSession.shared.data(for: request)
            
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                throw URLError(.badServerResponse)
            }
            let results = try JSONDecoder().decode(T.self, from: data)
            
            return results
            
        } catch {
            return nil
        }
        
    }
    
    // MARK: - Parameters
    func getParameters(searchTerm: String?) -> [String: String] {
        var parameters = [String: String]()
        
        parameters["query"] = searchTerm ?? ""
        parameters["count"] = String(30)
        
        return parameters
    }
    
    // MARK: - URL
    func getURL(parameters: [String: String]) -> URL {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.unsplash.com"
        components.path = "/photos/random"
        components.queryItems = parameters.map {URLQueryItem(name: $0, value: $1)}
        return components.url!
    }
    
}
