//
//  SearchVenuesRequest.swift
//  foursquareTestApp
//
//  Created by MKM on 16.05.2018.
//  Copyright © 2018 Tomasz Machlowski. All rights reserved.
//

import Foundation
typealias LatLong = (latitude: Double, longitiude: Double)

class SearchVenuesRequest: Request {
    let parameters: [String : String]
    let path: String = "/venues/explore"
    let method = RequestType.GET
    
    init(with name: String, location:LatLong) {
        parameters = ["ll":"\(location.latitude),\(location.longitiude)","query": name]
    }
}
