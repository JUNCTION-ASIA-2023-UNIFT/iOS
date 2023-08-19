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
                Text("앱로고")
                Text("코스 추천 카테고리 뷰")
            }
            .frame(width: deviceWidth, height: deviceHeight*0.300)
            .background(.yellow)
            
            MapView(coordinate: CLLocationCoordinate2D(latitude: 35.210871, longitude: 129.068713))
                .padding(.horizontal, 15)
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
