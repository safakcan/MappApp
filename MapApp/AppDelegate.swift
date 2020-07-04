//
//  AppDelegate.swift
//  MapApp
//
//  Created by Safak Can Bas on 1.07.2020.
//  Copyright © 2020 canbas. All rights reserved.
//

import UIKit
import GooglePlaces
import GoogleMaps

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        GMSPlacesClient.provideAPIKey("AIzaSyCzGGRJKXAaD_HCWro6FHxCy9kiDi5n-_A")
        GMSServices.provideAPIKey("AIzaSyCzGGRJKXAaD_HCWro6FHxCy9kiDi5n-_A")
        HomeScreenWireframe().show(transationType: .root)
        return true
    }


}

