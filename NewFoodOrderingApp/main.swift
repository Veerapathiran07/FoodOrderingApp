//
//  main.swift
//  NewFoodOrderingApp
//
//  Created by Veerapathiran P on 05/07/22.
//

import Foundation


FoodLoading().loadAllFoods(completionHandler: { (succes) -> Void in
    print(" Loading...\n")
    sleep(3)
    if succes {
        
        let userOperation = Operation()
        
        userOperation.start()
    }
    else {
        print(" Something Went Wrong ... ")
    }
})
