//
//  VendingMachineCore.swift
//  
//
//  Created by 카카오VX on 2022/12/19.
//

import ComposableArchitecture
import CustomerCore
import DrinkCore
import ManagerCore

public struct VendingMachine: ReducerProtocol {
    public enum Mode { case customer, manager }
    
    public struct State: Equatable {
        public var alert: AlertState<Customer.Action>?
        public var balance: Int = 0
        public var history: [Drink] = []
        public var customer: Customer.State {
            get {
                Customer.State(
                    alert: self.alert,
                    balance: self.balance,
                    history: self.history,
                    stand: manager.stand,
                    drinkMapper: DrinkMapper()
                )
            }
            set {
                self.alert = newValue.alert
                self.balance = newValue.balance
                self.history = newValue.history
                self.manager = Manager.State(
                    stand: newValue.stand,
                    history: self.history,
                    drinkMapper: DrinkMapper()
                )
                self.currentMode = .customer
            }
        }
        public var manager: Manager.State
        public var currentMode: Mode = .customer
        
        public init(manager: Manager.State) {
            self.manager = manager
        }
    }
    
    public enum Action {
        case switchMode(Mode)
        case customer(Customer.Action)
        case manager(Manager.Action)
    }
    
    public init() {}
    
    public var body: some ReducerProtocol<State, Action> {
        Scope(state: \.customer, action: /Action.customer) {
            Customer()
        }
        
        Scope(state: \.manager, action: /Action.manager) {
            Manager()
        }
        
        Reduce { state, action in
            switch action {
            case let .switchMode(mode):
                state.currentMode = mode
                return .none
                
            case .customer:
                return .none
                
            case .manager:
                return .none
            }
        }
    }
}
