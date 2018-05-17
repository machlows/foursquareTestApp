//
//  RequestTests.swift
//  foursquareTestAppTests
//
//  Created by MKM on 17.05.2018.
//  Copyright © 2018 Tomasz Machlowski. All rights reserved.
//

import XCTest
@testable import foursquareTestApp

class RequestTests: XCTestCase {
    
    func testInitialization() {
        let request = SearchVenuesRequest(with: "name", location: (0.0,0.0))
        XCTAssertNotNil(request)
        XCTAssertEqual(request.method, .GET)
        XCTAssertEqual(request.path, "/venues/explore")
        XCTAssertEqual(request.parameters, ["ll":"0.0,0.0", "query":"name"])
    }
    
    func testRequest() {
        let request = SearchVenuesRequest(with: "name", location: (0.0,0.0))
        let urlRequest = request.request(with: URL(string: "url")!, clientSecret: "secret", clientId: "id")
        XCTAssertNotNil(urlRequest)
        XCTAssertEqual(urlRequest.httpMethod, "GET")
        XCTAssertEqual(urlRequest.allHTTPHeaderFields?["Accept"], "application/json")
        XCTAssertEqual(urlRequest.url, URL(string: "url/venues/explore?client_secret=secret&v=20180516&query=name&ll=0.0,0.0&client_id=id"))
    }
}
