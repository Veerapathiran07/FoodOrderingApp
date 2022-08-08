//
//  Operation.swift
//  NewFoodOrderingApp
//
//  Created by Veerapathiran P on 08/08/22.
//

import Foundation



protocol Example {
    func showCart()
}


class UserOperation: Example {
    
    
    // MARK: Singleton for Operation class
    static let operation = UserOperation()
    
    let cartItems = CartItems()
    
    let userOperation = Operation()
    
    let loading = FoodLoading()
    
    
    func foodsLoading() -> [AllFoods] {
        loading.loadVeg()
        loading.loadNonVeg()
        loading.loadIceCreams()
        loading.loadJuice()
        list = loading.vegArray + loading.nonVegArray + loading.iceCreamsArray + loading.juiceArray
        return list
    }
    
    
    //MARK: Order Foods
    func orderFoods() {
        
        let isContinue: Bool = true
        repeat {
            print(" ===============")
            print("  Order Options ")
            print(" ===============")
            print("      ***\n\n 1.Search\n\n 2.Categories\n\n 3.All Foods\n\n 4.Back\n\n      ***\n")
            print(" **  Please enter the number of the item you want to explore  ** \n")
            if let input = readLine() {
                switch input {
                case "1":
                    searchFoods()
                case "2":
                    categories()
                case "3":
                    allFoods()
                case "4":
                    backToHome()
                default:
                    print(" ==  Please enter a valid number to proceed  == ")
                }
            }
            else {
                print(" ==  Please enter a valid input  == ")
            }
        } while isContinue
    }
    
    
    // MARK: SEARCH
    func searchFoods() {
        
        var filterdTerms = [AllFoods]()
        print(" **  Search The Foods You Want!  **\n")
        if let search = readLine(){
            filterdTerms = list.filter { term in
                return term.foodName.lowercased().contains(search.lowercased())
            }
            print("\n \(filterdTerms)\n")
            
            if filterdTerms.isEmpty {
                print(" == Your searched item is not here == \n")
            }
            else {
                let isContinue: Bool = true
                repeat {
                    print(" ------------------------------------------------ \n")
                    print(" **  Please enter the option given below  ** \n")
                    print(" 1.Add food to your cart \n")
                    print(" 2.Back \n")
                    print(" ------------------------------------------------ ")
                    if let input = readLine() {
                        if (Int(input)) == 1 {
                            CartOperations().addToCart()
                            
                        }
                        else if (Int(input)) == 2 {
                            back()
                        }
                    }
                    else {
                        print(" ==  Please enter a valid input  == ")
                    }
                } while isContinue
            }
        }
    }
    
    
    //MARK: CATEGORIES ENUM
    enum Categories: Int {
        case Veg = 1
        case NonVeg = 2
        case IceCreams = 3
        case Juice = 4
        case Back = 5
    }
    
    
    //MARK: Function for choose the category
    func categories(){
        
        let isContinue: Bool = true
        repeat {
            print(" ============")
            print("  Categories ")
            print(" ============")
            print("     ***\n\n 1.Veg\n\n 2.NonVeg\n\n 3.IceCreams\n\n 4.Juice\n\n 5.Back\n\n     ***\n ")
            print(" **  Please enter the number to choose the category  ** \n")
            if let new = readLine(){
                if let number = Int(new){
                    if let category = Categories(rawValue: number){
                        switch category {
                        case.Veg:
                            vegCategory()
                        case.NonVeg:
                            nonVegCategory()
                        case.IceCreams:
                            iceCreamCategory()
                        case.Juice:
                            juiceCategory()
                        case.Back:
                            back()
                        }
                    }
                    else {
                        print(" == Please enter valid option == ")
                        categories()
                    }
                }
                else{
                    print(" ==  Invalid Input  == ")
                    categories()
                }
            }
        }while isContinue
    }
    
    func vegCategory() {
        print(" \(loading.vegArray)\n")
        allCategory()
    }
    
    
    func nonVegCategory() {
        print(" \(loading.nonVegArray)\n")
        allCategory()
    }
    
    
    func iceCreamCategory() {
        print(" \(loading.iceCreamsArray)\n")
        allCategory()
    }
    
    
    func juiceCategory() {
        print(" \(loading.juiceArray)\n")
        allCategory()
    }
    
    
    func allCategory() {
        
        let isContinue: Bool = true
        repeat {
            print(" ------------------------------------------------ \n")
            print(" ** Please enter any of the option given below **\n ")
            print(" 1. Add food  \n")
            print(" 2. Back to categories  \n")
            print(" ------------------------------------------------ ")
            if let input = readLine() {
                if (Int(input)) == 1 {
                    CartOperations().addToCart()
                }
                else if (Int(input)) == 2 {
                    categories()
                }
                else {
                    print(" ==  Please enter a valid input  == ")
                }
            }
        } while isContinue
    }
    
    
    //MARK: All FOODS
    func allFoods() {
        
        print("\(list)\n")
        let isContinue: Bool = true
        repeat {
            print(" ------------------------------------------------ \n")
            print(" ** Please enter any of the option given below ** \n")
            print(" 1. Add food to your cart  \n")
            print(" 2. Back  \n")
            print(" ------------------------------------------------ ")
            if let input = readLine() {
                if (Int(input)) == 1 {
                    CartOperations().addToCart()
                }
                else  if (Int(input)) == 2 {
                    back()
                }
                else {
                    print(" == Please enter a valid input == \n")
                }
            }
        } while isContinue
    }
    
    
    //MARK: SHOW CART
    func showCart() {
        
        if Cart.isEmpty {
            print(" ------------------------------- \n")
            print(" == No fooditems in your cart == \n")
            print(" == Please add food to order  == \n ")
            print(" ------------------------------- \n")
            userOperation.start()
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
                        userOperation.start()
                    default:
                        print(" ==  Please enter a valid input to proceed  == \n")
                    }
                }
            }while isContinue
        }
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
    
    
    // MARK: Order History
    func orderHistory() {
        
        if OrderDetails.isEmpty {
            print(" --------------------------------- \n")
            print(" == Your Order History is Empty == \n ")
            print(" ==  Please  Order  Something   == \n ")
            print(" --------------------------------- \n")
            userOperation.start()
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
                        backToHome()
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
                userOperation.start()
            }
            if (Int(input)) == 2 {
                backToOrderHistory()
            }
        }
    }
    
    //MARK: Back methods
    func backToHome() {
        userOperation.start()
    }
    
    func back() {
        orderFoods()
    }
    
    func backToOrderHistory() {
        orderHistory()
    }
    
    
    //MARK: Total Function
    func total()  {
        
        let allFoods = AllFoods()
        
        var newPrice = 0
        for cart in Cart {
            newPrice += cart.price!
        }
        
        var quantity = 0
        for cart in Cart {
            quantity += cart.quantity!
        }
        
        print(" Total Price == Rs.\(newPrice)\n ")
        
        allFoods.offerCheck(newPrice: newPrice)
        
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


// MARK: Extension of operation
extension UserOperation {
    
    func offers() {
        
        let isContinue: Bool = true
        repeat {
            print(" ------------------------------------------- \n")
            print("  % Order more than 500Rs to get 50Rs off % \n")
            print(" ------------------------------------------- \n")
            print("Back == Enter 1 \n ")
            if let back = readLine(){
                if (Int(back)) == 1 {
                    backToHome()
                }
                else {
                    print(" == Enter the correct number to back == \n ")
                }
            }
        } while isContinue
    }
}
