//
//  ManagingStockView.swift
//  
//
//  Created by 카카오VX on 2022/12/19.
//

import SwiftUI
import ComposableArchitecture
import ManagerCore

public struct ManagingStockView: View {
    let store: StoreOf<Manager>
    let name: String

    public var body: some View {
        WithViewStore(self.store, observe: \.stand.stocks) { viewStore in
            VStack {
                Button("추가") {
                    viewStore.send(.produce(name))
                }
                
                Image(name)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                
                Text("\(viewStore.state[name]?.count ?? 0)개")
            }
            .scaledToFit()
            .frame(width: 180, height: 200)
            .padding(.top, 30)
        }
    }
}

//struct ManagingStockView_Previews: PreviewProvider {
//    static var previews: some View {
//        ManagingStockView(store: Store(initialState: Manager.State(stand: Stand.State(), history: [], drinkMapper: DrinkMapper()), reducer: Manager()), name: "콜라")
//    }
//}

