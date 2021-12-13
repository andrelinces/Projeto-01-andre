//
//  Card1ModelCell.swift
//  Project_01_Desafio
//
//  Created by Andre Linces on 11/12/21.
//

import UIKit

class Card1ModelCell: UITableViewCell {
    
    @IBOutlet weak var card1View: UIView!
    
    @IBOutlet weak var labelTituloCard1: UILabel!
    
    @IBOutlet weak var labelDescricaoCard1: UILabel!
    
    
    func setupDesign () {
        
        card1View.modificaDesigneView(cornerRadius: 28)
        
        
    }
    
    func setupValues (tituloCard1: String, descricaoCard1: String) {
        
        labelTituloCard1.text = tituloCard1
        
        labelDescricaoCard1.text = descricaoCard1
    }
    
    
}
