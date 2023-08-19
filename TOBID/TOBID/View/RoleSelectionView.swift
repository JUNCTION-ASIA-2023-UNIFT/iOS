//
//  RoleSelectionView.swift
//  TOBID
//
//  Created by 김영빈 on 2023/08/19.
//

import SwiftUI

// MARK: - 역할 선택 뷰 (기사-관광객)
struct RoleSelectionView: View {
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                
                NavigationLink(destination: MainTabView()) {
                    Text("기사")
                        .font(.largeTitle)
                }
                
                Spacer()
                
                NavigationLink(destination: MainTabView()) {
                    Text("관광객")
                        .font(.largeTitle)
                }
                
                Spacer()
            }
            .frame(width: deviceWidth, height: deviceHeight)
        }
    }
}

struct RoleSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        RoleSelectionView()
    }
}
