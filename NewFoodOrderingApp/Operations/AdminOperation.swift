//
//  AdminOperation.swift
//  NewFoodOrderingApp
//
//  Created by Veerapathiran P on 05/07/22.
//

import Foundation




class AdminOperation {
    
    
    func adminChanges() {
        
        
        let newApp = OpenApp ()
        
        let isContinue: Bool = true
        repeat {
            print("****** Welcome MR.Admin ******")
            print(" ***\n 1.Add New Foods\n 2.Delete Foods\n 3.Change Price\n 4.Back To SignUp Page\n ***\n** Please enter the number of the Item you want to Explore **")
            if let new = readLine() {
                switch new {
                case "1":
                    addNewFoods()
                case "2":
                    deleteFoods()
                case "3":
                    changePrice()
                case "4":
                    newApp.open()
                default:
                    print(" ==  Please enter a valid number to proceed  == ")
                }
            }
            else {
                print(" ==  Please enter a valid input  == ")
            }
        } while isContinue
    }
    
    func addNewFoods() {
        
        print ("\(Operation.operation.list)")
        let isContinue: Bool = true
        repeat {
            print(" ** Enter Id for the food ** ")
        } while isContinue
        
    }
    
    var count = 0
    
    
    func deleteFoods() {
        print ("\(Operation.operation.list)")
        let isContinue: Bool = true
        repeat {
            print(" Enter The ID of the food you want to delete ")
            if let id = readLine() {
                if let number = Int(id) {
                    if let Index = Operation.operation.list.firstIndex(where: {$0.id == number}){
                        Operation.operation.list.remove(at: Index)
                        print("** Entered food item is deleted **\n")
                        print (" ** Again you want to delete food - Enter number 1 ** ")
                        print(" ** Back - Enter number 2 ** ")
                        if let input = readLine() {
                            if (Int(input)) == 1  {
                                deleteFoods()
                            }
                            else if (Int(input)) == 2 {
                                backToHome()
                            }
                        }
                    }
                    else if count < 2 {
                        count = count + 1
                        print(" == Please enter shown ID's only == ")
                    }
                    else {
                        print(" == Please enter shown ID's only == ")
                        backToHome()
                    }
                }
                else if count < 2 {
                    count = count + 1
                    print(" == Invalid Input -> Enter valid Id's == ")
                }
                else {
                    print(" == You entered wrong ID many times == ")
                    backToHome()
                }
            }
        } while isContinue
        
    }
    
    func changePrice() {
        
    }
    
    
    func backToHome() {
        adminChanges()
    }
    
}

