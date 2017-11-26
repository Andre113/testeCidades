//
//  CidadeViewProtocol.swift
//  TesteCidades
//
//  Created by Andre Lucas Ota on 26/11/2017.
//  Copyright © 2017 AndreOta. All rights reserved.
//

import UIKit

protocol CidadeView: NSObjectProtocol {
    func startLoading()
    func finishLoading()
    func setPontos(pontos: String)
    func showAlert(msg: String)
}

extension CidadeViewController: CidadeView {
    func startLoading() {
        self.view.isUserInteractionEnabled = false
        self.view.bringSubview(toFront: self.activityView)
        
        self.activityView.center = self.view.center
        self.activityView.startAnimating()
    }
    
    func finishLoading() {
        self.view.isUserInteractionEnabled = true
        self.activityView.stopAnimating()
    }
    
    func setPontos(pontos: String) {
        self.cidadeLabel.text = "A pontuação da Cidade \(self.cidade.nome) é \(pontos)"
    }
    
    func showAlert(msg: String) {
        self.navigationController?.showAlert(mensagem: msg)
    }
}
