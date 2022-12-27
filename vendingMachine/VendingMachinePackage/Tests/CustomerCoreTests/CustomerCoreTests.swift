//
//  CustomerCoreTests.swift
//  
//
//  Created by 카카오VX on 2022/12/27.
//

import ComposableArchitecture
import XCTest
import StandCore
import DrinkCore
@testable import CustomerCore

@MainActor
final class CustomerCoreTests: XCTestCase {
    func test_InsertBalance() {
        let store = TestStore(
            initialState: Customer.State(),
            reducer: Customer()
        )
                
        store.send(.insert(balance: 5000)) {
            $0.balance = 5000
        }
    }
    
    func test_buyDrink() async {
        let coke: Drink = Coke()
        let cider: Drink = Cider()
        let stocks = ["콜라" : [coke], "사이다" : [cider]]
        
        let store = TestStore(
            initialState: Customer.State(
                balance: 5000,
                stand: Stand.State(stocks: stocks)
            ),
            reducer: Customer()
        )
        
        await store.send(.buy(name: "콜라")) {
            $0.history = [coke]
            $0.balance = 2900
        }
        
        await store.receive(.request(.removeStock(coke))) {
            $0.stand.stocks = ["콜라" : [], "사이다" : [cider]]
        }
    }
}
