import SwiftUI

struct EditRecipeData {
    var title: String
    var description: String
    var ingredients: [String]
    var steps: [String]
}

struct EditRecipeView: View {
    @Binding var recipe: Recipe
    @Environment(\.presentationMode) var presentationMode

    @State private var editData: EditRecipeData
    @State private var showEmptyFieldAlert = false  // State for showing an alert

    init(recipe: Binding<Recipe>) {
        self._recipe = recipe
        _editData = State(initialValue: EditRecipeData(
            title: recipe.wrappedValue.title,
            description: recipe.wrappedValue.description,
            ingredients: recipe.wrappedValue.ingredients,
            steps: recipe.wrappedValue.steps
        ))
    }

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Title")) {
                    TextField("Recipe Title", text: $editData.title)
                }

                Section(header: Text("Description")) {
                    TextField("Description", text: $editData.description)
                }

                Section(header: Text("Ingredients")) {
                    ForEach(editData.ingredients.indices, id: \.self) { index in
                        HStack {
                            TextField("Ingredient", text: $editData.ingredients[index])
                            Spacer()
                            Button(action: {
                                editData.ingredients.remove(at: index)
                            }) {
                                Image(systemName: "trash")
                                    .foregroundColor(.red)
                            }
                        }
                    }
                    Button("Add Ingredient") {
                        if !editData.ingredients.contains("") {
                            editData.ingredients.append("")
                        }
                    }
                }

                Section(header: Text("Steps")) {
                    ForEach(editData.steps.indices, id: \.self) { index in
                        HStack {
                            TextField("Step", text: $editData.steps[index])
                            Spacer()
                            Button(action: {
                                editData.steps.remove(at: index)
                            }) {
                                Image(systemName: "trash")
                                    .foregroundColor(.red)
                            }
                        }
                    }
                    Button("Add Step") {
                        if !editData.steps.contains("") {
                            editData.steps.append("")
                        }
                    }
                }
            }
            .navigationTitle("Edit Recipe")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Save") {
                        if isFormValid() {
                            recipe.title = editData.title
                            recipe.description = editData.description
                            recipe.ingredients = editData.ingredients
                            recipe.steps = editData.steps
                            presentationMode.wrappedValue.dismiss()
                        } else {
                            showEmptyFieldAlert = true
                        }
                    }
                }
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        presentationMode.wrappedValue.dismiss()
                    }
                }
            }
            .alert(isPresented: $showEmptyFieldAlert) {
                Alert(
                    title: Text("Incomplete Fields"),
                    message: Text("Please ensure all fields are filled in before saving."),
                    dismissButton: .default(Text("OK"))
                )
            }
        }
    }

    // Helper function to validate form
    private func isFormValid() -> Bool {
        // Check if title, description, and all ingredient and step fields are non-empty
        return !editData.title.isEmpty &&
               !editData.description.isEmpty &&
               !editData.ingredients.contains("") &&
               !editData.steps.contains("")
    }
}

