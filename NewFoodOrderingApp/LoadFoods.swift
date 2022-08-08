//
//  LoadFoods.swift
//  NewFoodOrderingApp
//
//  Created by Veerapathiran P on 05/07/22.
//

import Foundation


class FoodLoading {
    
    // MARK: Arrays to store the foods
    var vegArray: [Veg] = []
    var nonVegArray: [Chicken] = []
    var iceCreamsArray: [Vennila] = []
    var juiceArray: [Juice] = []
    
    
    // MARK: Food Items for loading
    
    // MARK: VEG FOODS
    let vegOne = veg(1, "legumes", 10, 60, "Legumes contain antioxidants that help prevent cell damage and fight disease and aging", "Veg", "Lacto-ovo vegetarian")
    let vegTwo = veg(2, "kefir", 10, 80, "It improves your energy, lowers stress, prevents muscle cramps, and nourishes your skin", "Veg", "Lacto-vegetarian")
    let vegThree = veg(3, "poultry", 15, 50, "Iodine to help your body produce thyroid hormone", "Veg", "Ovo-vegetarian")
    let vegFour = veg(4, "Whole grains", 15, 50, "Whole grains are also linked to a lower risk of heart disease, diabetes, certain cancers and other health problems", "Veg", "Flexitarian")
    let vegFive = veg(5, "peanuts", 20, 20, "Peanuts help prevent heart disease by lowering cholesterol levels", "Veg", "Pescatarian")
    let vegSix = veg(6, "Tofu", 10, 50, "Tofu has fiber, and high-fiber diets keep your colon healthy and cancer risk low", "Veg", "vegan ")
    
    
    // MARK: NONVEG FOODS
    let nonVegOne = nonVeg(7, "Tandoori Lamb Chops", 10, 150, "Lamb chops marinated in strained yogurt and flavoursome masalas", "NonVeg", "Chicken", "Chinese")
    let nonVegTwo = nonVeg(8, "Malabar Fish Biryani", 15, 140, "Enjoy the delicious taste of this ever-charming dish. Pair it with delicious raita and mint chutney and savour", "NonVeg", "Fish", "Indian")
    let nonVegThree = nonVeg(9, "Mutton Korma", 20, 80, "Korma is an ultimate delight for meat lovers", "NonVeg", "Mutton", "Indian")
    let nonVegFour = nonVeg(10, "Grilled Chicken Escalope with Fresh Salsa", 5, 120, "This recipe is grilled to perfection and served with a fresh salsa of grapes, spring onion and cherry tomatoes.", "NoVeg", "Chicken", "Chinese")
    let nonVegFive = nonVeg(11, "Pina Colada Pork Ribs", 10, 150, "The ingredients of the popular rum-based cocktail team up with pork ribs to create a lip-smacking good treat", "NonVeg", "Mutton", "Chinese")
    let nonVegSix = nonVeg(12, "Nalli Nihar", 5, 80, "Nihari is a stew from the Indian subcontinent consisting of slow-cooked meat,  goat meat and chicken, along with bone marrow", "NonVeg", "Mutton", "Indian")
    let nonVegSeven = nonVeg(13, "Spicy Tangy Kadhai Chicken", 10, 120, "Spicy tangy kadhai chicken is an absolutely lip-smacking chicken recipe cooked in spices, jaggery and tamarind", "NonVeg", "Chicken", "Indian")
    
    
    // MARK: ICECREAMS
    let iceCreamOne = iceCreams(14, "Strawberry Litchi Kulfi", 15, 60, "kulfi recipe infused with the goodness of fresh strawberry puree, frozen to perfection along with milk, sugar, cream and cardamom", "IceCream", "Strawberry", "Kulfi")
    let iceCreamTwo = iceCreams(15, "raspberry", 10, 60, "provide potassium, essential to heart function, and proven to lower blood pressure", "IceCream", "Matcha", "sherbet")
    let iceCreamThree = iceCreams(16, "watermelon", 20, 60, "Helps you stay hydrated", "IceCream", "Matcha", "Sorbet")
    let iceCreamFour = iceCreams(17, "Caramel Apple", 20, 60, "caramel apples offer protein, antioxidant phytonutrients, and dietary fiber", "IceCream", "Coconut", "Frozen Yogurt")
    let iceCreamFive = iceCreams(18, "frozen dessert", 10, 100, "the lack of preservatives", "IceCream", "Vennila", "Soft Serve")
    let iceCreamSix = iceCreams(19, "Philadelphia Ice Cream", 5, 100, "Philadelphia ice-cream was coined when Americans axed the labor-intensive process of creating a custard to make a new type of lighter ice cream many people enjoy today", "IceCream","Oreo", "Philadelphia Ice Cream")
    
    
    //MARK: JUICE
    let juiceOne = juice(20, "Blueberry Juice", 10, 50, "May help prevent heart disease", "Juice", "Fruit")
    let juiceTwo = juice(21, "Grapefruit Juice", 10, 50, "It's low in calories, yet high in nutrients" , "Juice", "Fruit")
    let juiceThree = juice(22, "Beet juice", 15, 50, "It may help curb blood pressure", "Juice", "Vegetable")
    let juiceFour = juice(23, "Pulpy juice", 20, 50, "Pulpy vegetable juice has some fiber", "Juice", "Vegetable")
    let juiceFive = juice(24, "Black Rasberry", 15, 80, "It contain powerful antioxidants that protect your cells from damage", "Juice", "Berry")
    let juiceSix = juice(25, "StrawBerry", 10, 80, "increase good cholesterol, lower your blood pressure, and guard against cancer", "Juice", "Berry")
    
    
    
    // MARK: Functions to append the fooditems to the respective array
    
    //MARK: Veg Foods Loading
    func loadVeg() {
        vegArray.append(vegOne)
        vegArray.append(vegTwo)
        vegArray.append(vegThree)
        vegArray.append(vegFour)
        vegArray.append(vegFive)
        vegArray.append(vegSix)
    }
    
    
    //MARK: NonVeg Foods Loading
    func loadNonVeg() {
        nonVegArray.append(nonVegOne)
        nonVegArray.append(nonVegTwo)
        nonVegArray.append(nonVegThree)
        nonVegArray.append(nonVegFour)
        nonVegArray.append(nonVegFive)
        nonVegArray.append(nonVegSix)
        nonVegArray.append(nonVegSeven)
    }
    
    
    //MARK: IceCreams Loading
    func loadIceCreams() {
        iceCreamsArray.append(iceCreamOne)
        iceCreamsArray.append(iceCreamTwo)
        iceCreamsArray.append(iceCreamThree)
        iceCreamsArray.append(iceCreamFour)
        iceCreamsArray.append(iceCreamFive)
        iceCreamsArray.append(iceCreamSix)
    }
    
    
    //MARK: Juice Loading
    func loadJuice() {
        juiceArray.append(juiceOne)
        juiceArray.append(juiceTwo)
        juiceArray.append(juiceThree)
        juiceArray.append(juiceFour)
        juiceArray.append(juiceFive)
        juiceArray.append(juiceSix)
    }
    
    func getFoodAllFoods(id: Int) -> AllFoods {
        var food: AllFoods = list[1]
        for i in list {
            if i.id == id {
                food = i
            }
        }
        return food
    }
    
    func loadAllFoods (completionHandler:( _ success: Bool) -> Void) {
        
        let Foods: [AllFoods] = UserOperation.operation.foodsLoading()
        
        if Foods.isEmpty {
            completionHandler(false)
        }
        else {
            completionHandler(true)
        }
    }
    
    
}



func veg (_ id : Int, _ foodName : String, _ availableQuantity : Int, _ price : Int, _ details : String, _ type : String, _ diet : String) -> Veg {
    let obj = Veg()
    obj.id = id
    obj.foodName = foodName
    obj.availableQuantity = availableQuantity
    obj.price = price
    obj.details = details
    obj.type = type
    obj.diet = diet
    
    return obj
}


func nonVeg (_ id : Int, _ foodName : String, _ availableQuantity : Int, _ price : Int, _ details : String, _ type : String, _ types : String, _ mainCourse : String) -> Chicken {
    let obj = Chicken()
    obj.id = id
    obj.foodName = foodName
    obj.availableQuantity = availableQuantity
    obj.price = price
    obj.details = details
    obj.type = type
    obj.types = types
    obj.mainCourse = mainCourse
    
    return obj
}


func iceCreams (_ id : Int, _ foodName : String, _ availableQuantity : Int, _ price : Int, _ details : String, _ type : String, _ flavor : String, _ typeOfIceCreams : String) -> Vennila {
    let obj = Vennila()
    obj.id = id
    obj.foodName = foodName
    obj.availableQuantity = availableQuantity
    obj.price = price
    obj.details = details
    obj.type = type
    obj.flavors = flavor
    obj.typeOfIceCreams = typeOfIceCreams
    
    return obj
}


func juice (_ id : Int, _ foodName : String, _ availableQuantity : Int, _ price : Int, _ details : String, _ type : String, _ greenGroceries : String) -> Juice {
    let obj = Juice()
    obj.id = id
    obj.foodName = foodName
    obj.availableQuantity = availableQuantity
    obj.price = price
    obj.details = details
    obj.type = type
    obj.greenGroceries = greenGroceries
    
    return obj
}
