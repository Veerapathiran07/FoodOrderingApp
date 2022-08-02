//
//  main.swift
//  NewFoodOrderingApp
//
//  Created by Veerapathiran P on 05/07/22.
//

import Foundation


FoodLoading().loadAllFoods(completionHandler: { (succes) -> Void in
    print(" Loading...")
    sleep(3)
    if succes {
        
        let userOperation = UserOperation()
        
        userOperation.start()
    }
    else {
        print(" Something Went Wrong ... ")
    }
})
