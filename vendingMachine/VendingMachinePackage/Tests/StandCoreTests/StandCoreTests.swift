//
//  StandCoreTests.swift
//  
//
//  Created by 카카오VX on 2022/12/26.
//

import XCTest
import DrinkCore
import ComposableArchitecture
@testable import StandCore

@MainActor
final class StandCoreTests: XCTestCase {
    let coke: Drink = Coke()
    let cider: Drink = Cider()
    
    func testFlow_Cutomer_Stocks_Intergration() async {
        let store = TestStore(
            initialState: Stand.State(),
            reducer: Stand()
        )
        
        let addedCoke = ["콜라" : [coke]]
        let addedCider = ["콜라" : [coke], "사이다" : [cider]]
        
        await store.send(.addStock(coke)) {
            $0.stocks = addedCoke
        }
        
        await store.send(.addStock(cider)) {
            $0.stocks = addedCider
        }
        
        let removedCoke = ["콜라" : [], "사이다" : [cider]]
        
        await store.send(.removeStock(coke)) {
            $0.stocks = removedCoke
        }
    }
    
    func test_addStock() async {
        let store = TestStore(
            initialState: Stand.State(),
            reducer: Stand()
        )
        
        let addedCoke = ["콜라" : [coke]]
        
        await store.send(.addStock(coke)) {
            $0.stocks = addedCoke
        }
    }
    
    func test_removeStock() async {
        let store = TestStore(
            initialState: Stand.State(
                stocks: ["콜라" : [coke], "사이다" : [cider]]
            ),
            reducer: Stand()
        )
        
        let removedCoke = ["콜라" : [], "사이다" : [cider]]
        
        await store.send(.removeStock(coke)) {
            $0.stocks = removedCoke
        }
    }
}
