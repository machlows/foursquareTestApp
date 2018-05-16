//
//  VenuesWireframe.swift
//  foursquareTestApp
//
//  Created by MKM on 16.05.2018.
//  Copyright © 2018 Tomasz Machlowski. All rights reserved.
//

import UIKit

class VenuesWireframe {
    weak var viewController: UIViewController?
    
    static func assembleModule() -> UIViewController {
        let storyboard = UIStoryboard(name: "Venues", bundle: nil)
        let view = storyboard.instantiateViewController(withIdentifier: "VenuesViewController") as! VenuesViewController
        let presenter = VenuesPresenter()
        let interactor = VenuesInteractor(with: presenter)
    
        let navigation = UINavigationController(rootViewController: view)
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        
        return navigation
    }
}
