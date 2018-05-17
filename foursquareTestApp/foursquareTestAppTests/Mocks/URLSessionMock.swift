//
//  URLSessionMock.swift
//  foursquareTestAppTests
//
//  Created by MKM on 17.05.2018.
//  Copyright © 2018 Tomasz Machlowski. All rights reserved.
//

import Foundation

class URLSessionMock: URLSession {
    var dataToReturn: Data?
    var errorToReturn: Error?
    var responseToReturn: URLResponse?
    
    override func dataTask(with request: URLRequest, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        return URLSessionDataTaskMock {
            completionHandler(self.dataToReturn, self.responseToReturn, self.errorToReturn)
        }
    }
}

class URLSessionDataTaskMock: URLSessionDataTask {
    private let closure: () -> Void
    
    init(closure: @escaping () -> Void) {
        self.closure = closure
    }
    
    override func resume() {
        closure()
    }
}
