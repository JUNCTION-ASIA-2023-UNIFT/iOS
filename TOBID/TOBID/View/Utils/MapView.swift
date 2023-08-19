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
    var location: CLLocationCoordinate2D
    var color: Color
}

struct MapView: View {
    var coordinate: CLLocationCoordinate2D
    
    // 지도 중심점
    @State private var region = MKCoordinateRegion()
    // 마커를 표시할 장소들
    @State private var places = [
        // 자갈치시장
        Place(
            location: CLLocationCoordinate2D(latitude: 35.096806, longitude: 129.030638),
            color: Color.blue
        ),
        // 용궁사
        Place(
            location: CLLocationCoordinate2D(latitude: 35.235810, longitude: 129.093020),
            color: Color.blue
        ),
        // 해운대 해수욕장
        Place(
            location: CLLocationCoordinate2D(latitude: 35.158766, longitude: 129.160168),
            color: Color.blue
        ),
        // 기장 해녀촌
        Place(
            location: CLLocationCoordinate2D(latitude: 35.218529, longitude: 129.228094),
            color: Color.blue
        ),
        // 전포 카페거리
        Place(
            location: CLLocationCoordinate2D(latitude: 35.155542, longitude: 129.063820),
            color: Color.blue
        )
    ]
    
    var body: some View {
        Map(coordinateRegion: $region, annotationItems: places) { item in
            MapMarker(coordinate: item.location, tint: item.color)
        }
        .onAppear {
            setRegion(coordinate)
        }
        .frame(width: 360, height: 400)
        .background(Color("BGray"))
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
