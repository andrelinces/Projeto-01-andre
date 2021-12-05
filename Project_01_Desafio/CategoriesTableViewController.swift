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
    
}
