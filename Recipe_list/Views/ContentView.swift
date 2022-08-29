//
//  ContentView.swift
//  Recipe_list
//
//  Created by M. A. Alim Mukul on 24.08.22.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var model = RecipeModel()
    
    var body: some View {
        
        NavigationView {
            List(model.recipes) {
                r in
                
                NavigationLink(destination: RecipeDetailView(recipe: r), label: {
                    
                    HStack(spacing: 20.0) {
                        
                        Image(r.image)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 60, height: 40, alignment: .center)
                            .clipped()
                            .cornerRadius(10)
                            
                        Text(r.name)
                    }
                    
                })
                
                
            }
            .navigationBarTitle("All Recipes")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
