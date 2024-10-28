//
//  AddRecipeView.swift
//  Recipe_App
//
//  Created by Rikin K Patel on 2024-10-28.
//

import SwiftUI

struct AddRecipeView: View {
    
    @Binding var viewModel: RecipeViewModal
       @Environment(\.presentationMode) var presentationMode
       
       @State private var title = ""
       @State private var description = ""
       @State private var ingredientsText = ""
       @State private var stepsText = ""

    
    var body: some View {
        NavigationView{
            Form{
                
                Section(header: Text("Recipe Details")){
                    TextField("Title", text: $title)
                    TextField("Description", text: $description)
                }
                
                Section(header: Text("Ingredients")){
                    TextField("Enter ingredients separated by commas", text: $ingredientsText)
                }
                
                Section(header: Text("Steps")){
                    TextField("Enter steps separated by commas", text: $stepsText)
                }
            }
            .navigationTitle("Add Recipe")
            .toolbar{
                ToolbarItem(placement: .confirmationAction){
                    Button("Save"){
                        let ingredients = ingredientsText.split(separator: ",").map{$0.trimmingCharacters(in: .whitespaces)}
                        let steps = stepsText.split(separator: ",").map { $0.trimmingCharacters(in: .whitespaces) }
                                               let newRecipe = Recipe(title: title, description: description, ingredients: ingredients, steps: steps)
                                               viewModel.addRecipe(newRecipe)
                                               presentationMode.wrappedValue.dismiss()
                    }
                }
                ToolbarItem(placement: .cancellationAction){
                    Button("Cancel"){
                        presentationMode.wrappedValue.dismiss()
                    }
                }
            }
        }
    }
}
