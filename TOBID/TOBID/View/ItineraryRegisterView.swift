//
//  ItineraryRegisterView.swift
//  TOBID
//
//  Created by 김영빈 on 2023/08/20.
//

import MapKit
import SwiftUI

struct ItineraryRegisterView: View {
    
    var body: some View {
        ZStack {
            Color("BGray")
            VStack {
                MapView(coordinate: CLLocationCoordinate2D(latitude: 35.210871, longitude: 129.068713))
                    .navigationTitle("Creating courses")
                    .cornerRadius(10)
                    .padding(.horizontal, 15)
                    .shadow(color: Color.black.opacity(0.25), radius: 10, x: 0, y: 4)
                
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
                                lineWidth: 2
                            )
                    )
                    .cornerRadius(10)
                    .padding(.horizontal, 20)
                    .frame(height: deviceHeight*0.236)
                    .opacity(0.3)
                
                MyButton(title: "I'm planning to start from here.", enabled: false)
            }
        }
    }
}

struct ItineraryRegisterView_Previews: PreviewProvider {
    static var previews: some View {
        ItineraryRegisterView()
    }
}
