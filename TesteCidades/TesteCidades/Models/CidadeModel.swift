//
//  CidadeModel.swift
//  TesteCidades
//
//  Created by Andre Lucas Ota on 26/11/2017.
//  Copyright © 2017 AndreOta. All rights reserved.
//

import Foundation

struct CidadeModel {
    var nome: String = ""
    var estado: String = ""
}

class CidadeModelLoader: NSObject {
    static func loadCidadeModel(json: [String: Any]) -> CidadeModel {
        var cidade = CidadeModel()
        cidade.nome = json["Nome"] as? String ?? ""
        cidade.estado = json["Estado"] as? String ?? ""
        
        return cidade
    }
}
