//
//  HomeScreenInteractor.swift
//  MapApp
//
//  Created by Safak Can Bas on 1.07.2020.
//  Copyright (c) 2020 canbas. All rights reserved.
//

import Foundation
import GooglePlaces
import GoogleMaps

class HomeScreenInteractor: BaseInteractor {
    weak var presenter: HomeScreenPresenterInteractorProtocol?
    
    override init(networkService: NetworkService? = nil) {
        super.init(networkService: networkService)
    }
    
}

extension HomeScreenInteractor: HomeScreenInteractorProtocol {
   
    func requestSelectedLocation(place: GMSPlace) {
     
        networkService.getJSON(url:"\(URLS.googleApiURL)&sensor=true&location=\(place.coordinate.latitude),\(place.coordinate.longitude)&radius=1000", success: { (json) in

            let result = json["results"].map {LocationModel(json: $0.1)}
            self.presenter?.passSelectedLocationObject(response: result)
               }) { (json) in
                   //
               }
    }
    
  
}
