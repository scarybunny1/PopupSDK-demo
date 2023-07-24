//
//  APIService.swift
//  PopupSDK
//
//  Created by Ayush Bhatt on 24/07/23.
//

import Foundation

class APIService {
    
    // MARK: - Shared Instance
    static let shared = APIService()
    private var task: URLSessionDataTask?
    
    // MARK: - Data Task Helper
    func dataTask(_ request: RequestProtocol, completion: @escaping (Result<Data, Error>) -> Void) {
        guard let url = URL(string: request.baseURL) else {return}
        var urlRequest = URLRequest(url: url.appendingPathComponent(request.path))
        urlRequest.httpMethod = request.httpMethod.rawValue
        urlRequest.httpBody = request.httpBody
        
        task = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            guard let data = data, error == nil else{
                completion(.failure(APIError.failedToFetch))
                return
            }
            completion(.success(data))
        }
        
        self.task?.resume()
    }
    
    func cancel() {
        self.task?.cancel()
    }
}
