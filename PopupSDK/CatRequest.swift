//
//  CatRequest.swift
//  PopupSDK
//
//  Created by Ayush Bhatt on 24/07/23.
//

import Foundation

enum CatRequest: RequestProtocol{
    case getRandomCat
    //other cases
    
    var baseURL: String{
        "https://cataas.com"
    }
    
    var path: String{
        switch self {
        case .getRandomCat:
            return "/cat"
        }
    }
    
    var httpMethod: HTTPMethod{
        switch self {
        case .getRandomCat:
            return .get
        }
    }
    
    var httpBody: Data?{
        switch self {
        case .getRandomCat:
            return nil
        }
    }
    
    var headers: HTTPHeaders?{
        switch self {
        case .getRandomCat:
            return nil
        }
    }
}
