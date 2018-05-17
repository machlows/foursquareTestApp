//
//  VenuesInteractor.swift
//  foursquareTestApp
//
//  Created by MKM on 16.05.2018.
//  Copyright © 2018 Tomasz Machlowski. All rights reserved.
//

import Foundation
import CoreLocation

class VenuesInteractor: NSObject {
    weak var delegate: VenuesInteractorDelegate!
    let locationManager: CLLocationManager
    let apiClient: ApiClient
    private var currentLocation: LatLong = (1,1)
    
    init(with delegate: VenuesInteractorDelegate,  apiClient: ApiClient = ApiClient(), locationManager: CLLocationManager = CLLocationManager()) {
        self.delegate = delegate
        self.apiClient = apiClient
        self.locationManager = locationManager
    }
    
   
    func startReceivingLocationChanges() {
        locationManager.requestWhenInUseAuthorization()
        let authorizationStatus = CLLocationManager.authorizationStatus()
        if authorizationStatus != .authorizedWhenInUse && authorizationStatus != .authorizedAlways {
            return
        }
       
        if !CLLocationManager.locationServicesEnabled() {
            return
        }
       
        locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
        locationManager.distanceFilter = 100.0
        locationManager.delegate = self
        locationManager.startUpdatingLocation()
    }
    
}

extension VenuesInteractor: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let coordinate = locations.last?.coordinate else { return }
        self.currentLocation = (coordinate.latitude, coordinate.longitude)
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        self.delegate.didRecivedError(error)
    }
}

extension VenuesInteractor: VenuesInteractorInterface {
    func setup() {
        startReceivingLocationChanges()
    }
    
    func fetchVenues(with name: String) {
        locationManager.requestLocation()
        let request = SearchVenuesRequest(with: name, location: currentLocation)
        apiClient.send(apiRequest: request) { (venuesResponse: VenueResponse?, error: Error?) in
            if let response = venuesResponse {
                let venues = response.response.groups.compactMap{$0.items.compactMap{$0.venue}}
                self.delegate.didFetchedVenues(venues: venues.reduce([], {$0+$1}))
            }
            if let error = error {
                self.delegate.didRecivedError(error)
            }
        }
    }
}
