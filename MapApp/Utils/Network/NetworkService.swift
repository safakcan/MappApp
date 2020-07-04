//
//  NetworkService.swift
//  MapApp
//
//  Created by Safak Can Bas on 1.07.2020.
//  Copyright © 2020 canbas. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class NetworkService {

    typealias SuccessCompletionHandler = (_ result: JSON) -> Void
    typealias FailureCompletionHandler = (_ result: JSON) -> Void//(ErrorModel) -> Void
    
 static let sharedInstance = NetworkService()

    static let configuration: URLSessionConfiguration = {
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = 30
        configuration.timeoutIntervalForResource = 30
        return configuration
    }()
     private let sessionManager: Session
        private init() {
            self.sessionManager = Session.init(configuration: NetworkService.configuration,
                                                      delegate: SessionDelegate())
        }
        
        func getJSON(url: URLConvertible, useToken: Bool = false, parameters: [String: Any]? = nil, headers: [String: String]? = nil,
                     success: @escaping SuccessCompletionHandler, failure: @escaping FailureCompletionHandler) {
            callJSON(method: .get, url: url, useToken: useToken, parameters: parameters, headers: headers, success: success, failure: failure)
        }
        
        func postJSON(url: URLConvertible, useToken: Bool = false, parameters: [String: Any]? = nil, headers: [String: String]? = nil,
                      success: @escaping SuccessCompletionHandler, failure: @escaping FailureCompletionHandler) {
            callJSON(method: .post, url: url, useToken: useToken, parameters: parameters, headers: headers, success: success, failure: failure)
        }
        
        fileprivate func callJSON(method: HTTPMethod,
                                  url: URLConvertible,
                                  useToken: Bool = false,
                                  parameters: [String: Any]? = nil,
                                  headers: [String: String]? = nil,
                                  success: @escaping SuccessCompletionHandler,
                                  failure: @escaping FailureCompletionHandler) {
            
//            var headerParams = [String: String]()
//                   if let headers = headers {
//                       headerParams = headers
//                   }
            
            let headerss : HTTPHeaders = [
                "Authorization": "Basic MY-API-KEY",
                "Content-Type" : "application/x-www-form-urlencoded"
            ]
            
            sessionManager.request(url, method: method, parameters: parameters,
                encoding: JSONEncoding.default, headers: headerss).validate()
                .responseJSON(completionHandler: { response in
                    switch response.result {
                        
                    case .success(let data):
                        let json = JSON(data)
                        success(json)
                        
                    case .failure(let error):
                        if let _ = response.response?.statusCode {
                           let json = JSON(error)
                           failure(json)
                        }
                    }
            })
        }
    }
