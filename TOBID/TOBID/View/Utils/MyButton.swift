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
    let width: CGFloat = 340
    
    var body: some View {
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
        MyButton(title: "버튼", enabled: true)
    }
}
