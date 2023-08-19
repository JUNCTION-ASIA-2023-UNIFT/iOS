//
//  MainView.swift
//  TOBID
//
//  Created by 김영빈 on 2023/08/19.
//

import MapKit
import SwiftUI

let deviceWidth = UIScreen.main.bounds.width
let deviceHeight = UIScreen.main.bounds.height

// MARK: - 메인(내 코스) 뷰
struct MainView: View {
    var body: some View {
        VStack {
            VStack {
                Spacer()
                Rectangle()
                    .frame(width: 50, height: 50)
                    .foregroundColor(.black)
                Spacer()
                RecommendBannerView(headline: "이런 코스는 어떠세요?")
            }
            .frame(width: deviceWidth, height: deviceHeight*0.300)
            .padding(18)
            .background(Color("BGray"))
            
            MapView(coordinate: CLLocationCoordinate2D(latitude: 35.210871, longitude: 129.068713))
                .padding(.horizontal, 15)
                .padding(.bottom, 144)
        }
        .frame(width: deviceWidth, height: 761)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
