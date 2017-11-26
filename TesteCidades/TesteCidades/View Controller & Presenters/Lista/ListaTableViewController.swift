//
//  ListaTableViewController.swift
//  TesteCidades
//
//  Created by Andre Lucas Ota on 26/11/2017.
//  Copyright © 2017 AndreOta. All rights reserved.
//

import UIKit

class ListaTableViewController: UITableViewController {

    let activityView = UIActivityIndicatorView()
    
    var cidadeParam: String = ""
    var estadoParam: String = ""
    
    var presenter: ListaPresenter!
    
    var sections: [SectionInfo] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setLayout()
        self.setConfiguration()
        
        self.setupPresenter()
    }

    //MARK: - Layout
    func setLayout(){
        self.setTableViewLayout()
        self.setActivityViewLayout()
    }
    
    func setTableViewLayout(){
        self.tableView.tableFooterView = UIView()
    }
    
    func setActivityViewLayout(){
        self.activityView.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        self.activityView.color = UIColor.defaultBlue
        
        self.view.addSubview(self.activityView)
    }
    
    //    MARK: - Config
    func setConfiguration(){
        self.setTableViewConfiguration()
        self.setActivityViewConfiguration()
    }
    
    func setTableViewConfiguration(){
        self.tableView.register(UINib(nibName: "CidadeTableViewCell", bundle: nil), forCellReuseIdentifier: "cidadeCell")
    }
    
    func setActivityViewConfiguration(){
        self.activityView.isHidden = true
        self.activityView.hidesWhenStopped = true
        
        self.view.addSubview(self.activityView)
    }
    
    //    MARK: Presenter
    func setupPresenter(){
        self.presenter = ListaPresenter()
        self.presenter.attachView(listaView: self)
        self.presenter.loadCidadesWithFilter(cidade: self.cidadeParam, estado: self.estadoParam)
    }
    
    //    MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let identifier = segue.identifier else{
            return
        }
        
        switch identifier{
        case "goToResultado":
            self.doGoToResultadoSetup(segue: segue, sender: sender)
            break
            
        default: break
        }
    }
    
    func doGoToResultadoSetup(segue: UIStoryboardSegue, sender: Any?){
        let indexPath = sender as! IndexPath
        
        let resultadoView = segue.destination as! CidadeViewController
        resultadoView.cidade = self.sections[indexPath.section].itemsInSection[indexPath.row]
    }
}
