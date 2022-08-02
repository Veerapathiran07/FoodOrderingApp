//
//  UserAddress.swift
//  NewFoodOrderingApp
//
//  Created by Veerapathiran P on 14/07/22.
//

import Foundation





//MARK: User Address Array
var addressArray : [UserAddress] = []



//MARK: User Address Class
class UserAddress {
    
    var name: String = ""
    var mobileNumber: Int = 0
    var address: [Address] = []
    
    
    //MARK: Method for get name
    func getName() -> String {
        
        while true {
            print(" ** Enter name ** ")
            if let name = readLine() {
                if !name.isEmpty {
                    return name
                }
            }
            else {
                print(" == Enter valid name == \n")
            }
        }
    }
    
    
    // MARK: Method for get mobile number
    func getMobileNumber() -> Int {
        var operation = true
        print(" ** Enter mobile number ** ")
        while operation {
            if let mobileNumber = readLine() {
                if mobileNumber.count == 10 {
                    if let mobileNumber = Int(mobileNumber) {
                        operation = false
                        return mobileNumber
                    }
                    else {
                        print(" == Please enter a valid mobilenumber == \n")
                    }
                }
                else {
                    print(" == please enter a valid mobile number == \n")
                    operation = true
                }
            }
        }
        return 0
    }
    
    
    //MARK: Method for get whole sub-address
    func getAddress() -> [Address] {
        
        var address : [Address] = []
        let obj = Address()
        
        while true {
            print(" ** Enter your Door number ** ")
            if let number = readLine() {
                if let new = Int(number) {
                    obj.buildingNumber = new
                    break
                }
                else {
                    print(" == Enter valid door number == \n")
                }
            }
        }
        
        while true {
            print(" ** Enter Street Name ** ")
            if let name = readLine() {
                if !name.isEmpty {
                    obj.streetName = name
                    break
                }
                else {
                    print(" == Enter streetname == \n")
                }
            }
            else {
                print(" == Enter valid streetname == \n")
            }
        }
        
        while true {
            print(" ** Enter City Name ** ")
            if let cityName = readLine() {
                if !cityName.isEmpty {
                    obj.cityName = cityName
                    break
                }
                else {
                    print(" == Enter cityname == \n")
                }
            }
            else {
                print(" == Enter valid cityname == \n")
            }
        }
        
        while true {
            print(" ** Enter Postal Code ** ")
            if let number = readLine() {
                if number.count == 6 {
                    if let postalCode = Int(number) {
                        obj.postalCode = postalCode
                        break
                    }
                    else {
                        print(" == Enter valid postalcode == \n")
                    }
                }
                else {
                    print(" == Enter valid postalcode == \n")
                }
            }
        }
        address.append(obj)
        return address
    }
}


//MARK: Sub-address Class
class Address {
    
    var buildingNumber : Int = 0
    var streetName : String = ""
    var cityName : String = ""
    var postalCode : Int = 0
    
}


//MARK: Class for Get Whole Address
class GetUserAddress {
    
    static let getUserAddress = GetUserAddress()
    
    //MARK: Method for get whole user address
    func userAddress() {
        
        let tempAddress = UserAddress()
        
        tempAddress.name  = UserAddress().getName()
        tempAddress.mobileNumber = UserAddress().getMobileNumber()
        tempAddress.address = UserAddress().getAddress()
        
        
        addressArray.append(tempAddress)
        
    }
    
    
    
    func callingPlace() {
        
        GetUserAddress.getUserAddress.userAddress()
        
        showAddress()
        
    }
    
    //MARK: Method for edit address
    func editAddress() {
        
        let address = addressArray[0]
        
        let isContinue: Bool = true
        repeat {
            print(" ================== ")
            print("  Edit The Address ")
            print(" ================== ")
            print("        ***\n\n 1.Name\n\n 2.Mobile Number\n\n 3.Door Number\n\n 4.Street Name\n\n 5.City Name\n\n 6.Postal Code\n\n 7.Back\n\n        ***\n\n ** Please enter the number of the Address item you want to Change ** \n")
            if let operation = readLine() {
                switch operation {
                case "1":
                    print(" Name = \(address.name) \n")
                    print(" ** Enter new name ** \n")
                    let name = readLine()
                    address.name = name!
                    print(" ** Name changed successfully **\n")
                    showAddress()
                case "2":
                    print(" Mobile Number = \(address.mobileNumber) \n")
                    print(" ** Enter new mobile number ** \n")
                    let number = readLine()
                    if let mobileNumber = Int(number!) {
                        address.mobileNumber = mobileNumber
                        print(" ** Mobile Number changed Successfully **\n")
                        showAddress()
                    }
                case "3":
                    print(" Door Number = \(address.address[0].buildingNumber) \n")
                    print(" ** Enter new door number ** \n")
                    let number = readLine()
                    if let buildingNumber = Int(number!){
                        address.address[0].buildingNumber = buildingNumber
                        print(" ** Door Number changed Successfully **\n")
                        showAddress()
                    }
                case "4":
                    print(" Street Name = \(address.address[0].streetName) \n")
                    print(" ** Enter new street name ** \n")
                    let streetName = readLine()
                    address.address[0].streetName = streetName!
                    print(" ** Street Name changed successfully **\n")
                    showAddress()
                case "5":
                    print(" City Name = \(address.address[0].cityName) \n")
                    print(" Enter new city name")
                    let cityName = readLine()
                    address.address[0].cityName = cityName!
                    print(" ** City Name changed successfully **\n")
                    showAddress()
                case "6" :
                    print(" Postal Code = \(address.address[0].postalCode) \n")
                    print(" ** Enter new postal code ** ")
                    let number = readLine()
                    if let postalCode = Int(number!) {
                        address.address[0].postalCode = postalCode
                        print(" ** Postal Code changed successfully **\n")
                        showAddress()
                    }
                case "7":
                    showAddress()
                default:
                    print(" ==  Please enter a valid input to proceed  == \n")
                }
            }
        } while isContinue
    }
    
    //MARK: Method for show the whole address
    func showAddress() {
        print(" ======================================== \n")
        print("               Your Address \n")
        print(" ======================================== \n")
        print(" Name : \(addressArray[0].name)")
        print(" Mobile Number : \(addressArray[0].mobileNumber)")
        print(" Building Number : \(addressArray[0].address[0].buildingNumber)")
        print(" Street Name : \(addressArray[0].address[0].streetName)")
        print(" City Name : \(addressArray[0].address[0].cityName)")
        print(" Postal Code : \(addressArray[0].address[0].postalCode)\n")
        print(" ======================================= \n")
        
        let isContinue: Bool = true
        repeat {
            print("       ***\n\n 1.Confirm the Address and Go to Payment \n")
            print(" 2.Change the Address \n")
            print(" 3.Back\n\n       *** \n")
            print(" ** Please enter the number of the Item you want to go through ** \n")
            if let input = readLine() {
                switch input {
                case "1" :
                    Payment().paymentMethod()
                case "2" :
                    editAddress()
                case "3" :
                    Operation.operation.showCart()
                default :
                    print(" == Enter valid number to proceed == \n")
                    showAddress()
                }
            }
        }while isContinue
    }
    
    
}
