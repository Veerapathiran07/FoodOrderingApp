//
//  OrderHistoryOperation.swift
//  NewFoodOrderingApp
//
//  Created by Veerapathiran P on 05/08/22.
//

import Foundation


class OrderHistoryOperation {
    
    
    //MARK: Method for get id and return food for order history
    
    @discardableResult func addToHistory() -> AllFoods {
        
        var food = AllFoods()
        
        print(" ***  Enter the id of the food you want add to your cart  ***\n")
        if let add = readLine() {
            if let id = Int(add) {
                if id <= list.count {
                    food  = FoodLoading().getFoodAllFoods(id: id)
                    print("*** Please enter the quantity ***\n")
                    if let quantity = readLine() {
                        if let number = Int(quantity) {
                            if number <= food.availableQuantity {
                                OrderHistory().adding(number: number, food: food)
                            }
                            if (food.availableQuantity <= 0) {
                                food.availableQuantity = 0
                                print(" ** Not much quantity available...Available Quantity => \(food.availableQuantity) ** \n")
                                UserOperation.operation.edit()
                            }
                            else {
                                print(" ** Not much quantity available...Available Quantity => \(food.availableQuantity) ** \n")
                                addToHistory()
                            }
                        }
                        else {
                            print(" ==  Please enter the valid quantity for your food  == \n")
                            addToHistory()
                        }
                    }
                }
                else {
                    print(" ==  Please enter the shown id of the food  == \n")
                    addToHistory()
                }
            }
            else {
                print(" ==  Please enter the valid id of the food  == \n")
                addToHistory()
            }
        }
        return food
    }
    
    
    //MARK: Input for delete food from OrderHistory
    
    func deleteFromOrderHistory() {
        var deleteCount = 0
        
        print("\(OrderDetails)")
        let isContinue: Bool = true
        repeat {
            print("***  Enter the id of the food you want to delete from the Order History  ***\n")
            if let delete = readLine() {
                if  let id = Int(delete) {
                    if let Index = OrderDetails.firstIndex(where: {$0.id == id}) {
                        let food = FoodLoading().getFoodAllFoods(id: id)
                        let orderHistoryFood = OrderHistory().getFoodFromOrderHistory(id: food.id)
                        food.availableQuantity =  ( food.availableQuantity + orderHistoryFood.quantity! )
                        OrderHistory().deletion(Index: Index)
                    }
                    else if deleteCount < 2 {
                        deleteCount = deleteCount + 1
                        print(" == Please enter shown ID's only == \n")
                    }
                    else {
                        print(" == You entered wrong ID many times == \n")
                        UserOperation.operation.edit()
                    }
                }
                else if deleteCount < 2 {
                    deleteCount = deleteCount + 1
                    print(" == Invalid Input -> Enter valid Id's == \n")
                }
                else {
                    print(" == You entered wrong ID many times == \n")
                    UserOperation.operation.edit()
                }
            }
        } while isContinue
    }
    
    
    // MARK: Modify The Quantity methodorder for Order History
    
    func modifyQuantityInOrderHistory() {
        
        var count = 0
        
        print("\(OrderDetails)")
        let isContinue: Bool = true
        repeat {
            print(" ***  Enter the id of the food you want to modify  ***\n")
            if let add = readLine() {
                if let id = Int(add) {
                    if id <= list.count {
                        let food  = FoodLoading().getFoodAllFoods(id: id)
                        let orderHistoryFood = OrderHistory().getFoodFromOrderHistory(id: food.id)
                        if orderHistoryFood.id == food.id {
                            print(" *** Please enter the quantity *** \n")
                            if let quantity = readLine() {
                                if let number = Int(quantity) {
                                    food.availableQuantity = food.availableQuantity + orderHistoryFood.quantity!
                                    let oldPrice = orderHistoryFood.price! / orderHistoryFood.quantity!
                                    if number <= food.availableQuantity {
                                        OrderHistory().new(number: number, oldPrice: oldPrice, food: food, orderHistoryFood: orderHistoryFood)
                                    }
                                    if (food.availableQuantity <= 0) {
                                        food.availableQuantity = 0
                                        print(" ** Not much quantity available...Available Quantity => \(food.availableQuantity) ** \n")
                                        UserOperation.operation.edit()
                                    }
                                    else {
                                        print(" ** Not much quantity available...Available Quantity => \(food.availableQuantity) ** \n")
                                        modifyQuantityInOrderHistory()
                                    }
                                }
                                else {
                                    print(" == Please enter valid quantity == \n")
                                    modifyQuantityInOrderHistory()
                                }
                            }
                        }
                        else if count < 2 {
                            count = count + 1
                            print(" == Please enter shown ID's only == \n")
                        }
                        else {
                            print(" == You entered the wrong ID many times == \n")
                            UserOperation.operation.edit()
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
        }while isContinue
    }
    
}

