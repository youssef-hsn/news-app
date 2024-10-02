//
//  NewsService.swift
//  News App
//
//  Created by Youssef Al-Hassan on 02/10/2024.
//

import Foundation

class NewsService {
    let apiKey = "ADmDbSBOxSDEB9buQTASpCTHT0bh2awC"

    func fetchArticles(
        viewedType: String = "viewed",
        timePeriod: String = "1",
        completion: @escaping (Result<[Article], Error>) -> Void) {
            
        let urlString = "https://api.nytimes.com/svc/mostpopular/v2/\(viewedType)/\(timePeriod).json?api-key=\(apiKey)"
        
        guard let url = URL(string: urlString) else {
            return
        }
        
        // Create the request
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        // Use URLSession to make the network request
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                completion(.failure(NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: "No data"])))
                return
            }
            
            do {
                let decodedResponse = try JSONDecoder().decode(Response.self, from: data)
                completion(.success(decodedResponse.results))  // Assuming results is the array of articles
            } catch let jsonError {
                completion(.failure(jsonError))
            }
        }.resume()
    }
}

// Add a Response struct to match the JSON structure
struct Response: Codable {
    let results: [Article]
}
