//
//  MapView.swift
//  Landmark
//
//  Created by xiao on 2021/7/6.
//

import SwiftUI
import MapKit

struct MapView: View {
    var coordinate:CLLocationCoordinate2D
    @State private var region = MKCoordinateRegion()
    
    private func setRegion(_ coordinate:CLLocationCoordinate2D){
        region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: coordinate.latitude, longitude: coordinate.longitude), span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2))
    }
    
    
    var body: some View {
        Map(coordinateRegion: $region)
            .onAppear{
                setRegion(coordinate)
            }
    }
}












struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(coordinate: CLLocationCoordinate2D(latitude: 34.011_286, longitude: -116.166_868))
    }
}
