//
//  Card1Model.swift
//  Project_01_Desafio
//
//  Created by Andre Linces on 11/12/21.
//

import UIKit

protocol Card1ModelCallBack: class {
    
    func acaoCliqueCard1 (indexPath: IndexPath)
    
}

class Card1Model: tableViewCompatible {
    
    internal init(delegate: Card1ModelCallBack?, tituloCard1: String, descricaoCard1: String) {
        self.delegate = delegate
        self.tituloCard1 = tituloCard1
        self.descricaoCard1 = descricaoCard1
    }

    open weak var delegate : Card1ModelCallBack?
    
    var tituloCard1 :  String
    var descricaoCard1 : String
    
    var reuseIdentifier: String {
        
        return "Card1ModelCellIdentifier"
        
    }
    
    func cellForTableView(tableView: UITableView, atIndexpath indexpath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexpath) as? Card1ModelCell {
            
            cell.setupDesign()
            
            cell.setupValues(tituloCard1: tituloCard1, descricaoCard1: descricaoCard1)
           
            //Adicionando cliques
            let gestureCliqueCard = myTapCustom(target: self, action: #selector(acaoCliqueCard1View))
            gestureCliqueCard.indexPath = indexpath
            
            //Adding clicks in card1view...
            cell.card1View.addGestureRecognizer(gestureCliqueCard)
            print("test print card1model: \(gestureCliqueCard)")
            
            return cell
            
        }else{
            print("Test tableview")
            return UITableViewCell()
        }
        
    }
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        print("test category didselect: \(indexPath.count)")
//    }
    
    @objc func acaoCliqueCard1View (sender: myTapCustom) {

        delegate?.acaoCliqueCard1(indexPath: sender.indexPath!)
        print("test label card1model: \(sender.indexPath!)")
    }
    
    class myTapCustom: UITapGestureRecognizer {

        var indexPath: IndexPath?

    }
    
}


