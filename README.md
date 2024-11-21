# Recipe-app-madd-9137

# SwiftRecipe

SwiftRecipe is a simple recipe management app built with SwiftUI. This app allows users to view, add, edit, and delete recipes. Each recipe includes details such as a title, description, ingredients, and steps. The app demonstrates fundamental concepts of SwiftUI and Swift, including data handling, navigation, and filtering.

## Features

- **List of Recipes**: Displays a list of all recipes with titles and short descriptions.
- **Recipe Detail View**: Shows full details of a selected recipe, including ingredients and steps.
- **Add New Recipe**: Users can add new recipes, specifying the title, description, ingredients, and steps.
- **Edit and Delete Recipes**: Allows users to modify or delete recipes from the list.
- **Filter Recipes**: Users can filter recipes by keywords in titles or ingredients dynamically as they type.

## Project Structure

- **Models**

  - `Recipe`: A struct defining the recipe model with `title`, `description`, `ingredients`, and `steps` properties.

- **ViewModels**

  - `RecipeViewModel`: A struct that manages the list of recipes and provides methods for adding, editing, deleting, and filtering recipes.

- **Views**
  - `ContentView`: The main view, hosting the `RecipeListView` with navigation.
  - `RecipeListView`: Displays the list of all recipes, a filter bar, and a button to add new recipes.
  - `RecipeDetailView`: Shows the details of a selected recipe, including a scrollable view for larger content.
  - `AddRecipeView`: A form for adding a new recipe with fields for title, description, ingredients, and steps.

## Requirements

- **Swift** 5.0 or higher
- **iOS** 14.0 or higher
- **Xcode** 12.0 or higher

## Installation

1. Clone the repository to your local machine:
   ```bash
   git clone https://github.com/pate1355/Recipe-app-madd-9137.git
   ```
