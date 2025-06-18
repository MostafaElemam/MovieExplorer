//
//  NetworkManager.swift
//  MovieExplorer
//
//  Created by Mostafa Elemam on 16/06/2025.
//

import Foundation
import Alamofire

class NetworkService {
    
    func download<T: Codable>(from endPoint: String) async throws -> T  {
        
        guard let _ = URL(string: endPoint) else { throw NetworkError.invalidURL }
        let parameters: Parameters = [
            "api_key": "112485dfbcd44877932532534b66faf1"
        ]
        let request = AF.request(endPoint, method: .get, parameters: parameters, headers: .default)
        let response = await request.serializingDecodable(T.self).response
        //        debugPrint(response)
        switch response.result {
            case .success(let data):
                return data
                
            case .failure(let error):
                if let statusCode = response.response?.statusCode {
                    throw NetworkError.serverError(statusCode: statusCode)
                } else {
                    throw NetworkError.networkFailure(error: error)
                }
        }
    }
}

