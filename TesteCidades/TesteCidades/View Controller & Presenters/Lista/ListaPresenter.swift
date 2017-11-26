//
//  ListaPresenter.swift
//  TesteCidades
//
//  Created by Andre Lucas Ota on 26/11/2017.
//  Copyright © 2017 AndreOta. All rights reserved.
//

import UIKit

class ListaPresenter: NSObject {
    private var listaView: ListaView!
    
    func attachView(listaView: ListaView){
        self.listaView = listaView
    }
    
    //    MARK: - Request
    func loadCidadesWithFilter(cidade: String, estado: String){
        self.listaView.startLoading()
        CidadesNetwork.cidadesRoutine { (cidades) in
            if cidades == nil{
                self.listaView.finishLoading()
                self.listaView.showAlert(msg: "Ocorreu um erro. Tente novamente mais tarde.")
                return
            }
            
            self.filterCidades(cidades: cidades!, cidadeParam: cidade, estadoParam: estado)
        }
    }
    
    //    MARK: - Process
    func filterCidades(cidades: [CidadeModel], cidadeParam: String, estadoParam: String){
        /**
         Filtra as cidades de acordo com a cidade e estado passados
         Caso não haja parâmetros, exibe todos os resultados
         */
        let filteredCidades: [CidadeModel] = cidades.filter({
            (($0.nome.lowercased().contains(cidadeParam.lowercased())) || (cidadeParam == "") &&
                ($0.estado.lowercased().contains(estadoParam.lowercased()) || (estadoParam == "")))
        } )
        
        self.listaView.setCidades(sections: self.aggregateCidades(cidades: filteredCidades))
        self.listaView.finishLoading()
    }
    
    func aggregateCidades(cidades: [CidadeModel]) -> [SectionInfo]{
        var sectionInfoArray: [SectionInfo] = []
        
        /**
         Agrupa as cidades em sections de acordo com seu Estado
        */
        
        for cidade in cidades{
            let estado = cidade.estado
            
            if let section = sectionInfoArray.filter({
                //Verifica se há alguma section com o estado atual
                $0.sectionTitle == estado
            }).first{
                section.itemsInSection.append(cidade)
            } else{
                //Caso não haja uma section com o nome do estado, cria uma nova
                let section = SectionInfo(itemsInSection: [cidade], sectionTitle: estado)
                sectionInfoArray.append(section)
            }
        }
        
        return sectionInfoArray
    }
}
