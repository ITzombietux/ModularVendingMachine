//
//  CustomerUITests.swift
//  
//
//  Created by 카카오VX on 2022/12/27.
//

import ComposableArchitecture
import XCTest
import CustomerCore
import StandCore
import DrinkCore
@testable import CustomerUI

@MainActor
final class CustomerUITests: XCTestCase {
    let leakOfStocksStore = TestStore(
        initialState: Customer.State(),
        reducer: Customer()
    )
    .scope(state: CustomerView.ViewState.init)
    
    let leakOfBalanceStore = TestStore(
        initialState: Customer.State(
            stand: Stand.State(
                stocks: ["콜라" : [Coke()]]
            )
        ),
        reducer: Customer()
    )
    .scope(state: CustomerView.ViewState.init)
    
    func testFlow_leak_of_stocks() async {
        await leakOfStocksStore.send(.insert(balance: 1000)) {
            $0.balance = 1000
        }
        
        await leakOfStocksStore.send(.buy(name: "콜라")) {
            $0.alert = AlertState(title: TextState("🥲 재고가 부족합니다."))
        }
    }
    
    func testFlow_leak_of_balance() async {
        await leakOfBalanceStore.send(.insert(balance: 1000)) {
            $0.balance = 1000
        }
        
        await leakOfBalanceStore.send(.buy(name: "콜라")) {
            $0.alert = AlertState(title: TextState("잔액이 부족합니다.\n콜라 가격: 2100원"))
        }
    }
}
