//
//  APIManagerViewController.swift
//  SSY
//
//  Created by Navi on 03/04/2019.
//  Copyright © 2019 Navi. All rights reserved.
//

import UIKit
import Alamofire

class APIManager: NSObject {

    let BASE_URL = "https://c1c8b7c438383275fc2238eefec512c0:d7d113a701a5c93eae6df675c717f214@sewsewyou.myshopify.com/admin/"
    
    
    static let sharedInstance: APIManager = {
        let instance = APIManager()
        // setup code
        return instance
    }()
    
    // MARK: - Initialization Method
    
    override init() {
        super.init()
    }
    
    deinit {
        
    }
    
    func SignUp(params: [String: Any], completion: @escaping (_ result: [String: Any], _ response: Bool) -> ()) {
//        let strURL = "\(BASE_URL)customers.json"
        let strURL = "https://c1c8b7c438383275fc2238eefec512c0:d7d113a701a5c93eae6df675c717f214@sewsewyou.myshopify.com/admin/customers.json"
        
        let headers : HTTPHeaders = [ "Content-Type":"application/json" ]
        
       
        Alamofire.request(strURL, method: .post, parameters: params, encoding: Alamofire.JSONEncoding.default , headers: headers)
            .responseJSON { response in
                print(response)
                if let status = response.response?.statusCode {
                    switch(status) {
                    case 200:
                        if let result = response.result.value {
                            let JSON = result as! [String: Any]
                            completion(JSON, true)
                        }
                        break
                    default:
                        if let result = response.result.value {
                            let JSON = result as! [String: Any]
                            completion(JSON, false)
                        } else {
                            completion(["": ""], false)
                        }
                    }
                } else {
                    completion(["": ""], false)
                }
        }
    }
}
