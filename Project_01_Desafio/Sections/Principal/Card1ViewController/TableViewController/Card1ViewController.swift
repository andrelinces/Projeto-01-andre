//
//  Card1ViewController.swift
//  Project_01_Desafio
//
//  Created by Andre Linces on 11/12/21.
//

import UIKit

class Card1ViewController: UIViewController, Card1ModelCallBack {
   
    func acaoCliqueCard1(indexPath: IndexPath) {
        print("clicou no card1: \(indexPath)")
//        //Vou tentar enviar para uma nova tela
//        
//        if indexPath.row == 0 {
//            
//            performSegue(withIdentifier: "segueJokes" , sender: nil)
//            print("if do, clicou no card: \(indexPath)")
//        }
    }
    func acaoCliqueCard1View(){
        print("clicou no card1: ")
        
    }
//    func acaoCliqueCard1() {
//
//        print("test click category: ")
//
//    }
    
    @IBOutlet weak var tableView: UITableView!
    
    let dataSourceCard1 = Card1DataSource()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
       
    }
    
    func setupTableView() {
        
//        let card1 = 
        
        let card2 = Card1Model(delegate: self, tituloCard1: "Category:", descricaoCard1: "animal ")
        
        let card3 = Card1Model(delegate: self, tituloCard1: "Category:", descricaoCard1: "dev ")
        
        self.navigationController?.navigationBar.alpha = 0
        dataSourceCard1.navigationController = self.navigationController
        
        dataSourceCard1.data.append(card1)
        dataSourceCard1.data.append(card2)
        
        //Inserting the number of cards inserted in the table.
        dataSourceCard1.initializeTableView(tableView: tableView)
        
        tableView.allowsSelection = false
        
        tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
         
    }
      
}
