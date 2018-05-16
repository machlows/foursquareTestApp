//
//  VenuesModuleInterface.swift
//  foursquareTestApp
//
//  Created by MKM on 16.05.2018.
//  Copyright © 2018 Tomasz Machlowski. All rights reserved.
//

import Foundation

protocol VenuesViewInterface: class {
    func realoadViewModel(model: VenuesViewModel)
    func showError(with message: String)
}

protocol VenuesPresenterInterface: class {
    func viewDidLoad()
    func shearchVenues(with name: String?)
}

protocol VenuesInteractorInterface: class {
    func setup()
    func fetchVenues(with name: String)
}

protocol VenuesInteractorDelegate: class {
    func didFetchedVenues(venues: [Venue]?)
    func didRecivedErrorWhileFetching(_ error: Error)
}
