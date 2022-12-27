//
//  Drink.swift
//  
//
//  Created by 카카오VX on 2022/12/19.
//

import Foundation

//MARK: - depth 1
public class Drink {
    public let name: String
    public let manufacturedAt: Date
    public let price: Int
    public let volume: Int
    public let calories: Int
    public let temparature: Int
    
    init(name: String, manufacturedAt: Date, price: Int, volume: Int, calories: Int, temparature: Int) {
        self.name = name
        self.manufacturedAt = manufacturedAt
        self.price = price
        self.volume = volume
        self.calories = calories
        self.temparature = temparature
    }
}

extension Drink: Equatable, Identifiable, Sendable {
    public static func == (lhs: Drink, rhs: Drink) -> Bool {
        true
    }
}

//MARK: - depth 2

public class Milk: Drink {
    public let fat: Double
    
    public init(name: String, manufacturedAt: Date, price: Int, volume: Int, calories: Int, temparature: Int, fat: Double) {
        self.fat = fat
        super.init(name: name, manufacturedAt: manufacturedAt, price: price, volume: volume, calories: calories, temparature: temparature)
    }
    
    public func isLowFat(standard: Double) -> Bool {
        self.fat <= standard ? true : false
    }
}

public class Coffee: Drink {
    public let caffeinContent: Int
    
    public init(name: String, manufacturedAt: Date, price: Int, volume: Int, calories: Int, temparature: Int, caffeinContent: Int) {
        self.caffeinContent = caffeinContent
        super.init(name: name, manufacturedAt: manufacturedAt, price: price, volume: volume, calories: calories, temparature: temparature)
    }
    
    public func isDecaffeined(standard: Int) -> Bool {
        self.caffeinContent < standard ? true : false
    }
}

public class Soda: Drink {
    public let package: Packages
    
    public enum Packages: String {
        case glass = "glass"
        case can = "can"
        case pet = "pet"
    }
    
    public init(name: String, manufacturedAt: Date, price: Int, volume: Int, calories: Int, temparature: Int, package: Packages) {
        self.package = package
        super.init(name: name, manufacturedAt: manufacturedAt, price: price, volume: volume, calories: calories, temparature: temparature)
    }
}

//MARK: - depth 3
public class Banana: Milk, Drinkable {
    public let countryOfOrigin: String
    
    public init(countryOfOrigin: String) {
        self.countryOfOrigin = countryOfOrigin
        super.init(name: "바나나우유",
                   manufacturedAt: Date().addingTimeInterval(800000),
                   price: 1200,
                   volume: 300,
                   calories: 150,
                   temparature: 3,
                   fat: 1)
    }
    
    public required convenience init() {
        self.init(countryOfOrigin: "필리핀")
    }
}

public class Strawberry: Milk, Drinkable {
    public let strawberryContent: Int
    
    public init(strawberryContent: Int) {
        self.strawberryContent = strawberryContent
        super.init(name: "딸기우유",
                   manufacturedAt: Date().addingTimeInterval(800000),
                   price: 1400,
                   volume: 350,
                   calories: 200,
                   temparature: 3,
                   fat: 2)
    }
    
    public required convenience init() {
        self.init(strawberryContent: 50)
    }
}

public class Latte: Coffee, Drinkable {
    public let brand: Brand
    
    public enum Brand: String {
        case ediya = "ediya"
        case starbucks = "starbucks"
    }
    
    public init(brand: Brand) {
        self.brand = brand
        super.init(name: "라떼",
                   manufacturedAt: Date().addingTimeInterval(800000),
                   price: 4000,
                   volume: 355,
                   calories: 180,
                   temparature: 5,
                   caffeinContent: 100)
    }
    
    public required convenience init() {
        self.init(brand: .ediya)
    }
}

public class Americano: Coffee, Drinkable {
    public let coffeeBean: CoffeeBean
    
    public enum CoffeeBean: String {
        case brazil = "brazil"
        case kenya = "kenya"
    }
    
    public init(coffeeBean: CoffeeBean) {
        self.coffeeBean = coffeeBean
        super.init(name: "아메리카노",
                   manufacturedAt: Date().addingTimeInterval(800000),
                   price: 2000,
                   volume: 355,
                   calories: 0,
                   temparature: 40,
                   caffeinContent: 100)
    }
    
    public required convenience init() {
        self.init(coffeeBean: .brazil)
    }
}

public class Coke: Soda, Drinkable {
    public let sugar: Int
    
    public init(sugar: Int) {
        self.sugar = sugar
        super.init(name: "콜라",
                   manufacturedAt: Date().addingTimeInterval(800000),
                   price: 2100,
                   volume: 500,
                   calories: 120,
                   temparature: 3,
                   package: .pet)
    }
    
    public required convenience init() {
        self.init(sugar: 5)
    }
}

public class Cider: Soda, Drinkable {
    public let brand: Brand
    
    public enum Brand: String {
        case chilsung = "chilsung"
        case sprite = "sprite"
    }
    
    public init(brand: Brand) {
        self.brand = brand
        super.init(name: "사이다",
                   manufacturedAt: Date().addingTimeInterval(800000),
                   price: 2100,
                   volume: 500,
                   calories: 100,
                   temparature: 3,
                   package: .pet)
    }
    
    public required convenience init() {
        self.init(brand: .chilsung)
    }
}
