//
//  Payment.swift
//  NewFoodOrderingApp
//
//  Created by Veerapathiran P on 22/07/22.
//

import Foundation


//MARK: Class for Payment
class Payment {
    
    //MARK: Method for choose the payment type
    func paymentMethod(){
        
        let isContinue: Bool = true
        repeat {
            print(" ================= ")
            print("  Payment Methods  ")
            print(" ================= ")
            print("        ***\n\n 1.G-Pay\n\n 2.Phone-Pe\n\n 3.Paytm\n\n 4.Cash On Delivery\n\n 5.Back\n\n        ***\n\n ** Please enter the number of the payment method you want to go with ** \n")
            if let operation = readLine() {
                switch operation {
                case "1":
                    g_pay()
                case "2":
                    phone_pe()
                case "3":
                    paytm()
                case "4":
                    cod()
                case "5":
                    GetUserAddress().showAddress()
                default:
                    print(" ==  Please enter a valid input to proceed  == ")
                }
            }
        } while isContinue
    }
    
    
    //MARK: Methods for  all payment types
    
    func g_pay() {
        payment()
    }
    
    func phone_pe() {
        payment()
    }
    
    func paytm() {
        payment()
    }
    
    func cod() {
        let isContinue: Bool = true
        repeat {
            print("\(OrderDetails)\n")
            OrderHistoryOperation().oldOrderTotal()
            print(" ------------------------------------------ \n")
            print(" ** Please enter the options given below ** \n ")
            print(" 1.Confirm and Pay \n")
            print(" 2.Back \n ")
            print(" ------------------------------------------ \n")
            if let input = readLine() {
                if (Int(input)) == 1 {
                    print(" ** Order Placed Successfully ** \n")
                    new().one()
                }
                if (Int(input)) == 2 {
                    print("Payment Cancelled!")
                    paymentMethod()
                }
            }
        } while isContinue
    }
    
    // MARK: Common method for online payments
    func payment() {
        let isContinue: Bool = true
        repeat {
            print("\(OrderDetails)\n")
            OrderHistoryOperation().oldOrderTotal()
            print(" ------------------------------------------ \n")
            print(" ** Please enter the options given below ** \n ")
            print(" 1.Confirm and Pay \n")
            print(" 2.Back \n ")
            print(" ------------------------------------------ \n")
            if let input = readLine() {
                if (Int(input)) == 1 {
                    print(" ** Payment done! ** \n")
                    print(" ** Order Placed Successfully ** \n")
                    new().one()
                }
                if (Int(input)) == 2 {
                    print(" == Payment Cancelled! == \n")
                    paymentMethod()
                }
            }
        } while isContinue
    }
    
}

class new {
    
    func one() {
        Cart.removeAll()
        Operation().start()
    }
    
}



func afterOrder() {
    sleep(5)
    print(" ---------------------------------- \n")
    print(" ** Order Delivered Successfully ** \n")
    print(" ---------------------------------- \n")
    print(" Enter any number of the options given below: \n")
    print(" 1.Rate Your Experience \n")
    print(" 2.Skip \n")
    if let new = readLine() {
        if Int(new) == 1 {
            rating()
        }
        if Int(new) == 2 {
            print( " Thank You For Ordering \n" )
        }
    }
}


func rating() {
    print(" ============")
    print("    Rating   ")
    print(" ============ ")
    print("     ***\n\n 1.Very Good \n\n")
    print(" 2.Good \n\n")
    print(" 3.Ok \n\n")
    print(" 4.Poor \n\n")
    print(" 5.Verybad\n\n     ***\n\n")
    print(" Enter any one of the number in the rating option : \n")
    if let input = readLine() {
        if (Int(input)) == 1 || (Int(input)) == 2 || (Int(input)) == 3 || (Int(input)) == 4 || (Int(input)) == 5 {
            print(" ** Thank You For Order Food **\n")
            Operation().start()
        }
        else {
            print(" Invalid Input ")
            rating()
        }
    }
    else {
        print(" == Invalid Input == ")
    }
}
