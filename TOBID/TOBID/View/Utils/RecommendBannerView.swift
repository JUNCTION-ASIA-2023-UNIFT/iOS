//
//  RecommendBannerView.swift
//  TOBID
//
//  Created by 김영빈 on 2023/08/19.
//

import SwiftUI

struct RecommendBannerView: View {
    let headline: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(headline)
                .font(.system(size: 28))
                .padding(.bottom, 23)
                .bold()
            HStack {
                Banner(bannerTitle: "With lover", bannerImg: "banner-heart", width: 120)
                Banner(bannerTitle: "Leisurely", bannerImg: "banner-cup", width: 110)
                Banner(bannerTitle: "With family", bannerImg: "banner-camera", width: 120, isTapped: true)
            }
            .padding(.bottom, 15)
            HStack {
                Banner(bannerTitle: "When alone", bannerImg: "banner-girl", width: 120)
                Banner(bannerTitle: "Going sightseeing", bannerImg: "banner-backpack", width: 160)
            }
        }
    }
}

struct Banner: View {
    let bannerTitle: String
    let bannerImg: String
    let width: CGFloat
    var isTapped = false
    
    var body: some View {
        ZStack {
            Rectangle()
                .frame(width: width, height: 33)
                .cornerRadius(20)
                .foregroundColor(isTapped ? Color("Primary") : .white)
            
            Label {
                Text(bannerTitle)
                    .font(.system(size: 14))
                    .foregroundColor(isTapped ? Color("White") : .black)
            } icon: {
                Image(bannerImg)
            }
        }
    }
}

struct RecommendBannerView_Previews: PreviewProvider {
    static var previews: some View {
        RecommendBannerView(headline: "이런 코스는 어떠세요?")
    }
}
