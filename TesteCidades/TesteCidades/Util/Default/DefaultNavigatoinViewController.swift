//
//  DefaultNavigatoinViewController.swift
//  TesteCidades
//
//  Created by Andre Lucas Ota on 26/11/2017.
//  Copyright © 2017 AndreOta. All rights reserved.
//

import UIKit

class DefaultNavigatoinViewController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.setLayout()
    }
    
    //    MARK: - Layout
    func setLayout(){
        self.setNavbarLayout()
    }
    
    func setNavbarLayout(){
        self.navigationBar.isTranslucent = false
        self.navigationBar.barTintColor = UIColor.defaultBlue
        self.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor : UIColor.white]
        self.navigationBar.tintColor = UIColor.white
    }
}
