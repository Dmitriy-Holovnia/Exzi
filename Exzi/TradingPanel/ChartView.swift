//
//  ChartView.swift
//  Exzi
//
//  Created by Dmitriy Holovnia on 17.02.2024.
//

import SwiftUI
import Charts

struct ChartView: View {
    
    @Binding var chartData: [ChartData]
    @Binding var maxYValue: Int
    @Binding var minYValue: Int
    
    var body: some View {
        Chart {
            ForEach(chartData, id: \.date) { chart in
                RectangleMark(
                    x: .value("Day", chart.date),
                    yStart: .value("Low Price", chart.low / 100_000_000),
                    yEnd: .value("High Price", chart.high / 100_000_000),
                    width: 2
                )
                .foregroundStyle(chart.open > chart.close ? .red : .green)
                
                RectangleMark(
                    x: .value("Day", chart.date),
                    yStart: .value("Open Price", chart.open / 100_000_000),
                    yEnd: .value("Close Price", chart.close / 100_000_000),
                    width: 10
                )
                .foregroundStyle(chart.open > chart.close ? .red : .green)
            }
        }
        .chartYScale(domain: minYValue...maxYValue, type: .linear)
    }
}
