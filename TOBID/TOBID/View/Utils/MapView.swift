//
//  MapView.swift
//  TOBID
//
//  Created by 김영빈 on 2023/08/19.
//

import MapKit
import SwiftUI

struct MapView: View {
    @ObservedObject var recommendPlaces = RecommendPlaces.shared
    
    // 지도 중심점
    @State var region: MKCoordinateRegion
    
    init(coordinate: CLLocationCoordinate2D) {
        region = MKCoordinateRegion(
            center: coordinate,
            span: MKCoordinateSpan(latitudeDelta: 0.3, longitudeDelta: 0.3)
        )
    }
    
    
    var body: some View {
        Map(coordinateRegion: $region, annotationItems: recommendPlaces.places) { item in
    //            MapMarker(coordinate: item.location, tint: item.isRecommended ? Color("Primary") : .white)
                MapAnnotation(coordinate: item.location, anchorPoint: CGPoint(x: 0.5, y: 1)) {
//                    VStack {
//                        Text(item.name).font(.caption)
//                        ZStack {
//                            Circle()
//                                .foregroundColor(item.isRecommended ? Color("MarkerBlue") : .white)
//                                .opacity(item.isRecommended ? 0.5 : 0.8)
//                            Circle()
//                                .stroke(style: StrokeStyle(lineWidth: 3, dash: [5]))
//                                .foregroundColor(Color("Primary"))
//                        }
//                        .frame(width: 40, height: 40) // 원의 크기 조정
//                    }
                    if item.isRecommended && recommendPlaces.selectedPlaceIdx == item.idx {
                        ZStack {
                            Circle()
                                .foregroundColor(item.isRecommended ? Color("MarkerBlue") : .white)
                                .opacity(item.isRecommended ? 0.5 : 0.8)
                            Circle()
                                .stroke(style: StrokeStyle(lineWidth: 3, dash: [5]))
                                .foregroundColor(Color("Primary"))
                            Text("\(recommendPlaces.pickedPlaceCount)")
                                .opacity(1.0)
                                .foregroundColor(Color("White"))
                                .font(.system(size: 32))
                                .bold()
                        }
                        .frame(width: 60, height: 60) // 원의 크기 조정
                        .onTapGesture {
                            recommendPlaces.selectedPlaceIdx = item.idx
                            print(recommendPlaces.selectedPlaceIdx)
                        }
                    } else {
                        ZStack {
                            Circle()
                                .foregroundColor(item.isRecommended ? Color("MarkerBlue") : .white)
                                .opacity(item.isRecommended ? 0.5 : 0.8)
                            Circle()
                                .stroke(style: StrokeStyle(lineWidth: 3, dash: [5]))
                                .foregroundColor(Color("Primary"))
                        }
                        .frame(width: 40, height: 40) // 원의 크기 조정
                        .onTapGesture {
                            recommendPlaces.selectedPlaceIdx = item.idx
                            print(recommendPlaces.selectedPlaceIdx)
                        }
                    }
                }
            }
    }
}

//struct MapView_Previews: PreviewProvider {
//    static var previews: some View {
//        MapView(
//            coordinate: CLLocationCoordinate2D(latitude: 35.210871, longitude: 129.068713)
//        )
//    }
//}
