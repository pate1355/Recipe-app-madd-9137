//
//  RecipeViewModal.swift
//  Recipe_App
//
//  Created by Rikin K Patel on 2024-10-28.
//

import SwiftUI

struct RecipeViewModal {
    var recipes: [Recipe] = [Recipe(
        title: "Dal Makhani",
        description: "A rich and creamy lentil dish.",
        ingredients: ["Black lentils", "Kidney beans", "Butter", "Cream", "Tomato"],
        steps: ["Soak lentils and beans overnight.", "Cook in a pressure cooker.", "Add spices, butter, and cream.", "Simmer until thick."],
        imgAlt: "dal_makhani",
        imageData: nil
        
    ),
    Recipe(
        title: "Paneer Tikka",
        description: "Marinated paneer cubes grilled to perfection.",
        ingredients: ["Paneer", "Yogurt", "Spices", "Capsicum"],
        steps: ["Marinate paneer", "Skewer and grill", "Serve with chutney"],
        imgAlt: "paneer_tikka_masala",
        imageData: nil
        
    ),
    Recipe(
        title: "Masala Dosa",
        description: "A crispy rice pancake filled with spiced potatoes.",
        ingredients: ["Rice", "Lentils", "Potato", "Spices"],
        steps: ["Soak rice and lentils", "Grind to batter", "Prepare potato filling", "Cook dosa and add filling"],
        imgAlt: "masala_dosa",
        imageData: nil
    ),
    Recipe(
        title: "Aloo Gobi",
        description: "A simple vegetarian dish made with potatoes and cauliflower.",
        ingredients: ["Potato", "Cauliflower", "Spices", "Tomato"],
        steps: ["Chop potatoes and cauliflower", "Cook with spices", "Simmer until tender"],
        imgAlt: "aloo_gobi",
        imageData: nil
    ),
    Recipe(
        title: "Samosa",
        description: "Deep-fried pastry filled with spiced potatoes.",
        ingredients: ["Flour", "Potato", "Peas", "Spices"],
        steps: ["Prepare dough", "Cook filling", "Form samosas", "Deep fry"],
        imgAlt: "samosas",
        imageData: nil
    ),
    Recipe(
        title: "Chole Bhature",
        description: "Spicy chickpeas served with fried bread.",
        ingredients: ["Chickpeas", "Flour", "Spices", "Onion", "Tomato"],
        steps: ["Cook chickpeas with spices", "Make dough and roll into circles", "Deep fry bread"],
        imgAlt: "chole",
        imageData: nil
    ),
    Recipe(
        title: "Palak Paneer",
        description: "Spinach curry with paneer cubes.",
        ingredients: ["Spinach", "Paneer", "Onion", "Tomato", "Spices"],
        steps: ["Cook spinach", "Blend to a puree", "Cook with paneer and spices"],
        imgAlt: "palak_paneer",
        imageData: nil
    ), Recipe(
        title: "Gulab Jamun",
        description: "Sweet milk dumplings soaked in rose-flavored syrup.",
        ingredients: ["Milk powder", "Flour", "Sugar", "Rose water"],
        steps: ["Make dough", "Form balls", "Fry until golden", "Soak in syrup"],
        imgAlt: "gulab_jamun",
        imageData: nil
    )]
    var filterText: String = ""

//    init() {
//            loadDefaultRecipes()
//        }

//    mutating func loadDefaultRecipes() {
//        recipes = [
//            Recipe(
//                title: "Dal Makhani",
//                description: "A rich and creamy lentil dish.",
//                ingredients: ["Black lentils", "Kidney beans", "Butter", "Cream", "Tomato"],
//                steps: ["Soak lentils and beans overnight.", "Cook in a pressure cooker.", "Add spices, butter, and cream.", "Simmer until thick."],
//                imgAlt: "dal_makhani"
//            ),
//            Recipe(
//                title: "Paneer Tikka",
//                description: "Marinated paneer cubes grilled to perfection.",
//                ingredients: ["Paneer", "Yogurt", "Spices", "Capsicum"],
//                steps: ["Marinate paneer", "Skewer and grill", "Serve with chutney"],
//                imgAlt: "paneer_tikka_masala"
//            ),
//            Recipe(
//                title: "Masala Dosa",
//                description: "A crispy rice pancake filled with spiced potatoes.",
//                ingredients: ["Rice", "Lentils", "Potato", "Spices"],
//                steps: ["Soak rice and lentils", "Grind to batter", "Prepare potato filling", "Cook dosa and add filling"],
//                imgAlt: "masala_dosa"
//            ),
//            Recipe(
//                title: "Aloo Gobi",
//                description: "A simple vegetarian dish made with potatoes and cauliflower.",
//                ingredients: ["Potato", "Cauliflower", "Spices", "Tomato"],
//                steps: ["Chop potatoes and cauliflower", "Cook with spices", "Simmer until tender"],
//                imgAlt: "aloo_gobi"
//            ),
//            Recipe(
//                title: "Samosa",
//                description: "Deep-fried pastry filled with spiced potatoes.",
//                ingredients: ["Flour", "Potato", "Peas", "Spices"],
//                steps: ["Prepare dough", "Cook filling", "Form samosas", "Deep fry"],
//                imgAlt: "samosas"
//            ),
//            Recipe(
//                title: "Chole Bhature",
//                description: "Spicy chickpeas served with fried bread.",
//                ingredients: ["Chickpeas", "Flour", "Spices", "Onion", "Tomato"],
//                steps: ["Cook chickpeas with spices", "Make dough and roll into circles", "Deep fry bread"],
//                imgAlt: "chole"
//            ),
//            Recipe(
//                title: "Palak Paneer",
//                description: "Spinach curry with paneer cubes.",
//                ingredients: ["Spinach", "Paneer", "Onion", "Tomato", "Spices"],
//                steps: ["Cook spinach", "Blend to a puree", "Cook with paneer and spices"],
//                imgAlt: "palak_paneer"
//            ),
    ////                Recipe(
    ////                    title: "Gulab Jamun",
    ////                    description: "Sweet milk dumplings soaked in rose-flavored syrup.",
    ////                    ingredients: ["Milk powder", "Flour", "Sugar", "Rose water"],
    ////                    steps: ["Make dough", "Form balls", "Fry until golden", "Soak in syrup"],
    ////                    imgAlt: "gulab_jamun"
    ////                )
//        ]
//    }

    func filteredRecipes() -> [Recipe] {
        if filterText.isEmpty {
            return recipes
        } else {
            return recipes.filter { $0.title.lowercased().contains(filterText.lowercased())
//                    || $0.description.contains(filterText)
            }
        }
    }

    // add recipe
    mutating func addRecipe(_ recipe: Recipe) {
        recipes.insert(recipe, at: 0)
    }

    // delete recipe
    mutating func deleteRecipe(at offsets: IndexSet) {
        recipes.remove(atOffsets: offsets)
    }
}



