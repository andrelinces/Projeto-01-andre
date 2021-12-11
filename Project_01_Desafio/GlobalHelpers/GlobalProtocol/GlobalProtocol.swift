//
//  GlobalProtocol.swift
//  Project_01_Desafio
//
//  Created by Andre Linces on 11/12/21.
//

import UIKit

//Defines which method will be used for to tableview.
protocol tableViewCompatible {
    
    var reuseIdentifier : String {get}
    
    func cellForTableView ( tableView: UITableView, atIndexpath indexpath: IndexPath ) -> UITableViewCell
    
}

