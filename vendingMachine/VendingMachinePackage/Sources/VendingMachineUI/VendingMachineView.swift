//
//  VendingMachineView.swift
//  
//
//  Created by 카카오VX on 2022/12/19.
//

import SwiftUI
import ComposableArchitecture
import VendingMachineCore
import ManagerUI
import CustomerUI

public struct VendingMachineView: View {
    let store: StoreOf<VendingMachine>
    
    public init(store: StoreOf<VendingMachine>) {
        self.store = store
    }
    
    public var body: some View {
        VStack {
            WithViewStore(self.store, observe: \.currentMode) { viewStore in
                HStack {
                    Spacer()
                    
                    Image("간판")
                        .resizable()
                        .frame(width: 90, height: 90)
                        .padding(.trailing, 20)
                    
                    Text("희준이네")
                        .font(.system(size: 90, weight: .bold))
                        .foregroundColor(.purple)
                    
                    Spacer()
                }
                .padding()
                
                Picker("Mode", selection: viewStore.binding(send: VendingMachine.Action.switchMode)) {
                    Text("Customer")
                        .tag(VendingMachine.Mode.customer)
                    
                    Text("Manager")
                        .tag(VendingMachine.Mode.manager)
                }
                .pickerStyle(.segmented)
                .frame(maxWidth: 400)
                
                if viewStore.state == .manager {
                    NavigationView {
                        ManagerView(store: self.store.scope(state: \.manager, action: VendingMachine.Action.manager))
                    }
                    .navigationViewStyle(.stack)
                }
                
                if viewStore.state == .customer {
                    NavigationView {
                        CustomerView(store: self.store.scope(state: \.customer, action: VendingMachine.Action.customer))
                    }
                    .navigationViewStyle(.stack)
                }
            }
        }
    }
}
