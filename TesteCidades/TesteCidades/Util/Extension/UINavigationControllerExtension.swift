
//
//  UINavigationControllerExtension.swift
//  TesteCidades
//
//  Created by Andre Lucas Ota on 26/11/2017.
//  Copyright © 2017 AndreOta. All rights reserved.
//

import UIKit

extension UINavigationController {
    //Mostrar alertas na view
    func showAlert(mensagem: String){
        let alertController = UIAlertController(title: "Cidades", message: mensagem, preferredStyle: UIAlertControllerStyle.alert)
        
        alertController.addAction(UIAlertAction(title: "Fechar", style: .default, handler: nil))
        
        self.present(alertController, animated: true, completion: nil)
    }
}
