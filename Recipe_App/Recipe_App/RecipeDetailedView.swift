//
//  RecipeDetailedView.swift
//  Recipe_App
//
//  Created by Rikin K Patel on 2024-10-28.
//

import SwiftUI

struct RecipeDetailedView: View {
    @State private var isEditing = false
    @State var recipe: Recipe

    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .leading) {
                
                //Image
                VStack(alignment: .leading) {
                    // Recipe Image with Animation
                    if recipe.imgAlt.isEmpty && recipe.imageData == nil {
                        HStack(alignment: .center) {
                            Image("placeholder")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(height: 300)
                                .frame(maxWidth: .infinity)
                                .cornerRadius(15)
                                .shadow(color: .black.opacity(0.2), radius: 10, x: 0, y: 5)
                                .padding(.bottom, 20)
                                .transition(.scale)
                        }
                        .padding(.horizontal)
                    } else if recipe.imgAlt.isEmpty, let imageData = recipe.imageData, let uiImage = UIImage(data: imageData) {
                        HStack(alignment: .center) {
                            Image(uiImage: uiImage)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(height: 300)
                                .frame(maxWidth: .infinity)
                                .cornerRadius(15)
                                .shadow(color: .black.opacity(0.2), radius: 10, x: 0, y: 5)
                                .padding(.bottom, 20)
                                .transition(.opacity)
                        }
                        .padding(.horizontal)
                    } else {
                        HStack(alignment: .center) {
                            Image(recipe.imgAlt)
                                .resizable()
//                                .aspectRatio(contentMode: .fill)
                                .frame(height: 300)
                                .frame(maxWidth: .infinity)
                                .cornerRadius(15)
                                .shadow(color: .black.opacity(0.2), radius: 10, x: 0, y: 5)
                                .padding(.bottom, 20)
                                .transition(.slide)
                        }
                        .padding(.horizontal)
                    }
                }

                VStack(alignment: .leading, spacing: 15) {
                    // Title with custom color
                    Text("Title")
                        .font(.headline)
                        .foregroundColor(.secondary)
                       

                    Text(recipe.title)
                        .font(.system(size: 32, weight: .bold))
                        .foregroundColor(.primary)
                    
                       

                    Divider()

                    // Description with background gradient
                    VStack(alignment: .leading, spacing: 15) {
                        Text("Description")
                            .font(.headline)
                            .foregroundColor(.secondary)
                        

                        Text(recipe.description)
                            .font(.body)
                            .foregroundColor(.primary)
                            .padding()
                            .background(
                                LinearGradient(gradient: Gradient(colors: [Color.blue.opacity(0.1), Color.green.opacity(0.1)]), startPoint: .topLeading, endPoint: .bottomTrailing)
                            )
                            .cornerRadius(10)
                            .shadow(radius: 5)
                        
                    }

                    Divider()

                    // Ingredients Section with Scroll Animation
                    VStack(alignment: .leading, spacing: 15) {
                        Text("Ingredients")
                            .font(.headline)
                            .foregroundColor(.secondary)

                                                ScrollView(.horizontal, showsIndicators: false) {
                                                    HStack(spacing: 10) {
                                                        ForEach(recipe.ingredients, id: \.self) { ingredient in
                                                            Text(ingredient)
                                                                .font(.subheadline)
                                                                .padding(8)
                                                                .background(Color.purple.opacity(0.1))
                                                                .cornerRadius(8)
                                                                .shadow(color: .purple.opacity(0.3), radius: 3, x: 0, y: 2)
                                                                .transition(.scale)
                                                        }
                                                    }
                                                }
                    }

                    Divider()

                    // Steps Section with Animated Text Entry
                    VStack(alignment: .leading, spacing: 15) {
                        Text("Steps")
                            .font(.headline)
                            .foregroundColor(.secondary)

                                                VStack(alignment: .leading, spacing: 10) {
                                                    ForEach(Array(recipe.steps.enumerated()), id: \.offset) { index, step in
                                                        Text("Step \(index + 1): \(step)")
                                                            .font(.body)
                                                            .padding(8)
                                                            .background(Color.orange.opacity(0.1))
                                                            .cornerRadius(8)
                                                            .shadow(color: .orange.opacity(0.3), radius: 3, x: 0, y: 2)
                                                            .transition(.slide)
                                                    }
                                                }
                    }
                }
                .padding(.horizontal)
            }
        }
        .background(
            LinearGradient(gradient: Gradient(colors: [.white, .blue.opacity(0.1)]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
        )
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: {
                    withAnimation {
                        isEditing.toggle()
                    }
                }) {
                    Text("Edit")
                        .font(.system(size: 18, weight: .medium))
                }
            }
        }
        .sheet(isPresented: $isEditing) {
            EditRecipeView(recipe: $recipe)
        }
    }
}

struct RecipeDetailedView_Preview: PreviewProvider {
    static var previews: some View {
        // Create an instance of RecipeViewModel with sample data
        let viewModel = RecipeViewModal()

        // Pass the viewModel as a constant binding using `.constant(viewModel)`
        return NavigationView {
            ListOfRecipes(viewModel: .constant(viewModel))
        }
    }
}
