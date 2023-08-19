//
//  MapView.swift
//  TOBID
//
//  Created by 김영빈 on 2023/08/19.
//

import MapKit
import SwiftUI

/**
 기본 35.210871 / 129.068713
 중구 자갈치시장 35.096806 / 129.030638
 금정구 용궁사 35.235810 / 129.093020
 #해운대 해수욕장 35.158766 / 129.160168
 #기장 해녀촌 35.218529 / 129.228094
 #전포 카페거리 35.155542 / 129.063820
 */
struct Place: Identifiable {
    var id: UUID = UUID()
    var name: String
    var location: CLLocationCoordinate2D
    var isRecommended = false
}

struct MapView: View {
    var coordinate: CLLocationCoordinate2D
    
    // 지도 중심점
    @State private var region = MKCoordinateRegion()
    // 선택된 장소 인덱스
    @State var focusedPlaceIdx = -1
    @State var settedPlaceIdx = []
    // 마커를 표시할 장소들
    @State private var places = [
        // 자갈치시장
        Place(
            name: "자갈치시장",
            location: CLLocationCoordinate2D(latitude: 35.096806, longitude: 129.030638),
            isRecommended: false
        ),
        // 용궁사
        Place(
            name: "용궁사",
            location: CLLocationCoordinate2D(latitude: 35.235810, longitude: 129.093020),
            isRecommended: false
        ),
        // 해운대 해수욕장
        Place(
            name: "해운대 해수욕장",
            location: CLLocationCoordinate2D(latitude: 35.158766, longitude: 129.160168),
            isRecommended: true
        ),
        // 기장 해녀촌
        Place(
            name: "기장 해녀촌",
            location: CLLocationCoordinate2D(latitude: 35.218529, longitude: 129.228094),
            isRecommended: true
        ),
        // 전포 카페거리
        Place(
            name: "전포 카페거리",
            location: CLLocationCoordinate2D(latitude: 35.155542, longitude: 129.063820),
            isRecommended: true
        )
    ]
    
    var body: some View {
            Map(coordinateRegion: $region, annotationItems: places) { item in
    //            MapMarker(coordinate: item.location, tint: item.isRecommended ? Color("Primary") : .white)
                MapAnnotation(coordinate: item.location, anchorPoint: CGPoint(x: 0.5, y: 1)) {
                    VStack {
                        Text(item.name).font(.caption)
                        ZStack {
                            Circle()
                                .foregroundColor(item.isRecommended ? Color("MarkerBlue") : .white)
                                .opacity(item.isRecommended ? 0.5 : 0.8)
                            Circle()
                                .stroke(style: StrokeStyle(lineWidth: 3, dash: [5]))
                                .foregroundColor(Color("Primary"))
                        }
                        .frame(width: 40, height: 40) // 원의 크기 조정
                    }
                    .onTapGesture {
                        print("sfdsfdfsdf")
                    }
                }
            }
            .onAppear {
                setRegion(coordinate)
            }
    }
    
    private func setRegion(_ coordinate: CLLocationCoordinate2D) {
        region = MKCoordinateRegion(
            center: coordinate,
            span: MKCoordinateSpan(latitudeDelta: 0.3, longitudeDelta: 0.3))
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(coordinate: CLLocationCoordinate2D(latitude: 35.210871, longitude: 129.068713))
    }
}
