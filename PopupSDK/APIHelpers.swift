//
//  APIHelpers.swift
//  PopupSDK
//
//  Created by Ayush Bhatt on 24/07/23.
//

import Foundation

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case patch = "PATCH"
    case delete  = "DELETE"
}

public typealias HTTPHeaders = [String: String]

protocol RequestProtocol{
    var baseURL: String { get }
    var path: String { get }
    var httpMethod: HTTPMethod { get }
    var httpBody: Data? { get }
    var headers: HTTPHeaders? { get }
}

enum APIError: Error{
    case failedToFetch
}
