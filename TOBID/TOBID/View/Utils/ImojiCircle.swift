//
//  ImojiCircle.swift
//  TOBID
//
//  Created by 김영빈 on 2023/08/20.
//

import SwiftUI

struct ImojiCircle: View {
    let imoji: String
    var circleColor: Color = Color("BGray")
    var circleSize: CGFloat = 60
    var imojiSize: CGFloat = 40
    
    var body: some View {
        ZStack {
            Circle()
                .frame(width: circleSize, height: circleSize)
                .foregroundColor(circleColor)
            Image(imoji)
                .frame(width: imojiSize, height: imojiSize)
        }
    }
}

struct ImojiCircle_Previews: PreviewProvider {
    static var previews: some View {
        ImojiCircle(imoji: "FaceUmm")
    }
}
