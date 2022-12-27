//
//  DrinkFactory.swift
//  
//
//  Created by 카카오VX on 2022/12/19.
//

//MARK: - DrinkFactory
public struct DrinkFactory {
    public static func produce(with type: Drink.Type) -> Drink? {
        guard let drink = type as? Drinkable.Type else { return nil }
        guard let product = drink.init() as? Drink else { return nil }
        return product
    }
}

//MARK: - Drinkable
protocol Drinkable {
    init()
}
