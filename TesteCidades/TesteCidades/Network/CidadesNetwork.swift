//
//  CidadesNetwork.swift
//  TesteCidades
//
//  Created by Andre Lucas Ota on 26/11/2017.
//  Copyright © 2017 AndreOta. All rights reserved.
//

import UIKit

import Foundation
import SwiftyJSON

class CidadesNetwork : NetworkManager {
    class func cidadesRoutine(callback: @escaping([CidadeModel]?) -> Void){
        print(REST.lista_url)
        
        requestJson(method: Method.get, url: REST.lista_url) { (response) in
            
            if (response.response?.statusCode ?? 0) != 200{
                callback(nil)
                return
            }
            
            guard let cidadesJson = response.result.value as? [[String: Any]] else{
                callback(nil)
                return
            }
            
            var listaCidades: [CidadeModel] = []
            for cidadeJson in cidadesJson{
                listaCidades.append(CidadeModelLoader.loadCidadeModel(json: cidadeJson))
            }
            
            callback(listaCidades)
            return
        }
    }
}

