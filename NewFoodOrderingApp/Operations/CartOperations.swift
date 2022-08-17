//
//  CartOperations.swift
//  NewFoodOrderingApp
//
//  Created by Veerapathiran P on 05/08/22.
//

import Foundation


class CartOperations: Example {
    
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
                                showCart()
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
                        modify()
                    }
                }
                else if deleteCount < 2 {
                    deleteCount = deleteCount + 1
                    print(" == Invalid Input -> Enter valid Id's == \n")
                }
                else {
                    print(" == You entered wrong ID many times == \n")
                    modify()
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
                                        modify()
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
                            modify()
                        }
                    }
                }
                else if count < 2 {
                    count = count + 1
                    print(" == Please enter shown ID's only == \n")
                }
                else {
                    print(" == You entered the wrong ID many times == \n")
                    modify()
                }
            }
        } while isContinue
    }
    
    
    //MARK: Total Function
    func total()  {
        
        let allFoods = AllFoods()
        
        var newPrice = 0
        for cart in Cart {
            newPrice += cart.price!
        }
        
        print(" Total Price == Rs.\(newPrice)\n ")
        
        allFoods.offerCheck(newPrice: newPrice)
        
    }
    
    
    //MARK: SHOW CART
    func showCart() {
        
        if Cart.isEmpty {
            print(" ------------------------------- \n")
            print(" == No fooditems in your cart == \n")
            print(" == Please add food to order  == \n ")
            print(" ------------------------------- \n")
            Operation().start()
        }
        else {
            let isContinue: Bool = true
            repeat {
                print(" ================================================ \n")
                print("                       CART \n")
                print(" ================================================ \n")
                print("\(Cart)\n")
                print(" ================================================ \n")
                total()
                print(" ================================================ \n")
                print("       ***\n\n 1.Add foods \n")
                print(" 2.Checkout \n")
                print(" 3.Modify your cart \n")
                print(" 4.Back\n\n       *** \n")
                print(" ** Please enter the number of the Item you want to go through ** \n")
                if let input = readLine() {
                    switch input {
                    case "1":
                        CartOperations().addToCart()
                    case "2":
                        OrderDetails.insert(contentsOf: Cart, at: 0)
                        GetUserAddress.getUserAddress.callingPlace()
                    case "3":
                        modify()
                    case "4":
                        Operation().start()
                    default:
                        print(" ==  Please enter a valid input to proceed  == \n")
                    }
                }
            }while isContinue
        }
    }
    
    
    // MARK: For CART
    func addPrinting() {
        print(" The Foods are added to your cart:\n ")
        showCart()
    }
    
    func deletePrinting() {
        print(" ***  Entered food item is deleted  *** \n")
        showCart()
    }
    
    
    func modifyPrinting() {
        print(" ** Quantity modified successfully ** \n")
        print("\(Cart)\n")
        modify()
    }
    
    
    //MARK: Ask for Modify The Cart
    func modify(){
        
        let isContinue: Bool = true
        repeat {
            print(" ============= ")
            print("  Modify Cart ")
            print(" ============= ")
            print("     ***\n\n 1.Add food item\n\n 2.Delete food item\n\n 3.Modify the quantity\n\n 4.Back\n\n     ***\n\n ** Please enter the number of the Item you want to go through ** \n")
            if let operation = readLine() {
                switch operation {
                case "1":
                    CartOperations().addToCart()
                case "2":
                    if Cart.isEmpty {
                        print(" == Your cart is empty == \n")
                    }
                    else {
                        CartOperations().del()
                    }
                case "3":
                    if Cart.isEmpty {
                        print(" == Your cart is empty == \n")
                    }
                    else {
                        CartOperations().mod()
                    }
                case "4":
                    showCart()
                default:
                    print(" ==  Please enter a valid input to proceed  == \n")
                }
            }
        } while isContinue
    }

    
}
