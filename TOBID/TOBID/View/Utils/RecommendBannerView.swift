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
            HStack {
                Banner(bannerTitle: "연인과 함께", bannerImg: "banner-heart", width: 120)
                Banner(bannerTitle: "혼자일 때", bannerImg: "banner-girl", width: 100)
                Banner(bannerTitle: "가족과 함께", bannerImg: "banner-camera", width: 120)
            }
            .padding(.bottom, 15)
            HStack {
                Banner(bannerTitle: "여유롭게", bannerImg: "banner-cup", width: 100)
                Banner(bannerTitle: "MZ 핫플레이스", bannerImg: "banner-fire", width: 140)
            }
        }
    }
}

struct Banner: View {
    let bannerTitle: String
    let bannerImg: String
    let width: CGFloat
    
    var body: some View {
        ZStack {
            Rectangle()
                .frame(width: width, height: 33)
                .cornerRadius(20)
                .foregroundColor(.white)
            
            Label {
                Text(bannerTitle)
                    .font(.system(size: 14))
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
