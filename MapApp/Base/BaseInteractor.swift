//
//  BaseInteractor.swift
//  MapApp
//
//  Created by Safak Can Bas on 1.07.2020.
//  Copyright (c) 2020 canbas. All rights reserved.
//

import Foundation

class BaseInteractor {
    
    
    internal var networkService: NetworkService!
    
    init(networkService: NetworkService?) {
        if let networkService = networkService {
            self.networkService = networkService
        }
    }
    
}


extension BaseInteractor: BaseInteractorProtocol {
    
}
