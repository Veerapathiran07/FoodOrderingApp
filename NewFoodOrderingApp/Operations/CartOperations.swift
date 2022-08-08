//
//  CartOperations.swift
//  NewFoodOrderingApp
//
//  Created by Veerapathiran P on 05/08/22.
//

import Foundation


class CartOperations {
    
    let cartItems = CartItems()
    
    
    //MARK: Add Operation inputs
    
    @discardableResult func addToCart() -> AllFoods {
        
        var food = AllFoods()
        
        print(" ***  Enter the id of the food you want add to your cart  ***\n")
        if let add = readLine() {
            if let id = Int(add) {
                if id <= list.count {
                    food  = FoodLoading().getFoodAllFoods(id: id)
                    print(" *** Please enter the quantity ***\n")
                    if let quantity = readLine() {
                        if let number = Int(quantity) {
                            if number <= food.availableQuantity {
                                cartItems.add(number: number, food: food )
                            }
                            if (food.availableQuantity <= 0) {
                                food.availableQuantity = 0
                                print(" ** Not much quantity available...Available Quantity => \(food.availableQuantity) ** \n")
                                UserOperation.operation.showCart()
                            }
                            else {
                                print(" ** Not much quantity available...Available Quantity => \(food.availableQuantity) ** \n")
                                addToCart()
                            }
                        }
                        else {
                            print(" ==  Please enter the valid quantity for your food  == ")
                        }
                    }
                }
                else {
                    print(" ==  Please enter the shown id of the food  == \n")
                    addToCart()
                }
            }
            else {
                print(" ==  Please enter the valid id of the food  == \n")
                addToCart()
            }
        }
        return food
    }
    
    
    //MARK: Delete Operation input
    
    func del() {
        var deleteCount = 0
        
        print("\(Cart)")
        let isContinue: Bool = true
        repeat {
            print("***  Enter the id of the food you want to delete from the Cart  ***\n")
            if let delete = readLine() {
                if  let id = Int(delete) {
                    if let Index = Cart.firstIndex(where: {$0.id == id}) {
                        let food = FoodLoading().getFoodAllFoods(id: id)
                        let cartFood = cartItems.getFoodFromCart(id: id)
                        food.availableQuantity = (food.availableQuantity + cartFood.quantity!)
                        cartItems.delete(Index: Index)
                    }
                    else if deleteCount < 2 {
                        deleteCount = deleteCount + 1
                        print(" == Please enter shown ID's only == \n")
                    }
                    else {
                        print(" == Please enter shown ID's only == \n")
                        UserOperation.operation.modify()
                    }
                }
                else if deleteCount < 2 {
                    deleteCount = deleteCount + 1
                    print(" == Invalid Input -> Enter valid Id's == \n")
                }
                else {
                    print(" == You entered wrong ID many times == \n")
                    UserOperation.operation.modify()
                }
            }
        } while isContinue
    }
    
    
    //MARK: ModifyQuantity Operation input
    
    func mod() {
        
        var count = 0
        
        print("\(Cart)")
        let isContinue: Bool = true
        repeat {
            print(" ***  Enter the id of the food you want to modify  ***\n")
            if let add = readLine() {
                if let id = Int(add) {
                    if id <= list.count {
                        let food  = FoodLoading().getFoodAllFoods(id: id)
                        let cartFood = CartItems().getFoodFromCart(id: food.id)
                        if cartFood.id == food.id {
                            print(" *** Please enter the quantity ***")
                            if let quantity = readLine() {
                                if let number = Int(quantity) {
                                    food.availableQuantity = food.availableQuantity + cartFood.quantity!
                                    let oldPrice = cartFood.price! / cartFood.quantity!
                                    if number <= food.availableQuantity {
                                        cartItems.modifyQuantity(number: number, oldPrice: oldPrice, food: food, cartFood: cartFood)
                                    }
                                    if (food.availableQuantity <= 0) {
                                        food.availableQuantity = 0
                                        print(" ** Not much quantity available...Available Quantity => \(food.availableQuantity) ** \n")
                                        UserOperation.operation.modify()
                                    }
                                    else {
                                        print(" ** Not much quantity available...Available Quantity => \(food.availableQuantity) ** \n")
                                        mod()
                                    }
                                }
                                else {
                                    print(" == Please enter valid quantity == \n")
                                    mod()
                                }
                            }
                        }
                        else if count < 2 {
                            count = count + 1
                            print(" == Please enter shown ID's only == \n")
                        }
                        else {
                            print(" == You entered the wrong ID many times == \n")
                            UserOperation.operation.modify()
                        }
                    }
                }
                else if count < 2 {
                    count = count + 1
                    print(" == Please enter shown ID's only == \n")
                }
                else {
                    print(" == You entered the wrong ID many times == \n")
                    UserOperation.operation.modify()
                }
            }
        } while isContinue
    }
    
}
