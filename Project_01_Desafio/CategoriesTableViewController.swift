//
//  CategoriesTableViewController.swift
//  Project_01_Desafio
//
//  Created by Andre Linces on 04/12/21.
//

import UIKit
import Alamofire

class CategoriesTableViewController: UITableViewController {
    
    var responseArray: NSArray = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        AF.request("https://api.chucknorris.io/jokes/categories").responseJSON { response in
            if let json = response.value {
                            print("test json: \(json)")
                            self.responseArray = json as! NSArray
                print("test responseArray: \(self.responseArray)")
                self.tableView.reloadData()
                        }
            
        }
        
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return responseArray.count
        print("Test numberOfRowsInSection: \(responseArray)")
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellReuseCategories", for: indexPath)
       // let url = URL(string: "https://api.chucknorris.io/jokes/categories")
        
        // Configure the cell...
                let categories = responseArray[indexPath.row]
                //let artistName = (whichCategories as AnyObject)["artistName"] as? String
        
                cell.textLabel?.text = categories as? String
        
        //        cell.textLabel?.text = [categories] as? String
        //cell.textLabel?.text = "https://api.chucknorris.io/jokes/categories"
        
      return cell
    }
    
    //Método para tratar o clique no snap escolhido e enviar para o usuário para o detalhe do snap.
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let categoriesList = responseArray.count
        //teste para verificar se existe algum snap para o usuário logado.
        if categoriesList > 0 {
            //montando o snap
            let category = self.responseArray [ indexPath.row ]
            //enviando o usuário para o detalhe do snap selecionado.
            self.performSegue(withIdentifier: "segueJokes", sender: category)
            
            print("test category didselect: \(category)")
            
        }
        
        
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//
//        if segue.identifier == "segueJokes" {
//
//            let detalhesSnapViewController = segue.destination as! DetalhesSnapViewController
//
//            //enviando os detalhes do snap para a view SnapsDetalhesController
//            detalhesSnapViewController.snap = sender as! Snaps
//        }
//
//    }
    
}
