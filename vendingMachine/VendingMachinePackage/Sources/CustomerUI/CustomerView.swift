//
//  CustomerView.swift
//  
//
//  Created by 카카오VX on 2022/12/19.
//

import SwiftUI
import ComposableArchitecture
import CustomerCore
import DrinkCore
import StandCore

public struct CustomerView: View {
    let store: StoreOf<Customer>
    
    public init(store: StoreOf<Customer>) {
        self.store = store
    }
    
    struct ViewState: Equatable {
        var alert: AlertState<Customer.Action>?
        var history: [Drink]
        var balance: Int
        var stand: Stand.State
        
        init(state: Customer.State) {
            self.alert = state.alert
            self.history = state.history
            self.balance = state.balance
            self.stand = state.stand
        }
    }
    
    public var body: some View {
        WithViewStore(self.store) { viewStore in
            VStack(alignment: .leading) {
                HStack(alignment: .top, spacing: 20) {
                    ScrollView {
                        HStack(alignment: .bottom, spacing: 40) {
                            ForEach(StandForm.display()) { drink in
                                BuyingDrinkView(store: self.store, name: drink.name)
                            }
                        }
                    }
                    
                    CustomerBalanceView(store: self.store)
                }
                
                Spacer()
                
                Text("구매 내역")
                    .font(.system(size: 30, weight: .bold))
                
                ScrollView {
                    HStack(alignment: .bottom, spacing: -30) {
                        ForEach(viewStore.history) { drink in
                            Image(drink.name)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 120, height: 180)
                        }
                    }
                }
            }
            .alert(self.store.scope(state: \.alert), dismiss: .alertDismissed)
        }
    }
}

//struct CustomerView_Previews: PreviewProvider {
//    static var previews: some View {
//        CustomerView(
//            store: Store(
//                initialState: Customer.State(balance: 0,
//                                             history: [],
//                                             stand: Stand.State(),
//                                             drinkMapper: DrinkMapper()),
//                reducer: Customer()
//            ))
//    }
//}
