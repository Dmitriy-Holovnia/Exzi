//
//  ChartPanelView.swift
//  Exzi
//
//  Created by Dmitriy Holovnia on 18.02.2024.
//

import SwiftUI

struct ChartPanelView: View {
    @Binding var percent: Double
    @Binding var price: Double
    @State private var chartData = [ChartData]()
    @State private var maxYValue = 0
    @State private var minYValue = 0
    @State private var buyOrderBook = [BookOffer]()
    @State private var sellOrderBook = [BookOffer]()
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        ZStack {
            Color.mainBlue.ignoresSafeArea()
            
            VStack(spacing: 0) {
                // Nav bar
                HStack(spacing: 0) {
                    Image(.backNavigationIcon)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 14)
                        .padding(.trailing, 12)
                        .onTapGesture {
                            dismiss()
                        }
                    
                    Image(.tradeIcon)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 18)
                    
                    Text("BTC/USDT")
                        .foregroundStyle(.white)
                        .font(.system(size: 18, weight: .semibold))
                        .padding(.leading, 8)
                        .offset(x: -2)
                    
                    Spacer()
                    
                    Image(.favIcon)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 17)
                        .padding(.trailing, 12)
                    
                    Image(.shareIcon)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 17)
                }
                .padding(.horizontal, 20)
                
                HStack(spacing: 16) {
                    Text("Chart")
                        .foregroundColor(.white)
                        .font(.system(size: 13, weight: .semibold))
                    
                    Text("Info")
                        .foregroundColor(.mainLightGray2)
                        .font(.system(size: 13, weight: .semibold))
                    
                    Spacer()
                }
                .padding(.horizontal, 16)
                .padding(.top, 18)
                
                Rectangle()
                    .fill(Color.mainGray)
                    .frame(height: 1)
                    .overlay(alignment: .leading) {
                        RoundedRectangle(cornerRadius: 1.5)
                            .fill(Color.mainBlue1)
                            .frame(width: 22, height: 3)
                            .padding(.leading, 23)
                    }
                    .padding(.top, 10)
                
                ScrollView {
                    HStack {
                        VStack(alignment: .leading, spacing: 7) {
                            Text("\(price.value)")
                                .foregroundColor(.mainGreen)
                                .font(.system(size: 26, weight: .semibold))
                            
                            HStack {
                                Text("=$\(price.value))")
                                    .foregroundColor(.mainLightGray2)
                                    .font(.system(size: 13, weight: .medium))
                                
                                Text("+\(percent)%")
                                    .foregroundColor(.mainGreen)
                                    .font(.system(size: 11, weight: .medium))
                            }
                        }
                        
                        Spacer()
                        
                        VStack(alignment: .leading, spacing: 0) {
                            Text("24h High")
                                .foregroundColor(.mainLightGray1)
                                .font(.system(size: 9.5, weight: .medium))
                            
                            Text("43.787,18")
                                .foregroundColor(.white)
                                .font(.system(size: 11, weight: .medium))
                                .padding(.bottom, 5)
                            
                            Text("24h Amount(BTC)")
                                .foregroundColor(.mainLightGray1)
                                .font(.system(size: 9.5, weight: .medium))
                            
                            Text("3.762,10")
                                .foregroundColor(.white)
                                .font(.system(size: 11, weight: .medium))
                        }
                        .padding(.trailing, 7)
                        
                        VStack(alignment: .leading, spacing: 0) {
                            Text("24h Low")
                                .foregroundColor(.mainLightGray1)
                                .font(.system(size: 9.5, weight: .medium))
                            
                            Text("42.421,09")
                                .foregroundColor(.white)
                                .font(.system(size: 11, weight: .medium))
                                .padding(.bottom, 5)
                            
                            Text("24h Volume(USDT)")
                                .foregroundColor(.mainLightGray1)
                                .font(.system(size: 9.5, weight: .medium))
                            
                            Text("112.76M")
                                .foregroundColor(.white)
                                .font(.system(size: 11, weight: .medium))
                        }
                    }
                    .padding(.horizontal, 16)
                    .padding(.top, 16)
                    
                    HStack(spacing: 12) {
                        Text("Line")
                            .foregroundColor(.mainLightGray1)
                            .font(.system(size: 12, weight: .medium))
                        
                        Text("15m")
                            .foregroundColor(.mainLightGray1)
                            .font(.system(size: 12, weight: .medium))
                        
                        Text("1h")
                            .foregroundColor(.mainLightGray1)
                            .font(.system(size: 12, weight: .medium))
                        
                        Text("4h")
                            .foregroundColor(.mainLightGray1)
                            .font(.system(size: 12, weight: .medium))
                        
                        Text("1d")
                            .foregroundColor(.mainLightGray1)
                            .font(.system(size: 12, weight: .medium))
                        
                        Text("1w")
                            .foregroundColor(.mainLightGray1)
                            .font(.system(size: 12, weight: .medium))
                        
                        HStack(spacing: 3) {
                            Text("More")
                                .foregroundColor(.mainLightGray1)
                                .font(.system(size: 12, weight: .medium))
                            
                            Image(.arrowDownIcon)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 8)
                        }
                        
                        Text("Depth")
                            .foregroundColor(.mainLightGray1)
                            .font(.system(size: 12, weight: .medium))
                        
                        Spacer()
                    }
                    .padding(.horizontal, 16)
                    .padding(.top, 19)
                    
                    ChartView(chartData: $chartData,
                              maxYValue: $maxYValue,
                              minYValue: $minYValue)
                    .frame(height: 310)
                    .padding(.horizontal, 16)
                    
                    Image(.dailyVolume)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 116)
                        .padding(.top, 8)
                    
                    HStack {
                        Text("MA")
                            .foregroundColor(.white)
                            .font(.system(size: 12, weight: .medium))
                        
                        Spacer()
                        
                        Text("EMA")
                            .foregroundColor(.mainLightGray1)
                            .font(.system(size: 12, weight: .medium))
                        
                        Spacer()
                        
                        Text("BOLL")
                            .foregroundColor(.mainLightGray1)
                            .font(.system(size: 12, weight: .medium))
                        
                        Spacer()
                        
                        Capsule()
                            .fill(.mainLightGray1)
                            .frame(width: 1, height: 16)
                        
                        Spacer()
                        
                        Text("VOL")
                            .foregroundColor(.mainLightGray1)
                            .font(.system(size: 12, weight: .medium))
                        
                        Spacer()
                        
                        Text("MACD")
                            .foregroundColor(.mainLightGray1)
                            .font(.system(size: 12, weight: .medium))
                        
                        Spacer()
                        
                        Text("KDJ")
                            .foregroundColor(.mainLightGray1)
                            .font(.system(size: 12, weight: .medium))
                        
                        Spacer()
                        
                        Text("RSI")
                            .foregroundColor(.white)
                            .font(.system(size: 12, weight: .medium))
                        
                        Spacer()
                        
                        Text("WR")
                            .foregroundColor(.mainLightGray1)
                            .font(.system(size: 12, weight: .medium))
                    }
                    .padding(.horizontal, 16)
                    .padding(.top, 12)
                    
                    HStack(spacing: 16) {
                        Text("Order Book")
                            .foregroundColor(.white)
                            .font(.system(size: 13, weight: .semibold))
                        
                        Text("Recent Trading")
                            .foregroundColor(.mainLightGray2)
                            .font(.system(size: 13, weight: .semibold))
                        
                        Spacer()
                    }
                    .padding(.horizontal, 16)
                    .padding(.top, 24)
                    
                    Rectangle()
                        .fill(Color.mainGray)
                        .frame(height: 1)
                        .overlay(alignment: .leading) {
                            RoundedRectangle(cornerRadius: 1.5)
                                .fill(Color.white)
                                .frame(width: 49, height: 3)
                                .padding(.leading, 14)
                        }
                        .padding(.top, 8)
                        .padding(.horizontal, 16)
                    
                    ChartOrderView(buyOrderBook: $buyOrderBook,
                                   sellOrderBook: $sellOrderBook)
                    
                    Spacer()
                }
            }
        }
        .navigationBarHidden(true)
        .onAppear {
            fetchCandlesData()
            fetchOrderBookData()
        }
    }
    
    func fetchOrderBookData() {
        Task {
            do {
                let data = try await NetworkManager.shared.fetchObject(type: BookResponse.self, endpoint: .book)
                buyOrderBook = data.buy.reversed()
                sellOrderBook = data.sell
            } catch {
                print("Error \(#function): \(error.localizedDescription)")
            }
        }
    }
    
    func fetchCandlesData() {
        Task {
            do {
                var data = try await NetworkManager.shared.fetchObject(type: [ChartData].self, endpoint: .chart)
                data.sort(by: { $0.date > $1.date })
                let dataToShow = Array(data[(data.count - 30)...(data.count - 1)])
                minYValue = (dataToShow.map({ $0.low }).min() ?? 0) / 100_000_000 - 2_000
                maxYValue = (dataToShow.map({ $0.high }).max() ?? 0) / 100_000_000 + 2_000
                chartData = dataToShow
            } catch {
                print("Error \(#function): \(error.localizedDescription)")
            }
        }
    }
}

#Preview {
    ChartPanelView(percent: .constant(2.42), price: .constant(42.422))
}
