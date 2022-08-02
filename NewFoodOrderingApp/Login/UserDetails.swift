//
//  UserDetails.swift
//  NewFoodOrderingApp
//
//  Created by Veerapathiran P on 05/07/22.
//

import Foundation





class User {
    var userName: String = ""
    var password: String = ""
    
}


class UserDetails{
    
    var userDetailsArray: [User] = []
    
    let userOne = user("vijay", "vijay007")
    let userTwo = user("ajith", "ajith007")
    let userThree = user("mahesh", "mahesh123")
    
    func userDetails() {
        userDetailsArray.append(userOne)
        userDetailsArray.append(userTwo)
        userDetailsArray.append(userThree)
    }
}

func user(_ userName : String , _ password : String ) -> User {
    let obj = User()
    obj.userName = userName
    obj.password = password
    
    return obj
}
