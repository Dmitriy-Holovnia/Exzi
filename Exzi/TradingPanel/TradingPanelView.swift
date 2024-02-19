//
//  TradingPanelView.swift
//  Exzi
//
//  Created by Dmitriy Holovnia on 17.02.2024.
//

import SwiftUI

struct TradingPanelView: View {
    
    @State private var percent = 0.0
    @State private var price = 0.0
    @State private var buyOrderBook = [BookOffer]()
    @State private var sellOrderBook = [BookOffer]()
    
    var body: some View {
        NavigationStack {
            GeometryReader { geometry in

                ZStack {
                    Color.mainBlue.ignoresSafeArea()
                    
                    VStack(spacing: 0) {
                        // Header menu
                        HStack(spacing: 16) {
                            Text("Spot")
                                .foregroundColor(.white)
                                .font(.system(size: 15, weight: .semibold))
                            
                            Text("Margin")
                                .foregroundColor(.gray)
                                .font(.system(size: 15, weight: .semibold))
                            
                            Text("Convert")
                                .foregroundColor(.gray)
                                .font(.system(size: 15, weight: .semibold))
                            
                            Spacer()
                        }
                        .padding(.horizontal, 16)
                        .padding(.top, 12)
                        
                        // Header content
                        HStack(spacing: 0) {
                            Image(.tradeIcon)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 18)
                            
                            Text("BTC/USDT")
                                .foregroundStyle(.white)
                                .font(.system(size: 18, weight: .semibold))
                                .padding(.leading, 8)
                            
                            Text("\(percent)")
                                .foregroundStyle(.green)
                                .font(.system(size: 12, weight: .medium))
                                .padding(.leading, 8)
                            
                            Spacer()
                            
                            NavigationLink {
                                ChartPanelView(percent: $percent, price: $price)
                            } label: {
                                Image(.candlesIcon)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 24)
                            }
                            
                            Image(.settingsIcon)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 24)
                                .padding(.leading, 8)
                        }
                        .padding(.horizontal, 16)
                        .padding(.top, 17)
                        
                        // Order panel
                        HStack(alignment: .top, spacing: 16) {
                            VStack(spacing: 0) {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 4)
                                        .foregroundColor(.mainLightGray)
                                    
                                    HStack {
                                        RoundedRectangle(cornerRadius: 4)
                                            .foregroundColor(.green)
                                            .overlay {
                                                Text("Buy")
                                                    .foregroundColor(.white)
                                                    .font(.system(size: 12, weight: .medium))
                                            }
                                        
                                        RoundedRectangle(cornerRadius: 4)
                                            .foregroundColor(.clear)
                                            .overlay {
                                                Text("Sell")
                                                    .foregroundColor(.gray)
                                                    .font(.system(size: 12, weight: .medium))
                                            }
                                    }
                                }
                                .frame(height: 28)
                                
                                // Limit
                                ZStack {
                                    RoundedRectangle(cornerRadius: 4)
                                        .stroke(Color.mainGray)
                                    
                                    HStack {
                                        Image(.infoIcon)
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 14)
                                        
                                        Spacer()
                                        
                                        Text("Limit")
                                            .foregroundStyle(.white)
                                            .font(.system(size: 13, weight: .medium))
                                        
                                        Spacer()
                                        
                                        Image(.arrowDownIcon)
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 10)
                                        
                                    }
                                    .padding(.horizontal, 9)
                                }
                                .frame(height: 28)
                                .padding(.top, 12)
                                
                                // Price
                                ZStack {
                                    RoundedRectangle(cornerRadius: 4)
                                        .stroke(Color.mainGray)
                                    
                                    HStack {
                                        Text("00.00")
                                            .foregroundStyle(.white)
                                            .font(.system(size: 13, weight: .medium))
                                        
                                        Spacer()
                                        
                                        Text("-")
                                            .foregroundStyle(.white)
                                            .font(.system(size: 25, weight: .medium))
                                            .padding(.trailing, 5)
                                        
                                        Text("+")
                                            .foregroundStyle(.white)
                                            .font(.system(size: 20, weight: .medium))
                                            .padding(.trailing, 5)
                                    }
                                    .padding(.horizontal, 9)
                                }
                                .frame(height: 28)
                                .padding(.top, 12)
                                
                                HStack {
                                    Text("=0.0 USD")
                                        .foregroundStyle(.mainLightGray1)
                                        .font(.system(size: 13, weight: .medium))
                                    
                                    Spacer()
                                }
                                .padding(.top, 8)
                                
                                ZStack {
                                    RoundedRectangle(cornerRadius: 4)
                                        .stroke(Color.mainGray)
                                    
                                    HStack {
                                        Text("Amount")
                                            .foregroundStyle(.mainLightGray2)
                                            .font(.system(size: 13, weight: .medium))
                                        
                                        Spacer()
                                        
                                        Text("BTC")
                                            .foregroundStyle(.mainLightGray2)
                                            .font(.system(size: 13, weight: .medium))
                                            .padding(.trailing, 8)
                                        
                                    }
                                    .padding(.horizontal, 9)
                                }
                                .frame(height: 28)
                                .padding(.top, 8)
                                
                                Image(.orderSize)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height: 29)
                                    .padding(.top, 10)
                                
                                ZStack {
                                    RoundedRectangle(cornerRadius: 4)
                                        .stroke(Color.mainGray)
                                    
                                    HStack {
                                        Text("Total")
                                            .foregroundStyle(.mainLightGray2)
                                            .font(.system(size: 13, weight: .medium))
                                        
                                        Spacer()
                                        
                                        Text("USDT")
                                            .foregroundStyle(.mainLightGray2)
                                            .font(.system(size: 13, weight: .medium))
                                            .padding(.trailing, 8)
                                        
                                    }
                                    .padding(.horizontal, 9)
                                }
                                .frame(height: 36)
                                .padding(.top, 12)
                                
                                HStack {
                                    Text("Max. Buy")
                                        .foregroundStyle(.mainLightGray2)
                                        .font(.system(size: 11, weight: .medium))
                                    
                                    Spacer()
                                    
                                    Text("0.00 BTC")
                                        .foregroundStyle(.white)
                                        .font(.system(size: 11, weight: .medium))
                                }
                                .padding(.top, 8)
                                
                                ZStack {
                                    RoundedRectangle(cornerRadius: 4)
                                        .fill(Color.mainGreen)
                                    
                                    Text("Buy")
                                        .foregroundStyle(.white)
                                        .font(.system(size: 19, weight: .semibold))
                                }
                                .frame(height: 36)
                                .padding(.top, 19)
                                
                            }
                            .frame(width: (geometry.size.width - 16) * 0.57)
                            
                            
                            OrderBookView(maxOrderWidth: geometry.size.width * 0.18,
                                          price: $price,
                                          buyBookOffer: $buyOrderBook,
                                          sellBookOffer: $sellOrderBook)
                        }
                        .padding(.horizontal, 16)
                        
                        // Order actions
                        
                        HStack(spacing: 16) {
                            Text("Open Order(1)")
                                .foregroundColor(.white)
                                .font(.system(size: 13, weight: .semibold))
                            
                            Text("Order History")
                                .foregroundColor(.mainLightGray2)
                                .font(.system(size: 13, weight: .semibold))
                            
                            Text("Funds")
                                .foregroundColor(.mainLightGray2)
                                .font(.system(size: 13, weight: .semibold))
                            
                            Spacer()
                            
                            Image(.historyIcon)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 24)
                        }
                        .padding(.horizontal, 16)
                        .padding(.top, 36)
                        
                        Rectangle()
                            .fill(Color.mainGray)
                            .frame(height: 1)
                            .overlay(alignment: .leading) {
                                RoundedRectangle(cornerRadius: 1.5)
                                    .fill(Color.mainBlue1)
                                    .frame(width: 22, height: 3)
                                    .padding(.leading, 52)
                            }
                            .padding(.top, 8)
                        
                        OpenOrderView()
                            .padding(.top, 12)
                        
                        Rectangle()
                            .fill(Color.mainGray)
                            .frame(height: 1)
                            .padding(.top, 16)
                            .padding(.horizontal, 16)
                        
                        
                        
                        Spacer()
                        
                    }
                }
            }
        }
        .onAppear {
            fetchTradeData()
            fetchOrderBookData()
        }
    }
    
    private func fetchTradeData() {
        Task {
            do {
                let data = try await NetworkManager.shared.fetchObject(type: TradeResponse.self, endpoint: .trade)
                guard let btcData = data.data.first(where: { $0.id == 1041 }) else { return }
                percent = btcData.percent
                price = Double(btcData.rate) / 100_000_000.0
            } catch {
                print("Error \(#function): \(error.localizedDescription)")
            }
        }
    }
    
    private func fetchOrderBookData() {
        buyOrderBook = BookResponse.buyMockData
        sellOrderBook = BookResponse.sellMockData
        Task {
            do {
                let data = try await NetworkManager.shared.fetchObject(type: BookResponse.self, endpoint: .book)
                buyOrderBook = data.buy[0...5].reversed()
                sellOrderBook = Array(data.sell[0...5])
            } catch {
                print("Error \(#function): \(error.localizedDescription)")
            }
        }
    }
}

#Preview {
    TradingPanelView()
}
