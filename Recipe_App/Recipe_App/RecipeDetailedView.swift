//
//  RecipeDetailedView.swift
//  Recipe_App
//
//  Created by Rikin K Patel on 2024-10-28.
//

import SwiftUI

struct RecipeDetailedView: View {
    
    var recipe: Recipe
    
    var body: some View {
        ScrollView{
            VStack(alignment: .leading, spacing: 16){
                Text(recipe.title)
                    .font(.largeTitle)
                    .padding(.bottom,10)
                Text("Description")
                    .font(.headline)
                Text(recipe.description)
                
                Text("Ingredients")
                    .font(.headline)
                ForEach(recipe.ingredients, id: \.self){ ingredient in
                    Text("- \(ingredient)")
                }
                
                Text("Steps")
                    .font(.headline)
                ForEach(recipe.steps, id: \.self){ step in
                    Text("\(step)")
                }
            }
            .padding()
        }
        .navigationTitle(recipe.title)
    }
}
