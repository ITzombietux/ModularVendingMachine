//
//  DataAnalyzeClient.swift
//
//
//  Created by 카카오VX on 2022/12/19.
//

import Dependencies
import Foundation
import DrinkCore
import DataAnalyzeClient

extension DataAnalyzeClient: DependencyKey {
    public static let liveValue = Self { history in
        var chartData: [String:[Drink]] = [:]
        
        history.forEach { drink in
            guard chartData[drink.name] == nil else {
                chartData[drink.name]?.append(drink)
                return
            }
            chartData.updateValue([drink], forKey: drink.name)
        }
        
        return chartData.map{ AnalyzedHistory(id: UUID(), name: $0.key, products: $0.value) }
    }
}
