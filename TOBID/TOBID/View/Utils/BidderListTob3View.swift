//
//  BidderListTob3View.swift
//  TOBID
//
//  Created by jaelyung kim on 2023/08/20.
//

import SwiftUI

struct BidderListTob3View: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            
            HStack(spacing: 0) {
                Text("현재 가장 낮은 가격에 \n입찰하신 기사님들이에요.")
                    .font(.system(size: 18))
                .padding(.bottom, 16)
                Image("coin")
                    .offset(x:2, y:2)
            }
            Rectangle()
                .frame(width: 350, height: 200)
                .foregroundColor(Color.white)
                .opacity(0.4)
                .border(.white, width:2)
                .cornerRadius(10)
                .overlay{
                    BidListArea()
                }
            
        }
    }
}

struct BidderListTob3View_Previews: PreviewProvider {
    static var previews: some View {
        BidderListTob3View()
    }
}
