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
                Image("logo")
                    .resizable()
                    .frame(width: 40, height: 44)
//                    .padding(.top, 7)
                Spacer()
                
                Text("Who are you?")
                    .font(.system(size: 28))
                    .padding(.bottom, 15)
                Text("Please select a role.")
                    .font(.system(size: 18))
                    .foregroundColor(Color("Gray"))
                    .padding(.bottom, 90)

                
                HStack {
                    Spacer()
                    NavigationLink(destination: MainTabView()) {
                        VStack {
                            ImojiCircle(imoji: "FaceSungla", circleColor: Color("White"), circleSize: 100, imojiSize: 60)
                            Text("Taxi driver")
                                .font(.system(size: 20))
                                .foregroundColor(.black)
                        }
                    }
                    Spacer()
                    NavigationLink(destination: MainTabView()) {
                        VStack {
                            ImojiCircle(imoji: "FaceSmile", circleColor: Color("White"), circleSize: 100, imojiSize: 60)
                            Text("Passenger")
                                .font(.system(size: 20))
                                .foregroundColor(.black)
                        }
                    }
                    Spacer()
                }
                
                Spacer()
                Spacer()
                Spacer()
            }
            .background(Color("BGray"))
            .frame(width: deviceWidth, height: deviceHeight)
        }
    }
}

struct RoleSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        RoleSelectionView()
    }
}
