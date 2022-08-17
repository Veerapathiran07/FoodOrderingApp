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


class Foods {
    
    
    // MARK: Singleton for Operation class
    static let foods = Foods()
    
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
    
    
    //MARK: Back methods
    func backToHome() {
        userOperation.start()
    }
    
    func back() {
        orderFoods()
    }
    
    func backToOrderHistory() {
        OrderHistoryOperation().orderHistory()
    }
    
    
}


// MARK: Extension of operation

extension Foods {
    
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
