//
//  InitialViewController.swift
//  Project_01_Desafio
//
//  Created by Andre Linces on 04/12/21.
//

import UIKit
import Kingfisher
import SwiftUI

class InitialViewController: UIViewController {
    
    @IBOutlet weak var initialImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Donwload image and display in initial screen
        let url = URL(string: "https://api.chucknorris.io/img/chucknorris_logo_coloured_small@2x.png")
        // this downloads the image asynchronously if it's not cached yet
        initialImage.kf.setImage(with: url)
        
        // Treats the touch on the image...
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        initialImage.isUserInteractionEnabled = true
        initialImage.addGestureRecognizer(tapGestureRecognizer)
        
        
        //initialImage.shakeImage(4.0)
        self.initialImage.shakeTest(0.2)
        //self.initialImage.rotate()
        print("Test shake: ")
        
    }
    //send user for JokesViewController when click to image.
    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer)
    {
        let tappedImage = tapGestureRecognizer.view as! UIImageView
        
        performSegue(withIdentifier: "segueTableView", sender: nil)
        
    }
    
}
