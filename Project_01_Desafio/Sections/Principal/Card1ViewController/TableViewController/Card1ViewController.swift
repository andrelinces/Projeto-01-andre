//
//  Card1ViewController.swift
//  Project_01_Desafio
//
//  Created by Andre Linces on 11/12/21.
//

import UIKit
import Alamofire
import Kingfisher
import SwiftUI

class Card1ViewController: UIViewController, Card1ModelCallBack, CardTitleModelCallBack {
   
    var responseArray : NSArray = []
    
    var categorySelect : String = ""
    
    //MARK: Protocolos da celula Card1ModelCell
    func acaoCliqueCard1(indexPath: IndexPath) {
        print("Index, clicou no card?: \(indexPath)")
        //Send select category for viewJokes...
        
        let categoriesList = responseArray.count
        
        if categoriesList > 0 {
            
            let category = self.responseArray [indexPath.row]
            //enviando o usuário para o detalhe do snap selecionado.
            
            self.categorySelect = "\(category)"
            
            self.performSegue(withIdentifier: "segueJokes", sender: nil)
            //Prints to test whether the selected category has been identified.
            print("test category acaoClique: \(category)")
            
        }
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
        
//            AF.request("https://api.chucknorris.io/jokes/categories").responseJSON { response in
//                if let json = response.value {
//                    self.responseArray = json as! NSArray
//
//                    print("test json card1Model: \(self.responseArray)")
//                    for recoverList in self.responseArray  {
//
//                        print("test recoverlist: \(recoverList)")
//                    }
//                }
//
//            }
//        print("test responseArray didload: \(self.responseArray)")
        recoverJson()
        setupTableView()
       
    }
    func recoverJson () {
        //Card for display the user, when load the tableView
        let cardTitle = CardTitleModel(delegate: self, titleCard: "Chuck Noris, Categories Jokes!", descriptionCard: "loading list of categories, chuck Noris joke... ")
        self.dataSourceCard1.initializeTableView(tableView: self.tableView)
        
        self.dataSourceCard1.data.append(cardTitle)
        self.tableView.reloadData()
        
        AF.request("https://api.chucknorris.io/jokes/categories").responseJSON { response in
            switch response.result {
            case .success(let json):
                //internet works
                self.dataSourceCard1.data.removeAll()
                self.tableView.reloadData()
                let cardTitle = CardTitleModel(delegate: self, titleCard: "Chuck Noris, Categories Jokes!", descriptionCard: "Choose a category to display a chuck Noris joke. ")
                self.dataSourceCard1.data.append(cardTitle)
                self.responseArray = json as! NSArray
                
                for recoverList in self.responseArray  {
                    
                    let card1 = Card1Model(delegate: self, tituloCard1: "Category:", descricaoCard1: "\(recoverList)")
                    
                    
                    self.dataSourceCard1.data.append(card1)
                    print("test json RecoverJson: \(json)")
                    self.dataSourceCard1.initializeTableView(tableView: self.tableView)
                    self.tableView.reloadData()
                }
                
                break
            case .failure(let error):
                
                if let err = error as? URLError, err.code  == URLError.Code.notConnectedToInternet {
                //if let err =  error as? AFError, err._code == URLError.notConnectedToInternet {
                    //no internet connection
                    print("no internet connection!!:\(err)")
                }else {
                    //other failures
                    print("no internet connection, other!!:")
                    let cardTitle = CardTitleModel(delegate: self, titleCard: "Chuck Noris, Categories Jokes!", descriptionCard: "Connection failed!\n" +
                                                   "Please check your connection, and try again! ")
                    self.dataSourceCard1.data.append(cardTitle)
                    self.dataSourceCard1.initializeTableView(tableView: self.tableView)
                    self.tableView.reloadData()
                }
//                self.responseArray = json as! NSArray
//
//                for recoverList in self.responseArray  {
//
//                    let card1 = Card1Model(delegate: self, tituloCard1: "Category", descricaoCard1: "\(recoverList)")
//                    self.dataSourceCard1.data.append(card1)
//                    print("test funcRecover card1 setup: \(card1)")
                    
                    
                    print("Passou dentro da requisicao")
                    //self.dataSourceCard1.initializeTableView(tableView: self.tableView)
                    //self.tableView.reloadData()
  //              }
                
            }
                
        }
    }
    
    func setupTableView() {
        
        let test = self.responseArray
        print("test setup: \(test)")
        
//        AF.request("https://api.chucknorris.io/jokes/categories").responseJSON { response in
//            if let json = response.value {
//                self.responseArray = json as! NSArray
//
//                for recoverList in self.responseArray  {
//
//                    print("test responseArray setup: \(self.responseArray)")
//
//                    let card1 = Card1Model(delegate: self, tituloCard1: "Category", descricaoCard1: "\(recoverList)")
//                    self.dataSourceCard1.data.append(card1)
//                    print("test card1 setup: \(card1)")
//
//
//                    print("Passou dentro da requisicao")
//                    self.dataSourceCard1.initializeTableView(tableView: self.tableView)
//                    self.tableView.reloadData()
//                }
//
//            }
//
//
//        }
          
        //let card1 = CardTitleModel(delegate: self, titleCard: "Chuck Noris Jokes", descriptionCard: "Select a joke category, enjoy !")
        
//        let card2 = Card1Model(delegate: self, tituloCard1: "Category:", descricaoCard1: "animal ")
//
//        let card3 = Card1Model(delegate: self, tituloCard1: "Category:", descricaoCard1: "dev ")
        
        self.navigationController?.navigationBar.alpha = 0
        self.navigationItem.title = "Chuck Noris Jokes"
        
        
        dataSourceCard1.navigationController = self.navigationController
        
//        dataSourceCard1.data.append(card1)
//        dataSourceCard1.data.append(card2)
//        dataSourceCard1.data.append(card3)
//        dataSourceCard1.data.append(card2)
//        dataSourceCard1.data.append(card3)
//        dataSourceCard1.data.append(card2)
//        dataSourceCard1.data.append(card3)
//        dataSourceCard1.data.append(card2)
//        dataSourceCard1.data.append(card3)
        
        
        //Inserting the number of cards inserted in the table.
//        dataSourceCard1.initializeTableView(tableView: tableView)
        
        tableView.allowsSelection = false
        
        tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        
        
    print("Passou fora da requisicao")
         
    }
    
//    override func viewDidAppear(_ animated: Bool) {
//
//        setupTableView()
//
//    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        if segue.identifier == "segueJokes" {

            let jokesViewController = segue.destination as? JokesViewController

            //Send the data to the JokesViewController
            jokesViewController?.initialize(category: self.categorySelect)
            print("test prepare: \(jokesViewController)")
        }
         
    }
      
}

