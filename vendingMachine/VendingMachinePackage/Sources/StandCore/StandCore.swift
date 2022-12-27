//
//  StandCore.swift
//  
//
//  Created by 카카오VX on 2022/12/19.
//

import ComposableArchitecture
import DrinkCore

public struct Stand: ReducerProtocol, Sendable {
    public struct State: Equatable {
        public var stocks: [String:[Drink]]
        public let standForm: [Drink] = StandForm.display()
        
        public init(stocks: [String:[Drink]] = [:]) {
            self.stocks = stocks
        }
    }
    
    public enum Action: Equatable, Sendable {
        case addStock(_ product: Drink)
        case removeStock(_ product: Drink)
        case checkExpirationDate
    }
    
    public init() {}
    
    public var body: some ReducerProtocol<State, Action> {
        Reduce { state, action in
            switch action {
            case let .addStock(product):
                guard state.stocks[product.name] != nil else {
                    state.stocks.updateValue([product], forKey: product.name)
                    return .none
                }
                state.stocks[product.name]?.append(product)
                return .none
                
            case let .removeStock(product):
                guard state.stocks[product.name] != nil else { return .none }
                _ = state.stocks[product.name]?.removeFirst()
                return .none
                
            case .checkExpirationDate:
                return .none
            }
        }
    }
}
