//
//  LocationModel.swift
//  MapApp
//
//  Created by Safak Can Bas on 3.07.2020.
//  Copyright © 2020 canbas. All rights reserved.
//

import Foundation
import SwiftyJSON

class LocationModel {
    
    var name: String?
    var vicinity: String?
    
    required init(json: JSON) {
        
        name = json["name"].stringValue
        vicinity = json["vicinity"].stringValue
        
    }
}
