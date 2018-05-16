//
//  VenuesViewModel.swift
//  foursquareTestApp
//
//  Created by MKM on 16.05.2018.
//  Copyright © 2018 Tomasz Machlowski. All rights reserved.
//

import Foundation

struct VenuesViewModel {
    private var venuesArray: [VenueModel]
    
    init() {
        venuesArray = []
    }
    
    init(with venues: [Venue]?) {
        guard let venues = venues else {
            venuesArray = []
            return
        }
        venuesArray = venues.map{VenueModel(with: $0)}
    }
    
    func numberOfSections() -> Int {
        return 1
    }
    
    func numberOfCells(for section: Int) -> Int{
        guard section < 1  else { return 0 }
        return venuesArray.count
    }
    
    func model(for index:IndexPath) -> VenueModel? {
        guard index.section < 1 , index.row < venuesArray.count else {return nil}
        return venuesArray[index.row]
    }
}
