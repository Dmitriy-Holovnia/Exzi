//
//  ChartOrderView.swift
//  Exzi
//
//  Created by Dmitriy Holovnia on 18.02.2024.
//

import SwiftUI

struct ChartOrderView: View {
    
    @Binding var buyOrderBook: [BookOffer]
    @Binding var sellOrderBook: [BookOffer]
    private let screenWidth = UIScreen.main.bounds.width
    
    var body: some View {
        VStack {
            HStack {
                Text("Quantity (BTC)")
                    .foregroundColor(.mainLightGray2)
                    .font(.system(size: 11, weight: .medium))
                
                Spacer()
                
                ZStack {
                    RoundedRectangle(cornerRadius: 4)
                        .stroke(Color.mainGray1)
                    
                    HStack {
                        Text("0.1")
                            .foregroundColor(.mainLightGray2)
                            .font(.system(size: 10, weight: .medium))
                        
                        Image(.arrowDownIcon)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 7)
                    }
                }
                .frame(width: 57, height: 20)
            }
            .overlay(alignment: .center) {
                Text("Price (USDT)")
                    .foregroundColor(.mainLightGray2)
                    .font(.system(size: 11, weight: .medium))
            }
            .padding(.horizontal, 16)
            
            let sectionWidth = (screenWidth - 52) / 2
            let maxVolumeWidth = sectionWidth * 0.65
            
            HStack(spacing: 12) {
                VStack(spacing: 0) {
                    ForEach(buyOrderBook, id: \.self) { offer in
                        HStack {
                            Text(offer.volumeF)
                                .foregroundColor(.white)
                                .font(.system(size: 11, weight: .medium))
                            
                            Spacer()
                            
                            ZStack(alignment: .trailing) {
                                Rectangle()
                                    .fill(.mainGreen)
                                    .opacity(0.3)
                                    .frame(width: maxVolumeWidth * offer.volumeInt)
                                
                                Text(offer.rateF)
                                    .foregroundColor(.mainGreen)
                                    .font(.system(size: 11, weight: .medium))
                                
                            }
                        }
                        .frame(height: 20)
                    }
                }
                
                VStack(spacing: 0) {
                    ForEach(sellOrderBook, id: \.self) { offer in
                        HStack {
                            ZStack(alignment: .leading) {
                                Rectangle()
                                    .fill(.mainRed)
                                    .opacity(0.3)
                                    .frame(width: maxVolumeWidth * offer.volumeInt)
                                
                                Text(offer.rateF)
                                    .foregroundColor(.mainRed)
                                    .font(.system(size: 11, weight: .medium))
                                
                            }
                            
                            Spacer()
                            
                            Text(offer.volumeF)
                                .foregroundColor(.white)
                                .font(.system(size: 11, weight: .medium))
                        }
                        .frame(height: 20)
                    }
                }
            }
            .padding(.horizontal, 20)            
        }
    }
}

#Preview {
    ChartOrderView(buyOrderBook: .constant(BookResponse.buyMockData),
                   sellOrderBook: .constant(BookResponse.sellMockData))
}
