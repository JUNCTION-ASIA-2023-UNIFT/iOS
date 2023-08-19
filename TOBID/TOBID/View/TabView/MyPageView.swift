//
//  ProfileView.swift
//  TOBID
//
//  Created by 김영빈 on 2023/08/19.
//

import SwiftUI

// MARK: - 마이페이지 뷰
struct MyPageView: View {
    var body: some View {
        NavigationStack {
            ScrollView() {
                VStack(spacing:0) {
                    Spacer()
                    Rectangle()
                        .frame(width: 50, height: 50)
                        .foregroundColor(.black)
                    RecommendBannerView(headline: "나의 입찰 현황")
                        .padding(.top, 31)
                    BidderListTob3View()
                        .padding(.top, 34)
                    CourseListView()
                        .padding(.top, 59)
                    Spacer()
                }
                .frame(width: deviceWidth)
                .padding(18)
                
            }
            .background(Color("BGray"))
        }
        
    }
        
}

struct BidListArea: View {
    @State var hasBidList = true
    @State var detailViewActive: Bool = false
    
    var body: some View {
        
        if hasBidList {
            VStack(spacing: 0) {
                HStack {
                    Spacer()
                    VStack(spacing:21) {
                        Text("TOP 1")
                        Text("TOP 2")
                        Text("TOP 3")
                    }
                    .foregroundColor(Color("DarkGray"))
                    Spacer()
                    VStack(spacing:21) {
                        Text("72,000")
                        Text("80,000")
                        Text("85,000")
                    }
                    Spacer()
                    VStack(spacing:21) {
                        Text("최우영 기사님")
                        Text("김영빈 기사님")
                        Text("김재령 기사님")
                    }
                    .foregroundColor(Color("DarkGray"))
                    Spacer()
                }
                Divider()
                    .frame(width: 320)
                    .padding()
                
                NavigationLink(destination: MyPageDetailView(detailViewActive: $detailViewActive),
                               isActive: $detailViewActive) {
                    Text("지금 체결하러 가기 \(Image(systemName: "chevron.forward"))")
                }
            }
        } else {
            VStack(spacing:0) {
                ZStack {
                    Circle()
                        .frame(width: 60, height: 60)
                        .foregroundColor(Color("BGray"))
                    Image("face-zzz")
                }
                .padding(.bottom, 15)
                
                Text("입찰 현황이 없어요.")
            }
        }
        
    }
}

struct MyPageView_Previews: PreviewProvider {
    static var previews: some View {
        MyPageView()
    }
}
