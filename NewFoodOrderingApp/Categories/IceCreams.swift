//
//  IceCreams.swift
//  NewFoodOrderingApp
//
//  Created by Veerapathiran P on 05/07/22.
//

import Foundation




class IceCreams: AllFoods {
    
    var typeOfIceCreams : String = ""                   // Kulfi or Sherbet or Sorbet or Frozen Yogurt or Soft Serve or Philadelphia Ice Cream
    var flavors: String = ""                            // Vennila, Matcha, Chocolate, Coconut, StrawBerry, Banana, Mango, Oreo.
    
}


class Vennila: IceCreams {
    
    var specialCream: String = ""
    var specialFalooda: String = ""
    var hotJizzle: String = ""
    var cocoSpecial: String = ""
    
    
    override var description: String {
        return "\n ID: \(id)\n FoodName: \(foodName)\n AvailableQuantity: \(availableQuantity)\n Price: \(price)\n Description: \(details)\n Type: \(type)\n Flavor: \(flavors)\n Type Of IceCream: \(typeOfIceCreams)\n"
    }
}


// Traditional ones include cream (malai), rose, mango, cardamom (elaichi), saffron (kesar or zafran), and pistachio. Newer flavours include apple, orange, strawberry, peanut, and avocado.
// var kulfiFlavours : String = ""                       // malai, rose, mango, cardamom, saffron, and pistachio, apple, orange, strawberry, peanut, and avocado.
