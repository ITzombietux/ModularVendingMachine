//
//  BuyingDrinkView.swift
//  
//
//  Created by 카카오VX on 2022/12/19.
//

import SwiftUI
import ComposableArchitecture
import CustomerCore

public struct BuyingDrinkView: View {
    let store: StoreOf<Customer>
    let name: String
    
    public init(store: StoreOf<Customer>, name: String) {
        self.store = store
        self.name = name
    }
    
    public var body: some View {
        WithViewStore(self.store, observe: \.stand.stocks) { viewStore in
            VStack {
                Button("구매") {
                    viewStore.send(.buy(name: name))
                }
                
                Image(name)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                
                Circle()
                    .foregroundColor(viewStore.state[name]?.count ?? 0 > 0 ? .green : .red)
                    .frame(width: 25)
            }
            .scaledToFit()
            .frame(width: 120, height: 180)
            .padding(.top, 30)
        }
    }
}

//struct BuyingDrinkView_Previews: PreviewProvider {
//    static var previews: some View {
//        BuyingDrinkView(store:
//                            Store(
//                                initialState: Customer.State(balance: 0,
//                                                             history: [],
//                                                             stand: Stand.State(),
//                                                             drinkMapper: DrinkMapper()),
//                                reducer: Customer()),
//                        name: "콜라")
//    }
//}
