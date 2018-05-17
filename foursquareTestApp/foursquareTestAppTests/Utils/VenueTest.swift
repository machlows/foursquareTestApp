//
//  VenueTest.swift
//  foursquareTestAppTests
//
//  Created by MKM on 17.05.2018.
//  Copyright © 2018 Tomasz Machlowski. All rights reserved.
//

import XCTest
@testable import foursquareTestApp

class VenueTest: XCTestCase {
    
    func testDecodable() {
        let path = Bundle(for: type(of: self)).path(forResource: "testData", ofType: "json")!
        let data = try! Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
        let venueResponse = try? JSONDecoder().decode(VenueResponse.self, from: data)
        XCTAssertNotNil(venueResponse)
        XCTAssertEqual(venueResponse?.response.groups[0].items[0].venue.name, "Russ & Daughters")
    }
    
}
