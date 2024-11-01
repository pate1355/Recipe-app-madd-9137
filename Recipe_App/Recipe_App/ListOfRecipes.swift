import SwiftUI

struct ListOfRecipes: View {
    @Binding var viewModel: RecipeViewModal
    @State private var filterText: String = ""
    @State private var isAddingRecipe = false
    @State private var showDeleteAlert = false
    @State private var indexSetToDelete: IndexSet?
    @State private var recipeTitleToDelete: String = "" 

    var body: some View {
        VStack {
            TextField("Search recipes...", text: $filterText)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
                .onChange(of: filterText) { newValue in
                    viewModel.filterText = newValue
                }

            List {
                ForEach(viewModel.filteredRecipes()) { recipe in
                    NavigationLink(destination: RecipeDetailedView(recipe: recipe)) {
                        HStack(alignment: .center) {
                            if recipe.imgAlt.isEmpty && recipe.imageData == nil {
                                Image("placeholder")
                                    .resizable()
                                    .frame(width: 70, height: 70, alignment: .topLeading)
                                    .cornerRadius(10)
                                    
                            } else if recipe.imgAlt.isEmpty,
                                      let imageData = recipe.imageData,
                                      let uiImage = UIImage(data: imageData) {
                                Image(uiImage: uiImage)
                                    .resizable()
                                    .frame(width: 70, height: 70, alignment: .topLeading)
                                    .cornerRadius(10)
                                    
                            } else {
                                Image(recipe.imgAlt)
                                    .resizable()
                                    .frame(width: 80, height: 80, alignment: .topLeading)
                                    .cornerRadius(10)
                                    
                            }

                            VStack(alignment: .leading) {
                                Text(recipe.title)
                                    .font(.headline)
                                Text(recipe.description)
                                    .font(.subheadline)
                                    .lineLimit(1)
                            }
                            .padding(.horizontal)
                        }
                        .padding(5)
                        
                    }
                }
                .onDelete { offsets in
                    // Get the title of the recipe being deleted
                    if let index = offsets.first {
                        recipeTitleToDelete = viewModel.filteredRecipes()[index].title
                    }
                    indexSetToDelete = offsets
                    showDeleteAlert = true
                }
            }
            .navigationTitle("SwiftRecipe")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: { isAddingRecipe.toggle() }) {
                        Label("Add Recipe", systemImage: "plus")
                    }
                }
            }
            .sheet(isPresented: $isAddingRecipe) {
                AddRecipeView(viewModel: $viewModel)
            }
            .alert(isPresented: $showDeleteAlert) {
                Alert(
                    title: Text("Confirm Delete"),
                    message: Text("Are you sure you want to delete \"\(recipeTitleToDelete)\"?"),
                    primaryButton: .destructive(Text("Yes")) {
                        if let offsets = indexSetToDelete {
                            viewModel.deleteRecipe(at: offsets)
                        }
                    },
                    secondaryButton: .cancel(Text("No"))
                )
            }
        }
    }
}


struct ListOfRecipe_Preview: PreviewProvider {
    static var previews: some View {
        // Create an instance of RecipeViewModel with sample data
        let viewModel = RecipeViewModal()

        // Pass the viewModel as a constant binding using `.constant(viewModel)`
        return NavigationView {
            ListOfRecipes(viewModel: .constant(viewModel))
        }
    }
}
