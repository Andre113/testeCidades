//
//  ListaViewProtocol.swift
//  TesteCidades
//
//  Created by Andre Lucas Ota on 26/11/2017.
//  Copyright © 2017 AndreOta. All rights reserved.
//

import UIKit

protocol ListaView: NSObjectProtocol{
    func startLoading()
    func finishLoading()
    func setCidades(sections: [SectionInfo])
}

extension ListaTableViewController: ListaView{
    
    func startLoading() {
        self.view.isUserInteractionEnabled = false
        self.view.bringSubview(toFront: self.activityView)
        
        self.activityView.center = self.tableView.center
        self.activityView.startAnimating()
    }
    
    func finishLoading() {
        self.view.isUserInteractionEnabled = true
        self.activityView.stopAnimating()
    }
    
    func setCidades(sections: [SectionInfo]) {
        self.sections = sections
        self.updateTableView()
    }
}
