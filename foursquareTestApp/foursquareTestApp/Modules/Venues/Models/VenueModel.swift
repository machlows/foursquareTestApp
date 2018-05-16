//
//  VenueModel.swift
//  foursquareTestApp
//
//  Created by MKM on 16.05.2018.
//  Copyright © 2018 Tomasz Machlowski. All rights reserved.
//

import Foundation

struct  VenueModel {
    var id: String
    var name: String
    var distance: Int
    var formattedAddress: String

    
    init(with venue: Venue) {
        id = venue.id
        name = venue.name
        distance = venue.location.distance ?? Int.max
        formattedAddress = (venue.location.formattedAddress ?? [""]).reduce("", {$0 + $1})
    }
}

extension  VenueModel: Equatable {
    static func == (lhs: VenueModel, rhs: VenueModel) -> Bool {
        return lhs.id == rhs.id
    }
}

extension VenueModel: Comparable {
    static func < (lhs: VenueModel, rhs: VenueModel) -> Bool {
        return lhs.distance < rhs.distance
    }
}
