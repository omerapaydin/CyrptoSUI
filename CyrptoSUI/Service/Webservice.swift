//
//  Webservice.swift
//  CyrptoSUI
//
//  Created by Ömer on 25.12.2024.
//

import Foundation


class Webservice {
    
    func downloadData(url: URL, completion: @escaping (Result<[CyrptoCurrency]?, DownloadError>) -> Void) {
        
        URLSession.shared.dataTask(with: url) { data, response, error in
                if let error = error {
                    completion(.failure(.badURL))
            }
            
            guard let data , error == nil else {
                return completion(.failure(.noData))
            }
            
            guard let currencies = try? JSONDecoder().decode([CyrptoCurrency].self, from: data) else {
                return completion(.failure(.dataParseError))
            }
            
            completion(.success(currencies))
            
        }.resume()
        
    }
    
    
    
}


enum DownloadError: Error {
    case badURL
    case noData
    case dataParseError
}
