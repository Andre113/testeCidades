//
//  HomeTextFieldDelegate.swift
//  TesteCidades
//
//  Created by Andre Lucas Ota on 26/11/2017.
//  Copyright © 2017 AndreOta. All rights reserved.
//

import UIKit

extension HomeViewController: UITextFieldDelegate{
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        let nsText = textField.text! as NSString
        let newText = nsText.replacingCharacters(in: range, with: string)
        
        return newText.rangeOfCharacter(from: CharacterSet.letters.union(.whitespaces).inverted) == nil
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        
        let tag = textField.tag
        if tag != 11{
            self.view.viewWithTag(tag + 1)?.becomeFirstResponder()
        } else{
            self.performSegue(withIdentifier: "goToResultados", sender: self)
        }
        
        return true
    }
}
