//
//  DataAnalyzeClient.swift
//  
//
//  Created by 카카오VX on 2022/12/19.
//

import Dependencies
import XCTestDynamicOverlay
import Foundation
import DrinkCore

public struct AnalyzedHistory {
    public let id: UUID
    public let name: String
    public let products: [Drink]
    
    public init(id: UUID, name: String, products: [Drink]) {
        self.id = id
        self.name = name
        self.products = products
    }
}

extension AnalyzedHistory: Equatable, Identifiable { }

public struct DataAnalyzeClient {
    public var analyze: ([Drink]) -> [AnalyzedHistory]
    
    public init(analyze: @escaping ([Drink]) -> [AnalyzedHistory]) {
        self.analyze = analyze
    }
}

extension DataAnalyzeClient: TestDependencyKey {
    public static let testValue = Self(
        analyze: unimplemented("\(Self.self).analyze")
    )
}

extension DependencyValues {
    public var dataAnalyzeClient: DataAnalyzeClient {
        get { self[DataAnalyzeClient.self] }
        set { self[DataAnalyzeClient.self] = newValue }
    }
}
