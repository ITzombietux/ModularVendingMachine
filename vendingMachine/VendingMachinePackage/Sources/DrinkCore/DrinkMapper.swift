//
//  DrinkMapper.swift
//  
//
//  Created by 카카오VX on 2022/12/19.
//

public struct DrinkMapper {
    private var drinks: [String:Drink.Type] = [:]
    
    public init() {
        for drink in StandForm.display() {
            self.drinks[drink.name] = type(of: drink)
        }
    }
    
    public func map(name: String) -> Drink.Type? {
        guard let drinkType = self.drinks[name] else { return nil }
        return drinkType
    }
}

extension DrinkMapper: Equatable {
    public static func == (lhs: DrinkMapper, rhs: DrinkMapper) -> Bool {
        true
    }
}
