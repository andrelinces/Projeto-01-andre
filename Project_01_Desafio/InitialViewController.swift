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
    
    @IBOutlet weak var initialButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
   // https://api.chucknorris.io/img/chucknorris_logo_coloured_small@2x.png
  
        
        //Donwload image and display in initial screen
        let url = URL(string: "https://api.chucknorris.io/img/chucknorris_logo_coloured_small@2x.png")
        // this downloads the image asynchronously if it's not cached yet
        initialImage.kf.setImage(with: url)
        
        
        // Do any additional setup after loading the view, typically from a nib.
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
          initialImage.isUserInteractionEnabled = true
          initialImage.addGestureRecognizer(tapGestureRecognizer)
      }

      @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer)
      {
          let tappedImage = tapGestureRecognizer.view as! UIImageView

          performSegue(withIdentifier: "segueTableView", sender: nil)
          
          
        
        
        
        
        
        //let url = URL(string: "https://api.chucknorris.io/img/chucknorris_logo_coloured_small@2x.png")
        // this downloads the image asynchronously if it's not cached yet
        //initialButton.kf.setImage(Data)
        
//        let url = URL(string: image.url)
//
//        DispatchQueue.global().async {
//            let data = try? Data(contentsOf: url!) //make sure your image in this url does exist, otherwise unwrap in a if let check / try-catch
//            DispatchQueue.main.async {
//                imageView.image = UIImage(data: data!)
//            }
//        }
        
    }
    
    
    
}
