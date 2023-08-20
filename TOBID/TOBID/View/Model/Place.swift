//
//  Place.swift
//  TOBID
//
//  Created by 김영빈 on 2023/08/20.
//

import Foundation
import MapKit

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
    var idx: Int
    var name: String
    var location: CLLocationCoordinate2D
    var isRecommended = false
    var description: String
    var isFocused: Bool = false
}

class RecommendPlaces: ObservableObject {
    static let shared = RecommendPlaces()
    private init() {}
    
    // 선택된 장소 인덱스
    @Published var selectedPlaceIdx = -1
    @Published var settedPlaceIdx = []
    @Published var pickedPlaceCount = 1
    
    @Published var places = [
        // 자갈치시장
        Place(
            idx: 0,
            name: "Jagalchi Market",
            location: CLLocationCoordinate2D(latitude: 35.096806, longitude: 129.030638),
            isRecommended: false,
            description: ""
        ),
        // 용궁사
        Place(
            idx: 1,
            name: "Yonggungsa Temple",
            location: CLLocationCoordinate2D(latitude: 35.235810, longitude: 129.093020),
            isRecommended: false,
            description: ""
        ),
        // 해운대 해수욕장
        Place(
            idx: 2,
            name: "Haeundae Beach",
            location: CLLocationCoordinate2D(latitude: 35.158766, longitude: 129.160168),
            isRecommended: true,
            description: "A beach located in Jungdong and Udon of Haeundae-gu. On this 1.5km long beach, you can enjoy fishing, swimming, various festivals and skyline views."
        ),
        // 기장 해녀촌
        Place(
            idx: 3,
            name: "Gijang Haenyeo chon",
            location: CLLocationCoordinate2D(latitude: 35.218529, longitude: 129.228094),
            isRecommended: true,
            description: "Located within a 5-minute drive from the main terminal, it is surrounded by approximately 50 raw fish restaurants centered around Yeonhwa Port. You can also enjoy the stunning views of Jukdo."
        ),
        // 전포 카페거리
        Place(
            idx: 4,
            name: "Jeonpo Cafe Street",
            location: CLLocationCoordinate2D(latitude: 35.155542, longitude: 129.063820),
            isRecommended: true,
            description: "Selected as one of the '52 Places to Go' by The New York Times in 2017. A place where you can explore various coffees, desserts, and foods as diverse as the colors of the buildings filling the alleys of Jeonpo-dong."
        )
    ]
}
