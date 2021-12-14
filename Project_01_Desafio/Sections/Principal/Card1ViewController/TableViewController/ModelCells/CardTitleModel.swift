//
//  CardTitleModel.swift
//  Project_01_Desafio
//
//  Created by Andre Linces on 13/12/21.
//

import UIKit


protocol CardTitleModelCallBack: class {
    func acaoBotaoRetornar()
}

class CardTitleModel: tableViewCompatible {
    internal init(delegate: CardTitleModelCallBack, titleCard: String, descriptionCard: String) {
        self.delegate = delegate
        self.titleCard = titleCard
        self.descriptionCard = descriptionCard
    }
    
    open weak var delegate : CardTitleModelCallBack?
    
    var titleCard :  String
    var descriptionCard : String
    
    var reuseIdentifier: String {
        return "CardTitleModelCellIdentifier"
    }
    
    
    func cellForTableView(tableView: UITableView, atIndexpath indexpath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexpath) as? CardTitleModelCell {
            
            cell.setupValues(titleCard: titleCard, descriptionCard: descriptionCard)
            
            //Adicionando cliques
            cell.botaoRetornar.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(acaoCliqueBotaoRetornar)))
            
            return cell
            
        }else{
            print("Test tableview")
            return UITableViewCell()
        }
        
    }
    @objc func acaoCliqueBotaoRetornar () {
        delegate?.acaoBotaoRetornar()
    }
    
}
