//
//  ChartView.swift
//  
//
//  Created by 카카오VX on 2022/12/19.
//

import SwiftUI
import Charts
import DataAnalyzeClient

public struct ChartView: View {
    let analyzedHistory: [AnalyzedHistory]
    
    public var body: some View {
        VStack {
            Text("판매 차트")
                .font(.system(size: 30, weight: .bold))
            
            Chart(self.analyzedHistory) {
                BarMark(
                    x: .value("Drink", $0.name),
                    y: .value("Count", $0.products.count)
                )
            }
            .chartYScale(range: .plotDimension)
            .frame(width: 400)
        }
    }
}

struct ChartView_Previews: PreviewProvider {
    static var previews: some View {
        ChartView(analyzedHistory: [])
    }
}
