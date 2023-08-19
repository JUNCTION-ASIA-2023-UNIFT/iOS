//
//  CourseListView.swift
//  TOBID
//
//  Created by jaelyung kim on 2023/08/20.
//

import SwiftUI

struct CourseListView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("나의 코스 내역")
                .font(.system(size: 28))
                .padding(.bottom, 23)
            Rectangle()
                .frame(width: 350, height: 150)
                .foregroundColor(Color.white)
                .opacity(0.4)
                .border(.white, width:2)
                .cornerRadius(10)
                .overlay{
                    CourseListDiscription()
                }
        }
    }
}

struct CourseListDiscription: View {
    var body: some View {
        VStack {
            HStack {
                ZStack {
                    Circle()
                        .frame(width: 50, height: 50)
                        .foregroundColor(Color("BGray"))
                    Image("heart_front_color")
                        .resizable()
                        .frame(width:40, height: 40)
                }
                VStack(alignment: .leading, spacing: 0) {
                    Text("Busan travel with lover")
                        .font(.system(size: 16))
                    Text("Jul. 23, 2023 - Jul. 25, 2023")
                        .font(.system(size: 12))
                        .foregroundColor(Color("DarkGray"))
                        .padding(.top, 6)
                }
                Spacer()
                Button {
                } label: {
                    Text("\(Image(systemName: "ellipsis"))")
                }
                .buttonStyle(.borderless)
                .foregroundColor(Color("Gray"))
            }
            
            Divider()
            
            HStack {
                ZStack {
                    Circle()
                        .frame(width: 50, height: 50)
                        .foregroundColor(Color("BGray"))
                    Image("girl-front-color")
                        .resizable()
                        .frame(width:40, height: 40)
                }
                VStack(alignment: .leading, spacing: 0) {
                    Text("A trip to Busan alone")
                        .font(.system(size: 16))
                    Text("Jul. 23, 2023 - Jul. 25, 2023")
                        .font(.system(size: 12))
                        .foregroundColor(Color("DarkGray"))
                        .padding(.top, 6)
                }
                Spacer()
                Button {
                } label: {
                    Text("\(Image(systemName: "ellipsis"))")
                }
                .buttonStyle(.borderless)
                .foregroundColor(Color("Gray"))
            }
        }
        .padding()
    }
}

struct CourseListView_Previews: PreviewProvider {
    static var previews: some View {
        CourseListView()
    }
}
