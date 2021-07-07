//
//  LandmarkDetail.swift
//  Landmark
//
//  Created by xiao on 2021/7/6.
//

import SwiftUI

struct LandmarkDetail: View {
    var landmark:Landmark
    
    var body: some View {
        ScrollView {
            MapView(coordinate: landmark.locationCoordinate)
                .ignoresSafeArea(edges: .top)
                .frame( height: 300)
            CircleImage(image: landmark.image)
                .offset(x: 0, y: -130)
                .padding(.bottom,-130)
            VStack(alignment: .leading){
                Text(landmark.name)
                    .font(.title)
                HStack {
                    Text(landmark.park)
                        .font(.subheadline)
                    //空白
                    Spacer()
                    Text(landmark.state)
                }
                Divider()
                
                Text("About \(landmark.name)")
                    .font(.title2)
                Text(landmark.description)
     
            }
            .padding()
            Spacer()
        }
        .navigationTitle(landmark.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct LandmarkDetail_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkDetail(landmark: landmarks[0])
    }
}
