//
//  ContentView.swift
//  Recipe_list
//
//  Created by M. A. Alim Mukul on 24.08.22.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var model:RecipeModel
    
    var body: some View {
        
        NavigationView {
            
            VStack(alignment: .leading) {
                
                Text("All Recipe")
                    .bold()
                    .padding(.top, 40)
                    .font(.largeTitle)
                
                ScrollView {
                    
                    LazyVStack(alignment: .leading) {
                        
                        ForEach(model.recipes) {
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
                                        .foregroundColor(.black)
                                        .bold()
                                }
                            })
                        }
                        //            .navigationBarTitle("All Recipes")
                        .navigationBarHidden(true)
                    }
                }
            }
            .padding(.leading)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(RecipeModel())
    }
}
