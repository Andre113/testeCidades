//
//  CidadeTableViewCell.swift
//  TesteCidades
//
//  Created by Andre Lucas Ota on 26/11/2017.
//  Copyright © 2017 AndreOta. All rights reserved.
//

import UIKit

class CidadeTableViewCell: UITableViewCell {
    
    @IBOutlet weak var cidadeLabel: UILabel!
    @IBOutlet weak var estadoLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    //    MARK: - Set
    func setCidade(cidade: CidadeModel){
        self.cidadeLabel.text = cidade.nome
        self.estadoLabel.text = cidade.estado
    }
}
