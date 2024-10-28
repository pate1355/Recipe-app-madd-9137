//
//  RecipeViewModal.swift
//  Recipe_App
//
//  Created by Rikin K Patel on 2024-10-28.
//

import SwiftUI

struct RecipeViewModal{
    var recipes: [Recipe] = []
    var filterText: String = ""
    
    func filteredRecipes() -> [Recipe] {
        if filterText.isEmpty {
            return recipes
        } else {
            return recipes.filter{ $0.title.contains(filterText) || $0.ingredients.joined().contains(filterText)}
        }
    }
    
    //add recipe
    mutating func addRecipe(_ recipe: Recipe){
        recipes.append(recipe)
    }
    
    //delete recipe
    mutating func deleteRecipe(at offsets: IndexSet){
        recipes.remove(atOffsets: offsets)
    }
}
