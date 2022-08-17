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
        
        print(" ***  Enter the id of the food you want add to your order history  ***\n")
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
                                edit()
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
                        edit()
                    }
                }
                else if deleteCount < 2 {
                    deleteCount = deleteCount + 1
                    print(" == Invalid Input -> Enter valid Id's == \n")
                }
                else {
                    print(" == You entered wrong ID many times == \n")
                    edit()
                }
            }
        } while isContinue
    }
    
    
    // MARK: Modify The Quantity method for Order History
    
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
                                        edit()
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
                            edit()
                        }
                    }
                }
                else if count < 2 {
                    count = count + 1
                    print(" == Please enter shown ID's only == \n")
                }
                else {
                    print(" == You entered the wrong ID many times == \n")
                    CartOperations().modify()
                }
            }
        }while isContinue
    }
    
    
    // MARK: Order History
    func orderHistory() {
        
        if OrderDetails.isEmpty {
            print(" --------------------------------- \n")
            print(" == Your Order History is Empty == \n ")
            print(" ==  Please  Order  Something   == \n ")
            print(" --------------------------------- \n")
            Operation().start()
        }
        else {
            
            let isContinue: Bool = true
            repeat {
                print("")
                print(" ================================================= \n")
                print("                   Order History \n")
                print(" ================================================= \n")
                print(" \(OrderDetails) \n ")
                print(" ================================================ \n")
                print("            ***\n\n 1.CheckOut (Re-Order) \n")
                print(" 2.Add food to order \n")
                print(" 3.Clear the history \n")
                print(" 4.Edit the history to order \n")
                print(" 5.Back \n\n            ***\n ")
                print(" Please enter the number of the item you want to go through \n ")
                if let input = readLine() {
                    if (Int(input)) == 1 {
                        reOrderFromOrderHistory()
                    }
                    if (Int(input)) == 2 {
                        OrderHistoryOperation().addToHistory()
                    }
                    if (Int(input)) == 3 {
                        clearOrderHistory()
                    }
                    if (Int(input)) == 4 {
                        edit()
                    }
                    if (Int(input)) == 5 {
                        Foods.foods.backToHome()
                    }
                    else {
                        print(" == Invalid Input == \n ")
                    }
                }
                else {
                    print(" == Invalid Input == \n ")
                }
            }while isContinue
        }
    }
    
    
    // MARK: Edit function for Order History to order
    func edit() {
        print(" ===================== ")
        print("  Modify OrderHistory ")
        print(" ===================== ")
        print("         ***\n\n 1.Add food To Order\n\n 2.Delete food From Order History\n\n 3.Modify quantity\n\n 4.Back\n\n         *** \n\n ** Please enter the number of the Item you want to Explore ** ")
        
        if let input = readLine() {
            if (Int(input)) == 1 {
                OrderHistoryOperation().addToHistory()
            }
            if (Int(input)) == 2 {
                OrderHistoryOperation().deleteFromOrderHistory()
                orderHistory()
            }
            if (Int(input)) == 3 {
                OrderHistoryOperation().modifyQuantityInOrderHistory()
            }
            if (Int(input)) == 4 {
                orderHistory()
            }
            else {
                print(" == Invalid Input == ")
                edit()
            }
        }
        else {
            print(" == Invalid Input == ")
        }
    }

    
    
    // MARK: Again order the same foods
    func reOrderFromOrderHistory() {
        print(" ========================================== \n")
        print(OrderDetails)
        print(" ========================================== \n")
        oldOrderTotal()
        print(" ========================================== \n")
        print(" ------------------------------------------ \n")
        print(" ** Please enter the options given below ** \n ")
        print(" 1.Confirm the Order \n")
        print(" 2.Back \n ")
        print(" ------------------------------------------ \n")
        if let input = readLine() {
            if (Int(input)) == 1 {
                OrderDetails.insert(contentsOf: Cart, at: 1)
                GetUserAddress.getUserAddress.callingPlace()
            }
            if (Int(input)) == 2 {
                orderHistory()
            }
        }
        else {
            print(" == Invalid Input == \n ")
        }
    }
    
    
    // MARK: Clear the Order History
    func clearOrderHistory() {
        print(" ------------------------------------------ \n")
        print(" ** Please enter the options given below ** \n ")
        print(" 1.Confirm to Clear The Order History \n")
        print(" 2.Back \n ")
        print(" ------------------------------------------ \n")
        if let input = readLine() {
            if (Int(input)) == 1 {
                OrderDetails.removeAll()
                print(" ** Order History Cleared ** \n ")
                Operation().start()
            }
            if (Int(input)) == 2 {
                Foods.foods.backToOrderHistory()
            }
        }
    }
    
    // MARK: For Order History
    func addingPrinting() {
        print(" ** The foods are added to your order details now ** \n")
        OrderHistoryOperation().orderHistory()
    }
    
    
    func deletingPrinting() {
        print(" ***  Entered food item is deleted  *** \n")
        OrderHistoryOperation().orderHistory()
    }
    
    
    func modificationPrinting() {
        print(" ** Quantity modified successfully ** \n")
        print("\(OrderDetails)")
        OrderHistoryOperation().edit()
    }
    
    
    func oldOrderTotal() {
        
        let allFoods = AllFoods()
        
        var totalPrice = 0
        for food in OrderDetails {
            totalPrice += food.price!
        }
        print(" Total Price == Rs.\(totalPrice)\n ")
        
        allFoods.offerCheck(newPrice: totalPrice)
    }
    
    
}

