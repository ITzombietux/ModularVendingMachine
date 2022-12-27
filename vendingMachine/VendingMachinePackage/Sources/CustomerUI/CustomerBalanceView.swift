//
//  CustomerBalanceView.swift
//  
//
//  Created by 카카오VX on 2022/12/19.
//

import SwiftUI
import ComposableArchitecture
import CustomerCore

public struct CustomerBalanceView: View {
    let store: StoreOf<Customer>
    
    public init(store: StoreOf<Customer>) {
        self.store = store
    }
    
    public var body: some View {
        WithViewStore(self.store, observe: \.balance) { viewStore in
            VStack(spacing: 25) {
                HStack(spacing: 15) {
                    Button("+1,000원") {
                        viewStore.send(.insert(balance: 1000))
                    }
                    .font(.system(size: 20, weight: .semibold))
                    
                    Button("+5,000원") {
                        viewStore.send(.insert(balance: 5000))
                    }
                    .font(.system(size: 20, weight: .semibold))
                }
                
                Text("잔액 : \(viewStore.state)원")
                    .font(.system(size: 25, weight: .bold))
            }
            .frame(width: 300, height: 300)
        }
    }
}

//struct CustomerBalanceView_Previews: PreviewProvider {
//    static var previews: some View {
//        CustomerBalanceView(
//            store: Store(
//                initialState: Customer.State(balance: 0, history: [],
//                                             stand: Stand.State(),
//                                             drinkMapper: DrinkMapper()),
//                reducer: Customer()
//            ))
//    }
//}
