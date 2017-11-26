//
//  PontosNetwork.swift
//  TesteCidades
//
//  Created by Andre Lucas Ota on 26/11/2017.
//  Copyright © 2017 AndreOta. All rights reserved.
//

import UIKit

class PontosNetwork: NetworkManager {
    class func pontosRoutine(cidade: String, estado: String, callback: @escaping(Int?) -> Void){
        let body = ["Nome": cidade, "Estado": estado]
        
        print(REST.busca_pontos_url)
        requestJson(method: Method.post, url: REST.busca_pontos_url, parameters: body, headers: nil) { (response) in
            
            if (response.response?.statusCode ?? 0) != 200{
                callback(nil)
                return
            }
            
            guard let pontos = response.result.value as? Int else{
                callback(nil)
                return
            }
            
            callback(pontos)
            return
        }
    }
}
