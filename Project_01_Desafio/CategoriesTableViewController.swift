//
//  CategoriesTableViewController.swift
//  Project_01_Desafio
//
//  Created by Andre Linces on 04/12/21.
//

import UIKit
import Alamofire
import AVFAudio

class CategoriesTableViewController: UITableViewController {
    
    //Variable for received list of the JSON
    var responseArray: NSArray = []
    //Variable how receive use in initializer
    var categorySelect : String = ""
    
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
               
                cell.textLabel?.text = categories as? String
        
      return cell
    }
    
    //Method how to identifier the select cell.
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let categoriesList = responseArray.count
        
        //Testing if exists Any category in list of the tableview
        if categoriesList > 0 {
            
            let category = self.responseArray [ indexPath.row ]
            //enviando o usuário para o detalhe do snap selecionado.
            
            self.categorySelect = "\(category)"
            
            self.performSegue(withIdentifier: "segueJokes", sender: nil)
            //Prints to test whether the selected category has been identified.
            print("test category didselect: \(category)")
            
        }
          
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        if segue.identifier == "segueJokes" {

            let jokesViewController = segue.destination as? JokesViewController

            //Send the data to the JokesViewController
            jokesViewController?.initialize(category: self.categorySelect)
            print("test prepare: \(jokesViewController)")
        }
         
    }
    
}
