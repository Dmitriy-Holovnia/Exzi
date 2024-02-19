//
//  OrderBookView.swift
//  Exzi
//
//  Created by Dmitriy Holovnia on 18.02.2024.
//

import SwiftUI

struct OrderBookView: View {
    
    var maxOrderWidth: CGFloat
    @Binding var price: Double
    @Binding var buyBookOffer: [BookOffer]
    @Binding var sellBookOffer: [BookOffer]
    
    var body: some View {
        VStack {
            HStack {
                Text("Price(USDT)")
                    .foregroundStyle(.mainLightGray1)
                    .font(.system(size: 9, weight: .medium))
                
                Spacer()
                
                Text("Quantity(ARB)")
                    .foregroundStyle(.mainLightGray1)
                    .font(.system(size: 9, weight: .medium))
            }
            
            VStack(spacing: 0) {
                ForEach(sellBookOffer, id: \.self) { offer in
                    HStack {
                        Text(offer.rateF)
                            .foregroundColor(.mainRed)
                            .font(.system(size: 11, weight: .medium))
                        
                        Spacer()
                        
                        ZStack(alignment: .trailing) {
                            Rectangle()
                                .fill(.mainRed)
                                .opacity(0.5)
                                .frame(width: maxOrderWidth * offer.volumeInt)
                            
                            Text(offer.volumeF)
                                .foregroundColor(.white)
                                .font(.system(size: 11, weight: .medium))
                            
                        }
                    }
                    .frame(height: 17)
                }
            }
            
            HStack {
                VStack {
                    Text(price.value)
                        .foregroundColor(.mainGreen)
                        .font(.system(size: 15, weight: .semibold))
                    
                    Text("=$\(price.value)")
                        .foregroundColor(.mainLightGray1)
                        .font(.system(size: 11, weight: .regular))
                }
                
                Spacer()
            }
            .padding(.top, 15)
            .padding(.bottom, 15)
            
            VStack(spacing: 0) {
                ForEach(buyBookOffer, id: \.self) { offer in
                    HStack {
                        Text(offer.rateF)
                            .foregroundColor(.mainGreen)
                            .font(.system(size: 11, weight: .medium))
                        
                        Spacer()
                        
                        ZStack(alignment: .trailing) {
                            Rectangle()
                                .fill(.mainGreen)
                                .opacity(0.5)
                                .frame(width: maxOrderWidth * offer.volumeInt)
                            
                            Text(offer.volumeF)
                                .foregroundColor(.white)
                                .font(.system(size: 11, weight: .medium))
                            
                        }
                    }
                    .frame(height: 17)
                }
            }
            
            HStack(spacing: 10) {
                ZStack {
                    RoundedRectangle(cornerRadius: 4)
                        .stroke(Color.mainGray)
                    
                    HStack {
                        Text("0.1")
                            .foregroundColor(.white)
                            .font(.system(size: 10, weight: .medium))
                        
                        Spacer()
                        
                        Image(.arrowDownIcon)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 8)
                    }
                    .padding(.horizontal, 10)
                }
                .frame(height: 20)
                
                Image(.orderIcon)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 18)
            }
        }
    }
}

#Preview {
    OrderBookView(maxOrderWidth: 200,
                  price: .constant(52_000.000),
                  buyBookOffer: .constant(BookResponse.buyMockData),
                  sellBookOffer: .constant(BookResponse.sellMockData))
    //    .previewLayout(.fixed(width: 180, height: 400))
}
