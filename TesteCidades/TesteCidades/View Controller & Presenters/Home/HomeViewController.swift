//
//  HomeViewController.swift
//  TesteCidades
//
//  Created by Andre Lucas Ota on 26/11/2017.
//  Copyright © 2017 AndreOta. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var cidadeTextField: UITextField!
    @IBOutlet weak var estadoTextField: UITextField!
    @IBOutlet weak var buscarButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setLayout()
        self.setConfiguration()
    }
    
    //    MARK: - Layout
    func setLayout(){
        self.setBuscarButtonLayout()
    }
    
    func setBuscarButtonLayout(){
        self.buscarButton.layer.cornerRadius = 5.0
    }
    
    //    MARK: - Config
    func setConfiguration(){
        self.configCidadeTextField()
        self.configEstadoTextField()
    }
    
    func configCidadeTextField(){
        self.cidadeTextField.delegate = self
        self.cidadeTextField.tag = 10
    }
    
    func configEstadoTextField(){
        self.estadoTextField.delegate = self
        self.estadoTextField.tag = 11
    }
    
    //    MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let identifier = segue.identifier else{
            return
        }
        
        switch identifier{
        case "goToResultados":
            self.doGoToResultadosSetup(segue: segue)
            break
            
        default: break
        }
    }
    
    func doGoToResultadosSetup(segue: UIStoryboardSegue){
        let listaView = segue.destination as! ListaTableViewController
        listaView.cidadeParam = self.cidadeTextField.text ?? ""
        listaView.estadoParam = self.estadoTextField.text ?? ""
    }
    
    //    MARK: - Other
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        
        self.view.endEditing(true)
    }
}
