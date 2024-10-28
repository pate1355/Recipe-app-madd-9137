//
//  Recipe.swift
//  Recipe_App
//
//  Created by Rikin K Patel on 2024-10-28.
//

import Foundation

struct Recipe: Identifiable{
    var id = UUID() 
    var title: String
    var description: String
    var ingredients: [String]
    var steps: [String]
}
