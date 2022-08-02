//
//  Login.swift
//  NewFoodOrderingApp
//
//  Created by Veerapathiran P on 05/07/22.
//

import Foundation





class Login {


    let newApp = OpenApp ()

    let userOperation = UserOperation()

    let adminOperation = AdminOperation()

    let adminDetails = AdminDetails()

    let addUsers = UserDetails()

    func signUp() {
        //        let name = userinput.getName()
        //        let mobileNumber = userinput.getMobileNumber()
        //        let address = userinput.getAddress()
        //        let password = userinput.getPassword()
    }

    var count = 0

    func logIn(){

        print("Enter your name: ")
        if let name = readLine() {
            if adminDetails.adminName == name {
                print("Enter Password: ")
                if let password = readLine() {
                    if adminDetails.password == password {
                        adminOperation.adminChanges()
                        // admin function calling place
                    }
                    else if count < 2 {
                        count = count + 1
                        print(" ! ! Password Incorrect ! ! ")
                    }
                }
                else {
                    print(" == You entered wrong password manytimes == \n")
                    newApp.open()
                }
            }
            else {
                addUsers.userDetails()
                if (addUsers.userDetailsArray.firstIndex(where: {$0.userName == name}) != nil) {
                    repeat{
                        print("Enter Password: ")
                        if let password = readLine() {
                            if addUsers.userDetailsArray.firstIndex(where: {$0.password == password}) != nil {
                                userOperation.start()
                                // User function calling place
                            }
                            else if count < 2 {
                                count = count + 1
                                print("Password Incorrect")
                            }
                            else {
                                print("You entered wrong password manytimes")
                                logIn()
                            }
                        }
                    } while count < 2
                }
                else if count < 2 {
                    count = count + 1
                    print("Enter valid Name\n")
                    logIn()
                }
                else {
                    print("You entered wrong name manytimes")
                    newApp.open()
                }
            }
        }
    }
}



class OpenApp {


    func open() {

        let userOperation = UserOperation()
        
        print(" ----------------------------- \n")
        print(" ==  Working  In  Progress  == \n")
        print(" ----------------------------- \n")
        
        userOperation.start()
        
        

        let isContinue: Bool = true
        repeat {
            print("****** Welcome to the Food World ******")
            print(" ***\n 1.SignUp\n 2.LogIn\n ***\n** SignUp or LogIn to Enter into Food World **")
            if let open = readLine() {
                switch open {
                case "1":
                    Login().signUp()
                case "2":
                    Login().logIn()
                default:
                    print(" ==  Please enter a valid number to proceed  == ")
                }
            }
            else {
                print(" ==  Please enter a valid input  == ")
            }
        } while isContinue
    }
}


