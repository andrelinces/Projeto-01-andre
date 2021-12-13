//
//  Card1DataSource.swift
//  Project_01_Desafio
//
//  Created by Andre Linces on 11/12/21.
//

import UIKit

class Card1DataSource: NSObject {
    
    var data = [Any] ()
    var navigationController : UINavigationController?
    
    
    func initializeTableView(tableView: UITableView) {
        
        tableView.dataSource = self
        tableView.delegate = self
        
        //Registing the cards and cells
        tableView.register(UINib(nibName: "Card1ModelCell", bundle: Bundle.main), forCellReuseIdentifier: "Card1ModelCellIdentifier")
        
    }
}

extension Card1DataSource: UITableViewDataSource, UITableViewDelegate {

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print("Scroll contentOffSet: \(scrollView.contentOffset.y)")
        if scrollView.contentOffset.y > 10 {
            
            navigationController?.navigationBar.alpha = scrollView.contentOffset.y / 100
            
        }else{
            
            navigationController?.navigationBar.alpha = 0
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let card1Model = data[ indexPath.row ] as? Card1Model {
            
            return card1Model.cellForTableView(tableView: tableView, atIndexpath: indexPath)
            
        }else{
            
            return UITableViewCell()
        }
        
    }
    
}
