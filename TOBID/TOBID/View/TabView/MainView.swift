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
                Rectangle()
                    .frame(width: 50, height: 50)
                    .foregroundColor(.black)
                RecommendBannerView(headline: "이런 코스는 어떠세요?")
            }
            .frame(width: deviceWidth, height: deviceHeight*0.300)
            .padding(.top, -100)
            
            NavigationLink(destination: ItineraryRegisterView()) {
                MapView(coordinate: CLLocationCoordinate2D(latitude: 35.210871, longitude: 129.068713))
                    .frame(height: 400)
                    .cornerRadius(10)
            }
            .padding(.horizontal, 15)
            .shadow(color: Color.black.opacity(0.25), radius: 10, x: 0, y: 4)
        }
        .ignoresSafeArea()
        .frame(width: deviceWidth, height: 761)
        .background(Color("BGray"))
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
