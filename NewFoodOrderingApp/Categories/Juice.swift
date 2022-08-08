//
//  Juice.swift
//  NewFoodOrderingApp
//
//  Created by Veerapathiran P on 05/07/22.
//

import Foundation



class Juice: AllFoods {
    
    
    var greenGroceries: String = ""            // Fruit or Vegetable or Berry
    var coffee: String = ""
    var fruitShake: String = ""
    var lassi: String = ""
    var sodaSyrups: String = ""
    var mocktails: String = ""
    var syrups: String = ""
    
    
    override var description: String {
        return "\n ID: \(id)\n FoodName: \(foodName)\n AvailableQuantity: \(availableQuantity)\n Price: \(price)\n Description: \(details)\n Type: \(type)\n GreenGroceries: \(greenGroceries)\n"
    }
    
    
    
    
    //MARK: override menthod from AllFoods class
    override func extraNeed() {
        
        print(" ** Enter the number of the option given below ** \n")
        print(" 1.If you want more IceCubes \n")
        print(" 2.If you don't want this \n")
        let new = readLine()
        if Int(new!) == 1 || Int(new!) == 2  {
            print(" **  Thank you for choosing  ** \n")
        }
        else {
            print(" Enter a valid number")
        }
    }
}




