//
//  ItineraryRegisterView.swift
//  TOBID
//
//  Created by 김영빈 on 2023/08/20.
//

import MapKit
import SwiftUI

struct ItineraryRegisterView: View {
    @Environment(\.presentationMode) var presentationMode
    
    @State var isShowingDateModal: Bool = true
    @State var isShowingBackModal: Bool = false
    @State private var selectedDate = Date()
    
    var body: some View {
        ZStack {
            Color("BGray")
            VStack {
                MapView(coordinate: CLLocationCoordinate2D(latitude: 35.210871, longitude: 129.068713))
                    .navigationTitle("Creating courses")
                    .cornerRadius(10)
                    .padding(.horizontal, 15)
                    .shadow(color: Color.black.opacity(0.25), radius: 10, x: 0, y: 4)
                    .padding(.bottom, 12)
                
                ZStack {
                    MyViewBox()
                        .frame(height: deviceHeight*0.236)
                    VStack {
                        ImojiCircle(imoji: "FaceLaugh")
                        Text("Please tell me the first course.")
                    }
                }
                .padding(.bottom, 33)
                
                MyButton(title: "I'm planning to start from here.", enabled: false, width: 340)
            }
        }
        // 여행 시작 날짜 입력 모달
        .sheet(isPresented: $isShowingDateModal) {
            VStack {
                VStack(alignment: .leading) {
                    Text("Enter the travel dates.")
                        .font(.system(size: 20))
                        .bold()
                    DatePicker("Select itinerary start date", selection: $selectedDate, displayedComponents: [.date])
                        .datePickerStyle(.graphical)
                }
                HStack {
                    MyButton(title: "Cancel", enabled: false, width: 165)
                        .onTapGesture {
                            presentationMode.wrappedValue.dismiss()
                        }
                    MyButton(title: "Select", enabled: true, width: 165)
                        .onTapGesture {
                            isShowingDateModal = false
                        }
                }
            }
            .padding(16)
            .presentationDetents([.height(535)])
            .presentationCornerRadius(30)
        }
        // 뒤로가기 확인 모달
        .sheet(isPresented: $isShowingBackModal) {
            VStack {
                ImojiCircle(imoji: "FaceUmm")
                    .padding(.bottom, 15)
                Text("Would you stop creating the course?")
                    .font(.system(size: 20))
                    .padding(.bottom, 16)
                Text("Course creation is not complete.\nYour entries will not be saved.")
                    .foregroundColor(Color("DarkGray"))
                    .font(.system(size: 16))
                    .padding(.bottom, 51)
                HStack {
                    MyButton(title: "Cancel", enabled: false, width: 165)
                        .onTapGesture {
                            isShowingBackModal = false
                        }
                    MyButton(title: "Continue", enabled: true, width: 165)
                        .onTapGesture {
                            presentationMode.wrappedValue.dismiss()
                        }
                }
            }
            .padding(26)
            .presentationDetents([.height(360)])
            .presentationCornerRadius(30)
        }
        .navigationBarBackButtonHidden(true)
        .navigationTitle("Craeting courses")
        // 커스텀 백버튼
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    isShowingBackModal = true
                } label: {
                    Image(systemName: "chevron.backward").bold()
                }

            }
        }
    }
}

struct ItineraryRegisterView_Previews: PreviewProvider {
    static var previews: some View {
        ItineraryRegisterView()
    }
}
