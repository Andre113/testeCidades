//
//  CidadePresenter.swift
//  TesteCidades
//
//  Created by Andre Lucas Ota on 26/11/2017.
//  Copyright © 2017 AndreOta. All rights reserved.
//

import UIKit

class CidadePresenter: NSObject {
    private var cidadeView: CidadeView!
    
    func attachView(cidadeView: CidadeView){
        self.cidadeView = cidadeView
    }
    
    //    MARK: - Request
    func loadPontos(cidade: CidadeModel){
        self.cidadeView.startLoading()
        
        PontosNetwork.pontosRoutine(cidade: cidade.nome, estado: cidade.estado) { (pontos) in
            if pontos == nil{
                self.cidadeView.finishLoading()
                self.cidadeView.showAlert(msg: "Ocorreu um erro. Tente novamente mais tarde.")
                return
            }
            
            self.cidadeView.setPontos(pontos: self.formatPontos(pontos: pontos!))
            self.cidadeView.finishLoading()
        }
    }
    
    //    MARK: Process
    func formatPontos(pontos: Int) -> String{
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        
        return formatter.string(from: NSNumber(integerLiteral: pontos)) ?? "0"
    }
}
