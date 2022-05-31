//
//  RestoDetail.swift
//  ListResto
//
//  Created by Macbook Pro on 23/05/22.
//

import SwiftUI
import MapKit

struct RestoDetail: View {
    @State private var tempat = MKCoordinateRegion(
        center: CLLocationCoordinate2D(
            latitude: -7.2915785, longitude: 112.6545816),
        span: MKCoordinateSpan(
            latitudeDelta: 0.005, longitudeDelta: 0.005)
    )
    var body: some View {
        ScrollView {
            ZStack {
                Map(coordinateRegion: $tempat)
                    .ignoresSafeArea(edges: .top)
                    .frame(height:250)
                    .zIndex(0)
                VStack {
                    Image("Afterwork")
                        .renderingMode(.original)
                        .resizable()
                        .frame(width:100, height: 100)
                        .cornerRadius(100)
                }
                    .zIndex(1)
                    .offset(y:90)
                VStack (alignment: .leading){
                    Text("After Work")
                        .foregroundColor(.brown)
                        .font(.largeTitle)
                        .padding()
                        
                }
                .background(SwiftUI.Color.white.frame(width:.infinity))
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(.brown, lineWidth: 2)
                )
                .offset(y:120)
            }
        }
    }
}

struct RestoDetail_Previews: PreviewProvider {
    static var previews: some View {
        RestoDetail()
    }
}
