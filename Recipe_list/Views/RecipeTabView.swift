//
//  RecipeTabView.swift
//  Recipe_list
//
//  Created by M. A. Alim Mukul on 29.08.22.
//

import SwiftUI

struct RecipeTabView: View {
    var body: some View {
        
        
        TabView {
            
            RecipeFeaturedView()
            
                .tabItem {
                VStack {
                    Image(systemName: "star.fill")
                    Text("Featured")
                }
            }
            
            ContentView()
                .tabItem {
                    VStack {
                        Image(systemName: "list.bullet")
                        Text("List")
                    }
                }
            
        }
        .environmentObject(RecipeModel())
    }
}

struct RecipeTabView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeTabView()
    }
}
