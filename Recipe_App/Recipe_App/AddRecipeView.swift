//
//  AddRecipeView.swift
//  Recipe_App
//
//  Created by Rikin K Patel on 2024-10-28.
//

import PhotosUI
import SwiftUI

struct AddRecipeView: View {
    @Binding var viewModel: RecipeViewModal
    @Environment(\.presentationMode) var presentationMode

    @State private var title = ""
    @State private var description = ""
    @State private var ingredientsText = ""
    @State private var stepsText = ""
    @State private var selectedImageData: Data? = nil
    @State private var selectedImageItem: PhotosPickerItem? = nil
    @State private var showAlert = false

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Recipe Details")) {
                    TextField("Title", text: $title)
                    TextField("Description", text: $description)

                    // Display selected image if available
                    if let imageData = selectedImageData, let uiImage = UIImage(data: imageData) {
                        Image(uiImage: uiImage)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(height: 200)
                            .cornerRadius(8)
                    }
//                    else {
//                        Image("placeholder") // Default image from assets
//                            .resizable()
//                            .scaledToFit()
//                            .frame(height: 200)
//                            .cornerRadius(10)
//                    }

                    // PhotosPicker for iOS 16+ to select or take a photo
                    PhotosPicker(
                        selection: $selectedImageItem,
                        matching: .images,
                        photoLibrary: .shared()) {
                            Text("Select Image")
                                .foregroundColor(.blue)
                        }
                        .onChange(of: selectedImageItem) { newItem in
                            Task {
                                if let data = try? await newItem?.loadTransferable(type: Data.self) {
                                    selectedImageData = data
                                }
                            }
                        }
                }

                Section(header: Text("Ingredients")) {
                    TextField("Enter ingredients separated by commas", text: $ingredientsText)
                }

                Section(header: Text("Steps")) {
                    TextField("Enter steps separated by commas", text: $stepsText)
                }
            }
            .navigationTitle("Add Recipe")
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        if title.isEmpty || description.isEmpty || ingredientsText.isEmpty || stepsText.isEmpty
                            || selectedImageData == nil {
                            showAlert = true
                        } else {
                            let ingredients = ingredientsText.split(separator: ",").map { $0.trimmingCharacters(in: .whitespaces) }
                            let steps = stepsText.split(separator: ",").map { $0.trimmingCharacters(in: .whitespaces) }
                            let newRecipe = Recipe(title: title, description: description, ingredients: ingredients, steps: steps, imgAlt: "", imageData: selectedImageData)
                            viewModel.addRecipe(newRecipe)
                            presentationMode.wrappedValue.dismiss()
                        }
                    }
                    .alert(isPresented: $showAlert) {
                        Alert(title: Text("Fill out Empty Field"), message: Text("All fields are required to save a recipe."), dismissButton: .default(Text("OK")))
                    }
                }
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        presentationMode.wrappedValue.dismiss()
                    }
                }
            }
        }
    }
}
