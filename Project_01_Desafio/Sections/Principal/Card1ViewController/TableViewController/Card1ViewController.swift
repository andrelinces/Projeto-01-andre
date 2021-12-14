//
//  Card1ViewController.swift
//  Project_01_Desafio
//
//  Created by Andre Linces on 11/12/21.
//

import UIKit

class Card1ViewController: UIViewController, Card1ModelCallBack, CardTitleModelCallBack {
   
    //MARK: Protocolos da celula Card1ModelCell
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
    
    //MARK: Protocolos da celula CardTitleModelCell
    func acaoBotaoRetornar() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBOutlet weak var tableView: UITableView!
    
    let dataSourceCard1 = Card1DataSource()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
       
    }
    
    func setupTableView() {
        
        let card1 = CardTitleModel(delegate: self, titleCard: "Chuck Noris Jokes", descriptionCard: "Select a joke category, enjoy !")
        
        let card2 = Card1Model(delegate: self, tituloCard1: "Category:", descricaoCard1: "animal ")
        
        let card3 = Card1Model(delegate: self, tituloCard1: "Category:", descricaoCard1: "dev ")
        
        self.navigationController?.navigationBar.alpha = 0
        self.navigationItem.title = "Chuck Noris Jokes"
        
        
        dataSourceCard1.navigationController = self.navigationController
        
        dataSourceCard1.data.append(card1)
        dataSourceCard1.data.append(card2)
        dataSourceCard1.data.append(card3)
        dataSourceCard1.data.append(card2)
        dataSourceCard1.data.append(card3)
        dataSourceCard1.data.append(card2)
        dataSourceCard1.data.append(card3)
        dataSourceCard1.data.append(card2)
        dataSourceCard1.data.append(card3)
        
        
        //Inserting the number of cards inserted in the table.
        dataSourceCard1.initializeTableView(tableView: tableView)
        
        tableView.allowsSelection = false
        
        tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
         
    }
      
}
