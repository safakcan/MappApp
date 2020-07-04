//
//  DetailScreenInteractor.swift
//  MapApp
//
//  Created by Safak Can Bas on 3.07.2020.
//  Copyright (c) 2020 canbas. All rights reserved.
//

import Foundation

class DetailScreenInteractor: BaseInteractor {
    weak var presenter: DetailScreenPresenterInteractorProtocol?
    
    override init(networkService: NetworkService? = nil) {
        super.init(networkService: networkService)
    }
    
}

extension DetailScreenInteractor: DetailScreenInteractorProtocol {
    
}
