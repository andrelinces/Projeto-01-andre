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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Donwload image and display in initial screen
        let url = URL(string: "https://assets.chucknorris.host/img/avatar/chuck-norris.png")
        // this downloads the image asynchronously if it's not cached yet
        imageJokes.kf.setImage(with: url)
        
        
    }
    
    
    
    
}
