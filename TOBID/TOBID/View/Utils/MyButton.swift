//
//  MyButton.swift
//  TOBID
//
//  Created by 김영빈 on 2023/08/20.
//

import SwiftUI

struct MyButton: View {
    let title: String
    let enabled: Bool
    let width: CGFloat
    
    var body: some View {
//        Button {
//            
//        } label: {
//            Text(title)
//                .foregroundColor(.white)
//                .frame(width: width, height: 55)
//                .background(enabled ? Color("Primary") : Color("Buttongray"))
//                .cornerRadius(15)
//        }
//
        ZStack {
            if enabled {
                Color("Primary")
            } else {
                Color("ButtonGray")
            }
            Text(title)
                .foregroundColor(.white)
        }
        .frame(width: width, height: 55)
        .cornerRadius(15)
    }
}

struct MyButton_Previews: PreviewProvider {
    static var previews: some View {
        MyButton(title: "버튼", enabled: true, width: 340)
    }
}
