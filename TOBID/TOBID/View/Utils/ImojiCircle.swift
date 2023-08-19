//
//  ImojiCircle.swift
//  TOBID
//
//  Created by 김영빈 on 2023/08/20.
//

import SwiftUI

struct ImojiCircle: View {
    let imoji: String
    
    var body: some View {
        ZStack {
            Circle()
                .frame(width: 60, height: 60)
                .foregroundColor(Color("BGray"))
            Image(imoji)
                .frame(width: 40, height: 40)
        }
    }
}

struct ImojiCircle_Previews: PreviewProvider {
    static var previews: some View {
        ImojiCircle(imoji: "FaceUmm")
    }
}
