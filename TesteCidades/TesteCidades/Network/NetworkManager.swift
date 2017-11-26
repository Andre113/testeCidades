//
//  NetworkManager.swift
//  TesteCidades
//
//  Created by Andre Lucas Ota on 26/11/2017.
//  Copyright © 2017 AndreOta. All rights reserved.
//

import Foundation
import Alamofire

protocol NetworkManager: class {
    //Vazio :)
}

extension NetworkManager {
    typealias Parameters = [String: Any]
    typealias Headers = [String: String]
    typealias Method = Alamofire.HTTPMethod
    
    /**
     Cria conexão padrão do Alamofire, seu retorno é um JSON.
     */
    static func requestJson(method: Method, url: String, parameters: Parameters? = nil, headers: Headers? = nil, completion: @escaping (DataResponse<Any>) -> Void) {
        Alamofire.request(url
            , method: method
            , parameters: parameters
            , encoding: JSONEncoding.default
            , headers: headers)
            .validate(statusCode: 200..<300)
            .validate(contentType: ["application/json"])
            .responseJSON(completionHandler: completion)
    }
}

