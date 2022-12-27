//
//  ContentView.swift
//  vendingMachine
//
//  Created by 카카오VX on 2022/11/07.
//

import SwiftUI
import ComposableArchitecture
import VendingMachineUI
import VendingMachineCore
import ManagerCore
import DrinkCore
import StandCore

struct ContentView: View {
    private let stand = Stand.State()
    private let drinkMapper = DrinkMapper()
    
    var body: some View {
        VendingMachineView(store: Store(initialState:
                                            VendingMachine.State(manager:
                                                                    Manager.State(
                                                                        stand: stand,
                                                                        history: [],
                                                                        drinkMapper: drinkMapper)),
                                        reducer: VendingMachine()))
    }
}
