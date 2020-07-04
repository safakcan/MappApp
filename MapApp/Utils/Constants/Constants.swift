//
//  Constants.swift
//  MapApp
//
//  Created by Safak Can Bas on 4.07.2020.
//  Copyright © 2020 canbas. All rights reserved.
//

import UIKit

let apiUrl:String       = Bundle.main.object(forInfoDictionaryKey: "apiUrl") as! String
let apiKey: String  = Bundle.main.object(forInfoDictionaryKey: "apiKey") as! String

struct URLS {
    static let googleApiURL = "\(apiUrl)/json?key=\(apiKey)"
}
