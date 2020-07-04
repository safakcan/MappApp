//
//  StoryBoard+Extensions.swift
//  MapApp
//
//  Created by Safak Can Bas on 1.07.2020.
//  Copyright © 2020 canbas. All rights reserved.
//

import UIKit

extension UIStoryboard {
    
    static var mainStoryBoard: UIStoryboard {
        return UIStoryboard(name: "Main", bundle: nil)
    }
    
    func instantiateViewController<VC: UIViewController>() -> VC {
        guard let viewController = self.instantiateViewController(withIdentifier: VC.className) as? VC
            else { fatalError("could not instantiateViewController with identifier \(VC.className)") }
        return viewController
    }
}

extension NSObject {
    
    class var className: String {
        return String(describing: self)
    }
}
