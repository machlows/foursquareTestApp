//
//  VenuesPresenter.swift
//  foursquareTestApp
//
//  Created by MKM on 16.05.2018.
//  Copyright © 2018 Tomasz Machlowski. All rights reserved.
//

import Foundation

class VenuesPresenter {
    weak var view: VenuesViewInterface!
    var interactor: VenuesInteractorInterface!
}

extension VenuesPresenter: VenuesPresenterInterface {
    func viewDidLoad() {
        interactor.setup()
        interactor.fetchVenues(with: "")
    }
    
    func shearchVenues(with name: String?) {
        interactor.fetchVenues(with: name ?? "")
    }
}

extension VenuesPresenter: VenuesInteractorDelegate {
    func didFetchedVenues(venues: [Venue]?) {
        let viewModel = VenuesViewModel(with: venues)
        view.realoadViewModel(model: viewModel)
    }
    
    func didRecivedErrorWhileFetching(_ error: Error) {
        view.showError(with: error.localizedDescription)
    }
}
