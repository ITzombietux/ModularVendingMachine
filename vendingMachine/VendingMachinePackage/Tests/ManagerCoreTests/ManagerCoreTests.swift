//
//  ManagerCoreTests.swift
//  
//
//  Created by 카카오VX on 2022/12/27.
//

import ComposableArchitecture
import XCTest
import StandCore
import DrinkCore
import DataAnalyzeClient
@testable import ManagerCore

@MainActor
final class ManagerCoreTests: XCTestCase {
    func test_produceDrink() async {
        let store = TestStore(
            initialState: Manager.State(),
            reducer: Manager()
        )
        
        let coke: Drink = Coke()
        
        await store.send(.produce("콜라"))
        await store.receive(.request(.addStock(coke))) {
            $0.stand.stocks = ["콜라" : [coke]]
        }
    }
    
    func test_onAppear() async {
        let coke: Drink = Coke()
        let cider: Drink = Cider()
        let history: [Drink] = [coke, cider]
        let analyzedHistory = [AnalyzedHistory(id: UUID(uuidString: "DEADBEEF-DEAD-BEEF-DEAD-DEADBEEFDEAD")!, name: "콜라", products: [coke]),
                               AnalyzedHistory(id: UUID(uuidString: "DEADBEEF-DEAD-BEEF-DEAD-DEADBEEFDEAF")!, name: "사이다", products: [cider])]
        
        let store = TestStore(
            initialState: Manager.State(history : history),
            reducer: Manager()
        )
        
        store.dependencies.dataAnalyzeClient.analyze = { _ in
            analyzedHistory
        }
        
        await store.send(.onAppear)
        
        await store.receive(.analyzeReponse(history: analyzedHistory)) {
            $0.analyzedHistory = analyzedHistory
        }
    }
}

