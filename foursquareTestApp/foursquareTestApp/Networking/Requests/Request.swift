//
//  Request.swift
//  foursquareTestApp
//
//  Created by MKM on 16.05.2018.
//  Copyright © 2018 Tomasz Machlowski. All rights reserved.
//

import Foundation

public enum RequestType: String {
    case GET, POST
}

protocol Request {
    var method: RequestType { get }
    var path: String { get }
    var parameters: [String : String] { get }
}

extension Request {
    func request(with baseURL: URL, clientSecret: String, clientId: String) -> URLRequest {
        guard var components = URLComponents(url: baseURL.appendingPathComponent(path), resolvingAgainstBaseURL: false) else {
            fatalError("Unable to create URL components")
        }
        
        var parametersCopy = parameters
        parametersCopy["client_secret"] = clientSecret
        parametersCopy["client_id"] = clientId
        parametersCopy["v"] = "20180516"
        components.queryItems = parametersCopy.map {
            URLQueryItem(name: String($0), value: String($1))
        }
        
        guard let url = components.url else {
            fatalError("Could not get url")
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        return request
    }
}
