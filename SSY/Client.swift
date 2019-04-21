//
//  Client.swift
//  SSY
//
//  Created by Navi on 15/04/2019.
//  Copyright © 2019 Navi. All rights reserved.
//

import UIKit
import MobileBuySDK
class Client{
    
    static let shopDomain = "graphql.myshopify.com"
    static let apiKey     = "8e2fef6daed4b93cf4e731f580799dd1"
    static let merchantID = "merchant.com.your.id"
    
    static let shared = Client()
    
    private let client: Graph.Client = Graph.Client(shopDomain: Client.shopDomain, apiKey: Client.apiKey)
    
    // ----------------------------------
    //  MARK: - Init -
    //
    private init() {
        self.client.cachePolicy = .cacheFirst(expireIn: 3600)
    }
    
    @discardableResult
    func login(email: String, password: String, completion: @escaping (String?) -> Void) -> Task {
        
        let mutation = ClientQuery.mutationForLogin(email: email, password: password)
        let task     = self.client.mutateGraphWith(mutation) { (mutation, error) in
//            error.debugPrint()
            
            if let container = mutation?.customerAccessTokenCreate?.customerAccessToken {
                completion(container.accessToken)
            } else {
                let errors = mutation?.customerAccessTokenCreate?.customerUserErrors ?? []
                print("Failed to login customer: \(errors)")
                completion(nil)
            }
        }
        
        task.resume()
        return task
    }
}
