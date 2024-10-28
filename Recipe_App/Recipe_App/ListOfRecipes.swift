//
//  ListOfRecipes.swift
//  Recipe_App
//
//  Created by Rikin K Patel on 2024-10-28.
//

//import Foundation

import SwiftUI

struct ListOfRecipes: View {
    
    @Binding var viewModel: RecipeViewModal
    @State private var filterText: String = ""
    @State private var isAddingRecipe = false
    
    
    var body: some View{
        VStack{
            TextField("Search recipes...", text: $filterText)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
                .onChange(of: filterText){ newValue in
                    viewModel.filterText = newValue
                }
            
            List{
                ForEach(viewModel.filteredRecipes()){ recipe in
                    NavigationLink(destination: RecipeDetailedView(recipe: recipe)){
                        VStack(alignment: .leading){
                            Text(recipe.title)
                                .font(.headline)
                            Text(recipe.description)
                                .font(.subheadline)
                                .lineLimit(1)
                        }
                    }
                }
                .onDelete(perform: {offsets in
                    viewModel.deleteRecipe(at: offsets)
                })
            }
            .navigationTitle("SwiftRecipe")
            .toolbar{
                ToolbarItem(placement: .navigationBarTrailing){
                    Button(action: {isAddingRecipe.toggle()}){
                        Label("Add Recipe", systemImage: "plus")
                    }
                }
            }
            .sheet(isPresented: $isAddingRecipe){
                AddRecipeView(viewModel: $viewModel)
            }
        }
    }
}
