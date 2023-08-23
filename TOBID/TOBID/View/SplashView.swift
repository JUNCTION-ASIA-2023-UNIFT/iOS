//
//  SplashView.swift
//  TOBID
//
//  Created by 김영빈 on 2023/08/20.
//

import SwiftUI

struct SplashView: View {
    @State var isSplash: Bool = true
    
    var body: some View {
        ZStack {
            // Launch Screen
            if isSplash {
                launchSplash
            } else {
                RoleSelectionView()
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: {
                isSplash.toggle()
            })
        }
        
    }
}

extension SplashView {
    var launchSplash: some View {
        ZStack(alignment: .center) {
            LinearGradient(gradient: Gradient(colors: [Color("Primary"), Color("White")]),
                            startPoint: .top, endPoint: .bottom)
            .edgesIgnoringSafeArea(.all)
    
            Image("splashimage")
                .frame(width: 70, height: 106)
        }
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
