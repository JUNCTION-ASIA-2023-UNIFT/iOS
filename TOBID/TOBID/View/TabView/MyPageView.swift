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
        NavigationView {
            ScrollView() {
                VStack {
                    Image("logo")
                    RecommendBannerView(headline: "My bidding status")
                        .padding(.top, 31)
                    BidderListTob3View()
                        .padding(.top, 34)
                    CourseListView()
                        .padding(.top, 59)
                    Spacer()
                }
                .frame(width: deviceWidth, height: 761)
                
            }
            .background(Color("BGray"))
            
        }
        .frame(width: deviceWidth, height: 761)
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
                        Text("Driver Choi")
                        Text("Driver Kim")
                        Text("Driver Jae")
                    }
                    .foregroundColor(Color("DarkGray"))
                    Spacer()
                }
                Divider()
                    .frame(width: 320)
                    .padding()
                
                NavigationLink(destination: MyPageDetailView(detailViewActive: $detailViewActive),
                               isActive: $detailViewActive) {
                    Text("Sign now \(Image(systemName: "chevron.forward"))")
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
                
                Text("There's no bidding status.")
            }
        }
    }
}

struct MyPageView_Previews: PreviewProvider {
    static var previews: some View {
        MyPageView()
    }
}
