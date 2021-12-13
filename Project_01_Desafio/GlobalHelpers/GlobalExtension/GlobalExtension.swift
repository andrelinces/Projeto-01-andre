//
//  GlobalExtension.swift
//  Project_01_Desafio
//
//  Created by Andre Linces on 11/12/21.
//

import UIKit

extension UIView {
    
    //Defines the designer to cell model.
    func modificaDesigneView(cornerRadius: CGFloat, shadow: CGSize, shadowOpacity: Float) {
        self.layer.cornerRadius = cornerRadius
        
        self.layer.shadowOffset = shadow
        
        self.layer.shadowOpacity = shadowOpacity
        
    }
    
    //cardview
    func modificaDesigneView(cornerRadius: CGFloat) {
        self.layer.cornerRadius = cornerRadius
        
        self.layer.shadowOffset = CGSize(width: 0, height: 2)
        
        self.layer.shadowOpacity = 0.3
        
    }
    
}
 
