//
//  CartItems.swift
//  NewFoodOrderingApp
//
//  Created by Veerapathiran P on 05/07/22.
//

import Foundation


var Cart : [CartItems] = []


// MARK: CART ITEMS

class CartItems: CustomStringConvertible {
    
    
    var id : Int?
    var foodName : String?
    var quantity : Int?
    var price : Int?
    
    
    var description: String {
        return "\n ID : \(id!)\n FoodName : \(foodName!)\n OrderedQuantity : \(quantity!)\n Price: \(price!)\n "
    }
    
    
    func getFoodFromCart(id: Int) -> CartItems {
        
        var food: CartItems = CartItems()
        
        if  !(Cart.isEmpty) {
            for i in 0..<Cart.count {
                if Cart[i].id == id {
                    food = Cart[i]
                }
            }
        }
        return food
    }
    
    
    func add() {
        
        let cartItems = CartItems()
        
        let food = Operation.operation.addFoods()
        let cartFood = cartItems.getFoodFromCart(id: food.id)
        if cartFood.id == food.id {
            print(" *** Please enter the quantity ***\n")
            if let quantity = readLine() {
                if let number = Int(quantity), let price = cartFood.price, let quantity = cartFood.quantity {
                    let oldPrice = price / quantity
                    if number <= food.availableQuantity {
                        food.availableQuantity = (food.availableQuantity) - number
                        cartFood.quantity = quantity + number
                        cartFood.price = oldPrice * (cartFood.quantity!)
                        food.extraNeed()
                        print(" The Foods are added to your cart:\n ")
                        Operation.operation.showCart()
                    }
                    if (food.availableQuantity <= 0) {
                        food.availableQuantity = 0
                        print(" ** Not much quantity available...Available Quantity => \(food.availableQuantity) ** \n")
                        Operation.operation.showCart()
                    }
                    else {
                        print(" ** Not much quantity available...Available Quantity => \(food.availableQuantity) ** \n")
                        cartItems.add()
                    }
                }
                else {
                    print(" ==  Please enter the valid quantity for your food  == ")
                    cartItems.add()
                }
            }
        }
        else {
            print(" *** Please enter the quantity *** \n")
            if let quantity = readLine() {
                if let newquantity = Int(quantity) {
                    let new = food.price * newquantity
                    if newquantity <= food.availableQuantity {
                        food.availableQuantity = food.availableQuantity - newquantity
                        cartItems.id = food.id
                        cartItems.foodName = food.foodName
                        cartItems.quantity = newquantity
                        cartItems.price = new
                        Cart.append(cartItems)
                        food.extraNeed()
                        print(" The Foods are added to your cart:\n ")
                        Operation.operation.showCart()
                    }
                    if (food.availableQuantity <= 0) {
                        food.availableQuantity = 0
                        print(" ** Not much quantity available...Available Quantity => \(food.availableQuantity) ** \n")
                        Operation.operation.showCart()
                    }
                    else {
                        print(" ** Not much quantity available...Available Quantity => \(food.availableQuantity) ** \n")
                        cartItems.add()
                    }
                }
                else {
                    print(" ==  Please enter the valid quantity for your food  == ")
                    cartItems.add()
                }
            }
        }
    }
    
    
    
    
    //MARK: Delete from cart
    var deleteCount = 0
    
    func delete() {
        
        let cartItems = CartItems()
        
        print("\(Cart)")
        let isContinue: Bool = true
        repeat {
            print(" ***  Enter the id of the food you want to delete from the cart  ***")
            if let delete = readLine() {
                if  let id = Int(delete) {
                    if let Index = Cart.firstIndex(where: {$0.id == id}) {
                        let food = FoodLoading().getFoodAllFoods(id: id)
                        let cartFood = cartItems.getFoodFromCart(id: id)
                        food.availableQuantity = (food.availableQuantity + cartFood.quantity!)
                        Cart.remove(at: Index)
                        print(" ***  Entered food item is deleted  *** \n")
                        Operation.operation.showCart()
                    }
                    else if deleteCount < 2 {
                        deleteCount = deleteCount + 1
                        print(" == Please enter shown ID's only == \n")
                    }
                    else {
                        print(" == Please enter shown ID's only == \n")
                        Operation.operation.modify()
                    }
                }
                else if deleteCount < 2 {
                    deleteCount = deleteCount + 1
                    print(" == Invalid Input -> Enter valid Id's == \n")
                }
                else {
                    print(" == You entered wrong ID many times == \n")
                    Operation.operation.modify()
                }
            }
        } while isContinue
    }
    
    
    var count = 0
    
    // MARK: Modify the Quantity in cart
    func modifyQuantity() {
        
        print("\(Cart)")
        let isContinue: Bool = true
        repeat {
            let food = Operation.operation.addFoods()
            let cartFood = CartItems().getFoodFromCart(id: food.id)
            if cartFood.id == food.id {
                print(" *** Please enter the quantity ***")
                if let quantity = readLine() {
                    if let number = Int(quantity), let price = cartFood.price, let quantity = cartFood.quantity {
                        food.availableQuantity = food.availableQuantity + quantity
                        let oldPrice = price / quantity
                        if number <= food.availableQuantity {
                            cartFood.quantity =  number
                            cartFood.price = oldPrice * number
                            food.availableQuantity = food.availableQuantity - number
                            print(" ** Quantity modified successfully ** \n")
                            print("\(Cart)\n")
                            Operation.operation.modify()
                        }
                        if (food.availableQuantity <= 0) {
                            food.availableQuantity = 0
                            print(" ** Not much quantity available...Available Quantity => \(food.availableQuantity) ** \n")
                            Operation.operation.modify()
                        }
                        else {
                            print(" ** Not much quantity available...Available Quantity => \(food.availableQuantity) ** \n")
                            modifyQuantity()
                        }
                    }
                    else {
                        print(" == Please enter valid quantity == \n")
                        modifyQuantity()
                    }
                }
            }
            else if count < 2 {
                count = count + 1
                print(" == Please enter shown ID's only == \n")
            }
            else {
                print(" == You entered the wrong ID many times == \n")
                Operation.operation.modify()
            }
        } while isContinue
    }
    
    
    //     MARK: OfferChecking with quantity
    //        func offerCheck(quantity: Int) {
    //            if quantity > 3 {
    //
    //                //            let quantity = quantity + 1
    //
    //                print(" -- Get One Extra quantity for the one food you ordered twice or more, at the same price -- \n")
    //
    //            }
    //        }
}

