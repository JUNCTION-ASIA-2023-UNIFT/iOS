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
    @ObservedObject var recommendPlaces = RecommendPlaces.shared
    
    @State var isShowingDateModal: Bool = true
    @State var isShowingBackModal: Bool = false
    @State var isShowingTimeModal: Bool = false
    @State private var selectedDate = Date()
    @State private var selectedTime = Date()
    
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
                    if recommendPlaces.selectedPlaceIdx == -1 {
                        VStack {
                            ImojiCircle(imoji: "FaceLaugh")
                            Text("Please tell me the first course.")
                        }
                    } else {
                        VStack(alignment: .leading) {
                            Text(recommendPlaces.places[recommendPlaces.selectedPlaceIdx].name)
                                .font(.system(size: 20))
                                .foregroundColor(Color("Primary"))
                            Divider()
                            VStack(alignment: .leading) {
                                Text(recommendPlaces.places[recommendPlaces.selectedPlaceIdx].description)
                                    .font(.system(size: 16))
                            }
                        }
                        .frame(width: deviceWidth*0.82)
                    }
                }
                .padding(.bottom, 33)
                
                if recommendPlaces.selectedPlaceIdx == -1 {
                    MyButton(title: "I'm planning to start from here.", enabled: false, width: 340)
                } else {
                    MyButton(title: "I'm planning to start from here.", enabled: true, width: 340)
                        .onTapGesture {
                            isShowingTimeModal = true
                        }
                }
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
        // 택시 탑승 시간 입력 모달
        .sheet(isPresented: $isShowingTimeModal) {
            VStack {
                VStack(alignment: .leading) {
                    Text("Please tell me.\nThe estimated time of departure.")
                        .font(.system(size: 20))
                    Text("The driver will arrive on time.")
                        .font(.system(size: 16))
                        .foregroundColor(Color("DarkGray"))
                    DatePicker("Enter departure time.", selection: $selectedTime, displayedComponents: .hourAndMinute)
                        .datePickerStyle(WheelDatePickerStyle())
                        .labelsHidden()
                }
                HStack {
                    MyButton(title: "Next", enabled: true, width: 340)
                        .onTapGesture {
                            isShowingTimeModal = false
                        }
                }
            }
            .padding(26)
            .presentationDetents([.height(450)])
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
