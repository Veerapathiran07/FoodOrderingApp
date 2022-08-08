//
//  OrderHistory.swift
//  NewFoodOrderingApp
//
//  Created by Veerapathiran P on 08/08/22.
//

import Foundation


//MARK: Order Details Array

var OrderDetails: [CartItems] = []


// MARK: OrderHistory

class OrderHistory {
    
    
    let cartItems = CartItems()
    
    
    //MARK: Order Details Array Iteration Function
    
    func getFoodFromOrderHistory(id: Int) -> CartItems {
        
        var food: CartItems = CartItems()
        
        if  !(OrderDetails.isEmpty) {
            for i in 0..<OrderDetails.count {
                if OrderDetails[i].id == id {
                    food = OrderDetails[i]
                }
            }
        }
        return food
    }
    
    
    // MARK: Add food directly to order history
    
    func  adding(number: Int, food: AllFoods) {
        
        let orderHistoryFood = getFoodFromOrderHistory(id: food.id)
        
        if orderHistoryFood.id == food.id {
            orderHistoryFood.price = orderHistoryFood.price! / orderHistoryFood.quantity!
            food.availableQuantity = food.availableQuantity - number
            orderHistoryFood.quantity = number + orderHistoryFood.quantity!
            orderHistoryFood.price = orderHistoryFood.price! * orderHistoryFood.quantity!
            food.extraNeed()
            print(" ** The foods are added to your order details now ** \n")
            UserOperation.operation.orderHistory()
        }
        else {
            cartItems.id = food.id
            cartItems.foodName = food.foodName
            cartItems.quantity = number
            cartItems.price = food.price * cartItems.quantity!
            OrderDetails.append(cartItems)
            food.availableQuantity = food.availableQuantity - number
            food.extraNeed()
            print(" ** The foods are added to your order details now ** \n")
            UserOperation.operation.orderHistory()
        }
    }
    

    
    // MARK: Delete method for order history
    
    func deletion(Index: Int) {
        OrderDetails.remove(at: Index)
        print(" ***  Entered food item is deleted  *** \n")
        UserOperation.operation.orderHistory()
    }
    

    
    func new(number: Int, oldPrice: Int, food: AllFoods, orderHistoryFood: CartItems) {
        orderHistoryFood.quantity =  number
        orderHistoryFood.price = oldPrice * number
        food.availableQuantity = food.availableQuantity - number
        print(" ** Quantity modified successfully ** \n")
        print("\(OrderDetails)")
        UserOperation.operation.edit()
    }
    
}

