//
//  AllFoods.swift
//  NewFoodOrderingApp
//
//  Created by Veerapathiran P on 05/07/22.
//

import Foundation




// MARK: FOODS

class AllFoods: CustomStringConvertible {
    
    var id: Int = 0
    var foodName : String = ""
    var availableQuantity : Int = 0
    var price : Int = 0
    var details : String = ""
    var type : String = ""
    
    
    var description: String {
        return "\n ID: \(id)\n FoodName: \(foodName)\n AvailableQuantity: \(availableQuantity)\n Price: \(price)\n Description: \(details)\n"
    }
    
    
    func extraNeed() {
        //        print(" If anything you need extra with your food \n")
    }
    
    
    // MARK: OfferChecking with price
    func offerCheck( newPrice: Int) {
        
        if newPrice >= 500 {
            print(" Offer Applied - less Rs.50 \n")
            let newPrice = newPrice - 50
            print(" Total Price - Rs.\(newPrice)\n ")
        }
    }
}
