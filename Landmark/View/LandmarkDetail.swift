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
            MapView()
                .ignoresSafeArea(edges: .top)
                .frame( height: 300)
            CircleImage()
                .offset(x: 0, y: -130)
                .padding(.bottom,-130)
            VStack(alignment: .leading){
                Text("Turtle Rock")
                    .font(.title)
                HStack {
                    Text("Joshua Tree National Park")
                        .font(.subheadline)
                    //空白
                    Spacer()
                    Text("California")
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
