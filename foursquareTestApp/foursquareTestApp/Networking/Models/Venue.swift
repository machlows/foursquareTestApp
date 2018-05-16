//
//  Venue.swift
//  foursquareTestApp
//
//  Created by MKM on 16.05.2018.
//  Copyright © 2018 Tomasz Machlowski. All rights reserved.
//

import Foundation

struct Venue: Decodable {
    var id: String
    var name: String
    var location: Location
}

struct Location: Decodable {
    var distance: Int?
    var formattedAddress: [String]?
}

struct VenueResponse: Decodable {
    var response: Response
}

struct Response: Decodable {
    var groups: [VenueGroops]
}

struct VenueGroops: Decodable {
    var items: [Item]
}

struct Item: Decodable {
    var venue: Venue
}
