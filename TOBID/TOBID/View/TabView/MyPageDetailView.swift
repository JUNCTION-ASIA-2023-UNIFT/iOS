//
//  MyPageDetailView.swift
//  TOBID
//
//  Created by jaelyung kim on 2023/08/20.
//

import SwiftUI

struct MyPageDetailView: View {
    @Binding var detailViewActive: Bool
    
    var body: some View {
        VStack(spacing:0) {
            RecommendBannerView(headline: "")
                .padding(.top, 63)
            Rectangle()
                .frame(width: 350, height: 300)
                .foregroundColor(Color.white)
                .opacity(0.4)
                .border(.white, width:2)
                .cornerRadius(10)
                .overlay{
                    BidListAll()
                }
                .padding(.top, 39)
            Spacer()
            Button {
            } label: {
              Text("Pay at the lowest price")
            }
            .background(Color("AccentColor"))
            .frame(width: 340)
        }
        .frame(width: deviceWidth, height: 761)
        .background(Color("BGray"))
        
        
    }
}

struct BidListAll: View {
    var body: some View {
        ZStack {
            Divider()
                .offset(y: -63)
            Image("medal-front-color")
                .offset(x: -72, y: -103)
        }
        VStack(spacing: 0) {
            HStack {
                Spacer()
                VStack(spacing:21) {
                    
                    Text("TOP 1")
                        .padding(.bottom, 41)
                    Text("TOP 2")
                    Text("TOP 3")
                    Text("TOP 4")
                    Text("TOP 5")
                }
                .foregroundColor(Color("DarkGray"))
                Spacer()
                VStack(spacing:21) {
                    Text("72,000")
                        .padding(.bottom, 41)
                        .font(.system(size: 21))
                        .foregroundColor(Color("AccentColor"))
                    Text("80,000")
                    Text("85,000")
                    Text("87,000")
                    Text("90,000")
                }
                Spacer()
                VStack(spacing:21) {
                    Text("Driver Choi")
                        .padding(.bottom, 41)
                    Text("Driver Kim")
                    Text("Driver Jae")
                    Text("Driver Su")
                    Text("Driver Dana")
                }
                .foregroundColor(Color("DarkGray"))
                Spacer()
            }
            .frame(width: 320)
            .padding()
            
        }

    }
}
