//
//  CidadeViewController.swift
//  TesteCidades
//
//  Created by Andre Lucas Ota on 26/11/2017.
//  Copyright © 2017 AndreOta. All rights reserved.
//

import UIKit

class CidadeViewController: UIViewController {

    @IBOutlet weak var cidadeLabel: UILabel!
    
    let activityView = UIActivityIndicatorView(activityIndicatorStyle: .whiteLarge)
    
    var cidade: CidadeModel!
    
    var presenter: CidadePresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setLayout()
        self.setConfiguration()
        
        self.setupPresenter()
    }
    
    //    MARK: - Layout
    func setLayout(){
        self.setActivityViewLayout()
    }
    
    func setActivityViewLayout(){
        self.activityView.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        self.activityView.color = UIColor.defaultBlue
        
        self.view.addSubview(self.activityView)
    }
    
    //    MARK: - Config
    func setConfiguration(){
        self.setActivityViewConfiguration()
    }
    
    func setActivityViewConfiguration(){
        self.activityView.isHidden = true
        self.activityView.hidesWhenStopped = true
        
        self.view.addSubview(self.activityView)
    }
    
    //    MARK: Presenter
    func setupPresenter(){
        self.presenter = CidadePresenter()
        self.presenter.attachView(cidadeView: self)
        self.presenter.loadPontos(cidade: self.cidade)
    }
}
