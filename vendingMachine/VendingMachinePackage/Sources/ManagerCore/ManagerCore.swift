//
//  ManagerCore.swift
//  
//
//  Created by 카카오VX on 2022/12/19.
//

import ComposableArchitecture
import StandCore
import DrinkCore
import DataAnalyzeClient

//MARK: - Manager Featrue Domain
public struct Manager: ReducerProtocol {
    public struct State: Equatable {
        public var stand: Stand.State
        public var history: [Drink]
        public var analyzedHistory: [AnalyzedHistory] = []
        public let drinkMapper: DrinkMapper
        
        public init(stand: Stand.State = Stand.State(),
                    history: [Drink] = [],
                    drinkMapper: DrinkMapper = DrinkMapper()) {
            self.stand = stand
            self.history = history
            self.drinkMapper = drinkMapper
        }
    }
    
    public enum Action: Equatable {
        case produce(_ name: String)
        case request(Stand.Action)
        case onAppear
        case analyzeReponse(history: [AnalyzedHistory])
    }
    
    public init() {}
    
    @Dependency(\.dataAnalyzeClient) var dataAnalyzeClient
    
    public var body: some ReducerProtocol<State, Action> {
        Scope(state: \.stand, action: /Action.request) {
            Stand()
        }
        
        Reduce { state, action in
            switch action {
            case let .produce(name):
                guard let drinkType = state.drinkMapper.map(name: name) else { return .none }
                guard let product = DrinkFactory.produce(with: drinkType) else { return .none }
                return .task {
                    .request(.addStock(product))
                }
                
            case .request:
                return .none
                
            case .onAppear:
                return .task { [history = state.history] in
                    .analyzeReponse(
                        history: self.dataAnalyzeClient.analyze(history)
                    )
                }
                
            case let .analyzeReponse(analyzedHistory):
                state.analyzedHistory = analyzedHistory
                return .none
            }
        }
    }
}
