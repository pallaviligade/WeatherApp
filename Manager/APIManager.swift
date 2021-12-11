//
//  APIManager.swift
//  VestiaireCollectionTest
//
//  Created by Pallavi on 25/11/21.
//

import Foundation
final class APIManager {
    static let shared = APIManager()
    private init(){}
    //MARK: - Private
    enum HTTPMethods:String {
        case POST
        case GET
        case PUT
    }
    public func createRequest(with url:URL?,
                               type:HTTPMethods
                               ,complication:@escaping (URLRequest) -> Void)
    {
        guard let apiURL = url else {return}
        var request = URLRequest(url: apiURL)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = type.rawValue
        request.timeoutInterval = 3600
        complication(request)
        
    }
}
