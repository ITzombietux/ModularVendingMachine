//
//  ManagerView.swift
//  
//
//  Created by 카카오VX on 2022/12/19.
//

import SwiftUI
import ComposableArchitecture
import ManagerCore
import DrinkCore

// MARK: - Stand Feature View
public struct ManagerView: View {
    let store: StoreOf<Manager>
    
    public init(store: StoreOf<Manager>) {
        self.store = store
    }
    
    public var body: some View {
        WithViewStore(self.store, observe: { $0 }) { viewStore in
            VStack(alignment: .leading) {
                ScrollView {
                    HStack(alignment: .bottom, spacing: 40) {
                        ForEach(StandForm.display()) { drink in
                            ManagingStockView(store: self.store, name: drink.name)
                        }
                    }
                }
                
                Spacer()
                
                ChartView(analyzedHistory: viewStore.analyzedHistory)
            }
            .onAppear {
                viewStore.send(.onAppear)
            }
        }
    }
}

//struct ManagerView_Previews: PreviewProvider {
//    static var previews: some View {
//        ManagerView(store:
//                        Store(
//                            initialState: Manager.State(stand: Stand.State(), history: [], analyzedHistory: [], drinkMapper: DrinkMapper()),
//                            reducer: Manager()))
//    }
//}
