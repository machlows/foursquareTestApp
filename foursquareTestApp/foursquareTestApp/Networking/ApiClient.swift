//
//  ApiClient.swift
//  foursquareTestApp
//
//  Created by MKM on 16.05.2018.
//  Copyright © 2018 Tomasz Machlowski. All rights reserved.
//

import Foundation

enum NetworkingError: Error {
    case unexpectedError
}

class ApiClient {
    private var urlSession: URLSession
    private var baseUrl: URL = URL(string: "https://api.foursquare.com/v2")!
    private var clientSecret = "IXXOWU4S2MOSG4YAAC0YH4KEAR0EPOFHIWIYGEJWNSKU2JMA"
    private var clientId = "C3BKIAA4CADWNUY10K32HA5HJLMISMB2MBUDXNIJZBUUBTPW"
    
    init(with session: URLSession = URLSession.shared) {
        urlSession = session
    }
    
    func send<T: Decodable>(apiRequest: Request, completition: @escaping ((_ result: T?, _ error: Error?) -> Void) )  {
        let request = apiRequest.request(with: baseUrl, clientSecret: clientSecret, clientId: clientId)
        let task = self.urlSession.dataTask(with: request) { (data, response, error) in
            do {
                if let error = error {
                   completition(nil, error)
                } else {
                    guard let response = response as? HTTPURLResponse else {
                        fatalError("Couldn't get HTTP response")
                    }
                    if 200 ..< 300 ~= response.statusCode {
                        let model: T = try JSONDecoder().decode(T.self, from: data ?? Data())
                        completition(model, nil)
                    }
                    else {
                       completition(nil,NetworkingError.unexpectedError)
                    }
                }
                
            } catch let error {
                completition(nil, error)
            }

        }
        task.resume()
    }
}
