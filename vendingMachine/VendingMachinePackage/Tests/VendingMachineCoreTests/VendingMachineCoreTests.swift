//
//  VendingMachineCoreTests.swift
//  
//
//  Created by 카카오VX on 2022/12/27.
//

import XCTest
import DrinkCore
import CustomerCore
import ManagerCore
import ComposableArchitecture
@testable import VendingMachineCore

@MainActor
final class VendingMachineCoreTests: XCTestCase {
    func test_switchMode() async {
        let store = TestStore(
            initialState: VendingMachine.State(
                manager: Manager.State()
            ),
            reducer: VendingMachine()
        )
        
        await store.send(.switchMode(.manager)) {
            $0.currentMode = .manager
        }
    }
}

