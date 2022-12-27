//
//  CustomerCore.swift
//  
//
//  Created by 카카오VX on 2022/12/19.
//

import ComposableArchitecture
import DrinkCore
import StandCore

public struct Customer: ReducerProtocol {
    public struct State: Equatable {
        public var alert: AlertState<Action>?
        public var balance: Int
        public var history: [Drink]
        public var stand: Stand.State
        public let drinkMapper: DrinkMapper
        
        public init(alert: AlertState<Action>? = nil,
                    balance: Int = 0,
                    history: [Drink] = [],
                    stand: Stand.State = Stand.State(),
                    drinkMapper: DrinkMapper = DrinkMapper()) {
            self.alert = alert
            self.balance = balance
            self.history = history
            self.stand = stand
            self.drinkMapper = drinkMapper
        }
    }
    
    public enum Action: Equatable {
        case alertDismissed
        case insert(balance: Int)
        case buy(name: String)
        case request(Stand.Action)
    }
    
    public init() {}
    
    public var body: some ReducerProtocol<State, Action> {
        Scope(state: \.stand, action: /Action.request) {
            Stand()
        }
        
        Reduce { state, action in
            switch action {
            case .alertDismissed:
                state.alert = nil
                return .none
                
            case let .insert(balance):
                state.balance += balance
                return .none
                
            case let .buy(name):
                guard let drinkType = state.drinkMapper.map(name: name) else { return .none }
                guard let product = DrinkFactory.produce(with: drinkType) else { return .none }
                
                guard let stock = state.stand.stocks[product.name], !stock.isEmpty else {
                    state.alert = AlertState(title: TextState("🥲 재고가 부족합니다."))
                    return .none
                }
                guard product.price <= state.balance else {
                    state.alert = AlertState(title: TextState("잔액이 부족합니다.\n\(product.name) 가격: \(product.price)원"))
                    return .none
                }
                
                state.balance -= product.price
                state.history.append(product)
                
                return .task {
                    .request(.removeStock(product))
                }
                
            case .request:
                return .none
            }
        }
    }
}
