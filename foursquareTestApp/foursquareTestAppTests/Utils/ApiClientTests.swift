//
//  ApiClientTests.swift
//  foursquareTestAppTests
//
//  Created by MKM on 17.05.2018.
//  Copyright © 2018 Tomasz Machlowski. All rights reserved.
//

import XCTest
@testable import foursquareTestApp

enum TestError: Error {
    case error
}

class ApiClientTests: XCTestCase {
    
    func testErrorWhileSendingRequest() {
        let urlSessionMock = URLSessionMock()
        urlSessionMock.errorToReturn = TestError.error
        let apiClient = ApiClient(with: urlSessionMock)
        apiClient.send(apiRequest: SearchVenuesRequest(with: "", location: (0.0,0.0))) { (response: Venue?, error: Error?) in
            XCTAssertNil(response)
            XCTAssertEqual(error as? TestError, .error)
        }
    }
    
    func testSuccesfulSendRequest() {
        let urlSessionMock = URLSessionMock()
        
        urlSessionMock.responseToReturn = HTTPURLResponse(url: URL(string: "fdf")!, statusCode: 201, httpVersion: "", headerFields: nil)
        
        let path = Bundle(for: type(of: self)).path(forResource: "testDataOneVenue", ofType: "json")!
        let data = try? Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
        urlSessionMock.dataToReturn = data
        
        let apiClient = ApiClient(with: urlSessionMock)
        apiClient.send(apiRequest: SearchVenuesRequest(with: "", location: (0.0,0.0))) { (response: Venue?, error: Error?) in
            XCTAssertNotNil(response)
            XCTAssertEqual(response?.name, "Russ & Daughters")
        }
    }
    
    func testResponseError() {
        let urlSessionMock = URLSessionMock()
         urlSessionMock.responseToReturn = HTTPURLResponse(url: URL(string: "fdf")!, statusCode: 404, httpVersion: "", headerFields: nil)
        let apiClient = ApiClient(with: urlSessionMock)
        apiClient.send(apiRequest: SearchVenuesRequest(with: "", location: (0.0,0.0))) { (response: Venue?, error: Error?) in
            XCTAssertNil(response)
            XCTAssertEqual(error as? NetworkingError, .unexpectedError)
           
        }
    }
    
    func testMappinError() {
        let urlSessionMock = URLSessionMock()
        urlSessionMock.responseToReturn = HTTPURLResponse(url: URL(string: "fdf")!, statusCode: 200, httpVersion: "", headerFields: nil)
        let apiClient = ApiClient(with: urlSessionMock)
        apiClient.send(apiRequest: SearchVenuesRequest(with: "", location: (0.0,0.0))) { (response: Venue?, error: Error?) in
            XCTAssertNil(response)
            XCTAssertNotNil(error)
        }
    }
    
}
