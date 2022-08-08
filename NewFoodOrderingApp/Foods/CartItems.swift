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
    
    
    //MARK: Add to Cart
    
    func add(number: Int, food: AllFoods) {
        
        let cartItems = CartItems()
        
        let cartFood = cartItems.getFoodFromCart(id: food.id)
        
        if cartFood.id == food.id {
            cartFood.price = cartFood.price! / cartFood.quantity!
            food.availableQuantity = (food.availableQuantity) - number
            cartFood.quantity = number + (cartFood.quantity!)
            cartFood.price = cartFood.price! * (cartFood.quantity!)
            food.extraNeed()
            print(" The Foods are added to your cart:\n ")
            UserOperation.operation.showCart()
        }
        else {
            cartItems.id = food.id
            cartItems.foodName = food.foodName
            cartItems.quantity = number
            cartItems.price = food.price * number
            Cart.append(cartItems)
            food.availableQuantity = food.availableQuantity - number
            food.extraNeed()
            print(" The Foods are added to your cart:\n ")
            UserOperation.operation.showCart()
        }
    }
 
    
    //MARK: Delete from cart
    
    func delete(Index: Int) {
        Cart.remove(at: Index)
        print(" ***  Entered food item is deleted  *** \n")
        UserOperation.operation.showCart()
    }
    
    
    // MARK: Modify the Quantity in cart
    
    func modifyQuantity(number: Int, oldPrice: Int, food: AllFoods, cartFood: CartItems) {
        
        cartFood.quantity =  number
        cartFood.price = oldPrice * number
        food.availableQuantity = food.availableQuantity - number
        print(" ** Quantity modified successfully ** \n")
        print("\(Cart)\n")
        UserOperation.operation.modify()
    }
    
}

