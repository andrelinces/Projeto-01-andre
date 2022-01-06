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
        
        self.layer.shadowOpacity = 0.2
        
    }
    
}

//extension UIView {
//    func shake(_ dur:Double) {
//        let anim = CABasicAnimation(keyPath: "position")
//        anim.duration = dur
//        anim.repeatCount = 20
//        anim.autoreverses = true
//        anim.fromValue = NSValue(cgPoint: CGPoint(x: self.center.x - 10, y: self.center.y))
//        anim.toValue = NSValue(cgPoint: CGPoint(x: self.center.x + 10, y: self.center.y))
//        self.layer.add(anim, forKey: "position")
//    }
//}
 
extension UIView {
    func shake(_ duration: Double? = 0.4) {
        self.transform = CGAffineTransform(translationX: 20, y: 0)
        UIView.animate(withDuration: duration ?? 0.4, delay: 0, usingSpringWithDamping: 0.2, initialSpringVelocity: 1, options: .curveEaseInOut, animations: {
            self.transform = CGAffineTransform.identity
        }, completion: nil)
    }
}

extension UIImageView {
    func shakeImage(_ duration: Double? = 0.4) {
        self.transform = CGAffineTransform(translationX: 20, y: 0)
        UIImageView.animate(withDuration: duration ?? 0.4, delay: 0, usingSpringWithDamping: 0.2, initialSpringVelocity: 1, options: .curveEaseInOut, animations: {
            self.transform = CGAffineTransform.identity
        }, completion: nil)
    }
}

extension UIView {
    func shakeTest(_ dur:Double) {
        let anim = CABasicAnimation(keyPath: "position")
        anim.duration = dur
        anim.repeatCount = 10
        anim.autoreverses = true
        anim.fromValue = NSValue(cgPoint: CGPoint(x: self.center.x + 4, y: self.center.y + 4))
//        anim.fromValue = NSValue(cgPoint: CGPoint(x: self.center.x - 100, y: self.center.y - 100))
        anim.toValue = NSValue(cgPoint: CGPoint(x: self.center.x + 0, y: self.center.y + 0))
        self.layer.add(anim, forKey: "position")
    }
}

extension UIView{
    func rotate() {
        let rotation : CABasicAnimation = CABasicAnimation(keyPath: "transform.rotation.z")
        rotation.toValue = NSNumber(value: -Double.pi * 2)
        rotation.duration = 3
        rotation.isCumulative = true
        rotation.repeatCount = 2
//        rotation.repeatCount = Float.greatestFiniteMagnitude
        self.layer.add(rotation, forKey: "rotationAnimation")
        
    }
}
