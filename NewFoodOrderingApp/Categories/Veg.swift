//
//  Veg.swift
//  NewFoodOrderingApp
//
//  Created by Veerapathiran P on 05/07/22.
//

import Foundation



class Veg: AllFoods {
    
    
    var diet: String = ""                          //Lacto-ovo vegetarian or Lacto-vegetarian or Ovo-vegetarian or Flexitarian or Pescatarian                                               or Vegan
    var dosas: String = ""
    var ooothappams: String = ""
    var specialDosas: String = ""
    var noodles: String = ""
    var sandwich: String = ""
    var patties: String = ""
    
    
    override var description: String {
        return "\n ID: \(id)\n FoodName: \(foodName)\n AvailableQuantity: \(availableQuantity)\n Price: \(price)\n Description: \(details)\n Type: \(type)\n Diet: \(diet)\n"
    }
}
