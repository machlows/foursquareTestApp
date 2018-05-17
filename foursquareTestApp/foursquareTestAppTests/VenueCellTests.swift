//
//  VenueCellTests.swift
//  foursquareTestAppTests
//
//  Created by MKM on 17.05.2018.
//  Copyright © 2018 Tomasz Machlowski. All rights reserved.
//

import XCTest
@testable import foursquareTestApp

class VenueCellTests: XCTestCase {
    
    func testInit() {
        let cell = VenueCell(frame: CGRect.zero)
        cell.adressLabel = UILabel()
        cell.nameLabel = UILabel()
        let venuModel = VenueModel(with: Venue(id: "id", name: "name", location: Location(distance: 0, formattedAddress: ["adress1", "adress2"])))
        cell.setup(with: venuModel)
        XCTAssertEqual(cell.adressLabel.text, "adress1adress2")
        XCTAssertEqual(cell.nameLabel.text, "name")
    }
}
