//
//  OpenOrderView.swift
//  Exzi
//
//  Created by Dmitriy Holovnia on 18.02.2024.
//

import SwiftUI

struct OpenOrderView: View {
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Spacer()
                
                Text("Cancel All")
                    .foregroundColor(.mainLightGray2)
                    .font(.system(size: 12, weight: .medium))
                    .underline()
                    .padding(.trailing, 8)
            }
            .padding(.bottom, 13)
            
            HStack {
                Text("BTC/USDT")
                    .foregroundColor(.white)
                    .font(.system(size: 13, weight: .semibold))
                
                Spacer()
                
                Text("08/09 - 11:29:05")
                    .foregroundColor(.gray)
                    .font(.system(size: 12, weight: .regular))
                
            }
            .padding(.horizontal, 8)
            .padding(.bottom, 8)
            
            HStack {
                Text("Limit/Sell")
                    .foregroundColor(.mainRed)
                    .font(.system(size: 12, weight: .semibold))
                    .padding(.trailing, 28)
                
                VStack(alignment: .leading, spacing: 1) {
                    Text("43%")
                        .foregroundColor(.white)
                        .font(.system(size: 11, weight: .semibold))
                    
                    ZStack {
                        RoundedRectangle(cornerRadius: 1.5)
                            .fill(.gray)
                            .frame(height: 3)
                        
                        HStack {
                            RoundedRectangle(cornerRadius: 1.5)
                                .fill(.mainRed)
                                .frame(width: 100, height: 3)
                            
                            Spacer()
                        }
                    }
                }
            }
            .padding(.horizontal, 8)
            .padding(.bottom, 6)
            
            HStack(spacing: 0) {
                Text("Amount")
                    .foregroundColor(.mainLightGray1)
                    .font(.system(size: 12, weight: .semibold))
                    .padding(.trailing, 44)
                
                Text("18.00 / 18.00")
                    .foregroundColor(.mainLightGray1)
                    .font(.system(size: 12, weight: .semibold))
                    .padding(.trailing, 28)
                
                Spacer()
            }
            .padding(.horizontal, 8)
            .padding(.bottom, 6)
            
            HStack(spacing: 0) {
                Text("Price")
                    .foregroundColor(.mainLightGray1)
                    .font(.system(size: 12, weight: .semibold))
                    .padding(.trailing, 60)
                
                Text("60.00")
                    .foregroundColor(.white)
                    .font(.system(size: 12, weight: .semibold))
                    .padding(.trailing, 6)
                
                Image(.editIcon)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 14)
                
                Spacer()
            }
            .padding(.horizontal, 8)
            .padding(.bottom, 6)
            
            HStack(spacing: 0) {
                Text("Total")
                    .foregroundColor(.mainLightGray1)
                    .font(.system(size: 12, weight: .semibold))
                    .padding(.trailing, 61)
                
                Text("10,850.45")
                    .foregroundColor(.mainLightGray1)
                    .font(.system(size: 12, weight: .semibold))
                    .padding(.trailing, 28)
                
                Spacer()
            }
            .padding(.horizontal, 8)
            .padding(.bottom, 6)
        }
        .padding(.horizontal, 16)
        .overlay(alignment: .bottomTrailing) {
            ZStack {
                RoundedRectangle(cornerRadius: 4)
                    .fill(Color.mainGray1)
                
                Text("Cancel")
                    .foregroundColor(.white)
                    .font(.system(size: 12, weight: .regular))
            }
            .frame(width: 57, height: 32)
            .padding(.trailing, 25)
        }
    }
}

#Preview {
    OpenOrderView()
}
