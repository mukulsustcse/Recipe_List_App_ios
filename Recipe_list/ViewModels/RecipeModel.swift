//
//  RecipeModel.swift
//  Recipe_list
//
//  Created by M. A. Alim Mukul on 24.08.22.
//

import Foundation

class RecipeModel : ObservableObject {
    
    @Published var recipes = [Recipe]()
    
    init() {
        
        // create an instance of data service and get the data
        
//        let service = DataService()
//        self.recipes = service.getLocalData()
//
        // shortcut
        self.recipes = DataService.getLocalData()
    }
}
