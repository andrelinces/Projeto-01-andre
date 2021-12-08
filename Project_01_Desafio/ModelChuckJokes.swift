//
//  ModelChuckJokes.swift
//  
//
//  Created by Andre Linces on 07/12/21.
//

import UIKit

//Creates class model for receive JSON data and add to objects.
class ModelChuckJokes: Codable {
    internal init(created_at: String, icon_url: String, id: String, updated_at: String, url: String, value: String) {
        self.created_at = created_at
        self.icon_url = icon_url
        self.id = id
        self.updated_at = updated_at
        self.url = url
        self.value = value
    }
    
    
    var created_at : String
    var icon_url : String
    var id : String
    var updated_at : String
    var url : String
    var value : String
     
}


