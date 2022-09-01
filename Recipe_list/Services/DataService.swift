//
//  DataService.swift
//  Recipe_list
//
//  Created by M. A. Alim Mukul on 24.08.22.
//

import Foundation

class DataService {
    
    static func getLocalData() -> [Recipe] {
        
        // Parsed the local json file
        
        // get a url path to the json file
        let pathString = Bundle.main.path(forResource: "recipes", ofType: "json")
        
        // check if pathstring is not nil, otherwise
        
        guard pathString != nil else {
            return [Recipe]()
        }
        
        // create a url object
        let url = URL(fileURLWithPath: pathString!)
        
        do {
            // create a data object
            
            let data = try Data(contentsOf: url)
            
            let decoder = JSONDecoder()
            
            do {
                let recipeData = try decoder.decode([Recipe].self, from: data)
                
                for r in recipeData {
                    
                    r.id = UUID()
                    
                    
                    // ADD unique IDs to recipe ingredients
                    for i in r.ingredients {
                        i.id = UUID()
                    }
                }
                
                return recipeData
                
            } catch  {
                print(error)
            }
        }
        catch {
            print(error)
        }
        
        // decode the data with json decoder
        
        // add the unique ids
        
        // return the recipes
        
        return [Recipe]()
    }
}
