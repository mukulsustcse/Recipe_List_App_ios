//
//  RecipeDetailView.swift
//  Recipe_list
//
//  Created by M. A. Alim Mukul on 25.08.22.
//

import SwiftUI

struct RecipeDetailView: View {
    
    var recipe:Recipe
    @State var selectedServingSize = 2
    
    var body: some View {
        
        ScrollView {
            
            VStack(alignment: .leading) {
                // MARK: Recipe Image
                Image(recipe.image)
                    .resizable()
                    .scaledToFill()
                
                // MARK: Recipe title
                Text(recipe.name)
                    .bold()
                    .padding(.top, 20)
                    .padding(.leading)
                    .font(.largeTitle)
                
                // MARK: Serving size Picker
                VStack(alignment: .leading) {
                    
                    Text("Select your serving size (for each person)")
                    
                    Picker("", selection: $selectedServingSize) {
                        
                        Text("2").tag(2)
                        Text("4").tag(4)
                        Text("6").tag(6)
                        Text("8").tag(8)
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .frame(width: 160)
                }
                .padding()
                
                // MARK: Ingredients
                VStack(alignment: .leading) {
                    Text("Ingredients")
                        .font(.headline)
                        .padding(.bottom, 5.0)
                    
                    ForEach(recipe.ingredients) {
                        item in
                        
                        Text("• " + RecipeModel.getPortion(ingredient: item, recipeServings: recipe.servings, targetServings: selectedServingSize) + item.name)
                            .padding(.bottom, 0.2)
                    }
                }
                .padding(.horizontal)
                
                // MARK: Divider
                Divider()
                    .padding(5.0)
                
                
                // MARK: Directions
                VStack(alignment: .leading) {
                    Text("Directions")
                        .font(.headline)
                        .padding(.vertical, 5.0)
                        
                    ForEach(0..<recipe.directions.count, id: \.self) {
                        index in
                        
                        Text(String(index+1) + ". " + recipe.directions[index])
                            .padding(.bottom, 5.0)
                            
                    }
                }
                .padding(.horizontal)
            }
            
            
        }
//        .navigationBarTitle(recipe.name)
        
        //Text(recipe.name)
    }
}

struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        
        // create a dummy recipe and pass it into the details view so that we can see a preview
        
        let model = RecipeModel()
        
        RecipeDetailView(recipe:  model.recipes[0])
    }
}
