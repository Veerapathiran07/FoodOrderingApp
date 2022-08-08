//
//  UserOperation.swift
//  NewFoodOrderingApp
//
//  Created by Veerapathiran P on 05/07/22.
//

import Foundation



//MARK: User Operation Class
class Operation {
    
    func start() {
        
        let newApp = OpenApp ()
        
        let isContinue: Bool = true
        repeat {
            print(" ======================================= \n")
            print(" ****** Welcome to the Food World ******\n")
            print(" ======================================= \n")
            print("                   ***\n\n 1.OrderFoods\n\n 2.New Offers\n\n 3.Cart\n\n 4.Order History\n\n 5.Back To SignUp Page\n\n                   ***\n ")
            print(" ** Please enter the number of the Item you want to Explore ** \n ")
            if let new = readLine() {
                switch new {
                case "1":
                    UserOperation.operation.orderFoods()
                case "2":
                    UserOperation.operation.offers()
                case "3":
                    UserOperation.operation.showCart()
                case "4":
                    UserOperation.operation.orderHistory()
                case "5":
                    newApp.open()
                default:
                    print(" ==  Please enter a valid number to proceed  == \n ")
                }
            }
            else {
                print(" ==  Please enter a valid input  == \n ")
            }
        } while isContinue
    }
    
}


