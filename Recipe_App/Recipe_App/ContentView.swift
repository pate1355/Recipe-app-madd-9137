//
//  ContentView.swift
//  Recipe_App
//
//  Created by Rikin K Patel on 2024-10-28.
//

import SwiftUI

struct ContentView: View {
    @State private var viewModel = RecipeViewModal()
    
    var body: some View {
        NavigationView {
            ListOfRecipes(viewModel: $viewModel)
        }
    }
}

