//
//  LandmarkDetail.swift
//  Landmark
//
//  Created by xiao on 2021/7/6.
//

import SwiftUI

struct LandmarkDetail: View {
    //@EnvironmentObject 在视图层次结构中较低的视图中使用此属性从较高的视图接收数据。
    @EnvironmentObject var modelData: ModelData
    var landmark:Landmark
    
    var landmarkIndex :Int{
        modelData.landmarks.firstIndex(where: { $0.id == landmark.id })!

    }
    
    
    var body: some View {
        ScrollView {
            MapView(coordinate: landmark.locationCoordinate)
                .ignoresSafeArea(edges: .top)
                .frame( height: 300)
            CircleImage(image: landmark.image)
                .offset(x: 0, y: -130)
                .padding(.bottom,-130)
            VStack(alignment: .leading){
                HStack {
                    Text(landmark.name)
                        .font(.title)
                        .foregroundColor(.primary)
                    FavoriteButton(isSet: $modelData.landmarks[landmarkIndex].isFavorite)
                }
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
    static let modelDate = ModelData()
    static var previews: some View {
        LandmarkDetail(landmark: modelDate.landmarks[0])
            .environmentObject(modelDate)
    }
}
