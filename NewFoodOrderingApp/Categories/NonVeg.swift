//
//  NonVeg.swift
//  NewFoodOrderingApp
//
//  Created by Veerapathiran P on 05/07/22.
//

import Foundation



class NonVeg: AllFoods {
    
    
    var typeOfNonVegetarians: String = ""           // Defender, Converter, The Need Some Chicken Lovin’, Specific Meat Eater, Non-Veg                                                                               Decision Maker, Eggetarian
    var types : String = ""                         // Chicken or Mutton or Fish
    
    
    
    
    //MARK: override method from AllFoods class
    override func extraNeed() {
        
        print(" ** Enter the number of the option given below ** \n")
        print(" 1.If you want more mayonnaise and Mint Chutney \n")
        print(" 2.If you don't want this \n")
        let new = readLine()
        if Int(new!) == 1 || Int(new!) == 2 {
            print(" **  Thank you for choosing  ** \n")
        }
        else {
            print(" == Enter a valid number == ")
        }
    }
}



class Chicken: NonVeg {
    
    var soup: String = ""                           // Manchow soup, Hot & sour soup
    var starter: String = ""                        // Indian, Chinese
    var mainCourse: String = ""                     // Indian, Chinese
    var biriyani: String = ""                       // Hyderabad, Chettinad
    
    override var description: String{
        return "\n ID: \(id)\n FoodName: \(foodName)\n AvailableQuantity: \(availableQuantity)\n Price: \(price)\n Description: \(details)\n Type: \(type)\n NonVegType: \(types)\n Dish: \(mainCourse)\n "
    }
}


// Indianstarter = Chicken Manchurian Dry, Chicken Chilly Dry, Chicken 65, Chicken lollypop
// chineseStarter = Chicken Tikka, Malai kabab, Hariyali, Lasooni kabab, Seekh kabab, Resmi kabab, Bhanu kabab, Tandoory chicken, Mutton Seekh kabab
// chineseMainCourse = Chicken Fried Rice, Schezwan rice, Hakka noodles, Schezwan noodles
// hyderabadBiriyani = Egg, Mutton, Chicken
// chettinadBiriyani = Egg, Mutton, Chicken
// indianMainCourse = Butter Chicken, Lasooni masala, Tikka masala, Kadai, Handi, Masala, Chicken Cury, Mutton masala, Mutton cury, Mutton sukha, Mutton handi.



