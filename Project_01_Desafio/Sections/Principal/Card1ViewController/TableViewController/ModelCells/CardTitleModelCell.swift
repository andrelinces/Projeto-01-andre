//
//  CardTituloModelCell.swift
//  Project_01_Desafio
//
//  Created by Andre Linces on 13/12/21.
//

import UIKit

class CardTitleModelCell: UITableViewCell {
    
    @IBOutlet weak var labelTitleCard: UILabel!
    @IBOutlet weak var labelDescriptionCard: UILabel!
    @IBOutlet weak var botaoRetornar : UIButton!
    
    func setupValues (titleCard: String, descriptionCard: String) {
        
        labelTitleCard.text = titleCard
        labelDescriptionCard.text = descriptionCard
        
    }
      
}
