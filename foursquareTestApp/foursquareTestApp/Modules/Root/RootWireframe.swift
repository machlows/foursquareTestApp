//
//  RootWireframe.swift
//  foursquareTestApp
//
//  Created by MKM on 16.05.2018.
//  Copyright © 2018 Tomasz Machlowski. All rights reserved.
//

import UIKit

class RootWireframe {
    func presentMatchesScreen(in window: UIWindow) {
        window.makeKeyAndVisible()
        window.rootViewController = VenuesWireframe.assembleModule()
    }
}
