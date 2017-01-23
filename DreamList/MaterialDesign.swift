//
//  MaterialDesign.swift
//  DreamList
//
//  Created by Neven on 23/01/2017.
//  Copyright © 2017 Neven. All rights reserved.
//

import UIKit

private var _materialDeisgn: Bool = false

extension UIView {

    @IBInspectable var materialDesign: Bool {
        
        get {
            return _materialDeisgn
        }
        
        set {
            
            _materialDeisgn = newValue
            
            if _materialDeisgn {
            
                self.layer.masksToBounds = false
                self.layer.cornerRadius = 3.0
                self.layer.shadowOpacity = 0.8
                self.layer.shadowRadius = 3.0
                self.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
                self.layer.shadowColor = UIColor(red: 155/255, green: 155/255, blue: 155/255, alpha: 1.0).cgColor
                
            } else {
            
                self.layer.cornerRadius = 0
                self.layer.shadowOpacity = 0
                self.layer.shadowRadius = 0
                self.layer.shadowColor = nil
            
            }
            
        }
    
    }

}
