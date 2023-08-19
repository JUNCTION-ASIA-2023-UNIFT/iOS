//
//  MainTabView.swift
//  TOBID
//
//  Created by 김영빈 on 2023/08/19.
//

import SwiftUI

// MARK: - 메인 탭 화면 뷰
struct MainTabView: View {
    @State var selectedTab = 0
    
    var body: some View {
        TabView(selection: $selectedTab) {
            MainView()
                .tabItem {
                    Image(systemName: "flag.fill")
                    Text("내 루트")
                }
                .tag(0)
            
            MyPageView()
                .tabItem {
                    Image(systemName: "person.fill")
                    Text("마이페이지")
                }
                .tag(1)
        }
        .navigationBarBackButtonHidden()
        .background(Color("BGray"))
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
