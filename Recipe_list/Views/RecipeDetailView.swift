//
//  RecipeDetailView.swift
//  Recipe_list
//
//  Created by M. A. Alim Mukul on 25.08.22.
//

import SwiftUI

struct RecipeDetailView: View {
    
    var recipe:Recipe
    
    var body: some View {
        
        ScrollView {
            
            VStack(alignment: .leading) {
                // MARK: Recipe Image
                Image(recipe.image)
                    .resizable()
                    .scaledToFill()
                
                // MARK: Ingredients
                VStack(alignment: .leading) {
                    Text("Ingredients")
                        .font(.headline)
                        .padding(.bottom, 5.0)
                    
                    ForEach(recipe.ingredients, id: \.self) {
                        item in
                        
                        Text("• " + item)
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
        .navigationBarTitle(recipe.name)
        
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
