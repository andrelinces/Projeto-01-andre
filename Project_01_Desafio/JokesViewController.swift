//
//  JokesViewController.swift
//  Project_01_Desafio
//
//  Created by Andre Linces on 07/12/21.
//

import UIKit
import Alamofire
import Kingfisher

class JokesViewController: UIViewController {
    
    @IBOutlet weak var imageJokes: UIImageView!
    
    @IBOutlet weak var labelJokes: UILabel!
    
    var url = "https://api.chucknorris.io/jokes/random"
    
    var categorySelect : String = ""
    
    //Func to how receives category select in tableview
    func initialize (category : String) {
        
        self.categorySelect = category
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Donwload image and display in JokesViemController screen
        let url = URL(string: "https://assets.chucknorris.host/img/avatar/chuck-norris.png")
        // this downloads the image asynchronously if it's not cached yet
        imageJokes.kf.setImage(with: url)
        
        //Retrieves data JSON using alamofire api for to add objects.
        AF.request("https://api.chucknorris.io/jokes/random?category=" + categorySelect).responseJSON { response in
            if let json = response.data {
       
                let joke = JokesViewController.getModelJokes(jokes_config_list: json)
                
                print("test json: \(joke.id)")
                print("test json: \(joke.url)")
                print("test json: \(joke.created_at)")
                print("test json: \(joke.value)")
                
                self.labelJokes.text = joke.value
                
            }
            
        }
    }
    //Model function to decode JSON data and be able to manipulate the objects.
    static func getModelJokes(jokes_config_list : Data) -> ModelChuckJokes {
        
        //Parsing the data
        
        let decoder = JSONDecoder()
        let parsedData = try! decoder.decode(ModelChuckJokes.self, from: jokes_config_list )
        
       return parsedData
    }
       
}
