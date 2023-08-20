//
//  MyViewBox.swift
//  TOBID
//
//  Created by 김영빈 on 2023/08/20.
//

import SwiftUI

struct MyViewBox: View {
    var body: some View {
        Rectangle()
            .foregroundColor(Color("White"))
            .overlay(
                Rectangle()
                    .stroke(
                        LinearGradient(
                            gradient: Gradient(colors: [Color("GradientWhite"), Color("White")]),
                            startPoint: .bottomLeading,
                            endPoint: .topTrailing
                        ),
                        lineWidth: 8
                    )
            )
            .cornerRadius(10)
            .padding(.horizontal, 20)
            .opacity(0.3)
    }
}

struct MyViewBox_Previews: PreviewProvider {
    static var previews: some View {
        MyViewBox()
    }
}
