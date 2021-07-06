//
//  LandmarkList.swift
//  Landmark
//
//  Created by xiao on 2021/7/6.
//

import SwiftUI

struct LandmarkList: View {
    var body: some View {
        NavigationView {
            List(landmarks){landmark in
                //跳转
                NavigationLink(destination: LandmarkDetail(landmark: landmark)){
                    landmarkRow(landmark: landmark)
                }
            }
        }
        .navigationTitle("landmarks")
    }
}

//struct LandmarkList_Previews: PreviewProvider {
//    static var previews: some View {
//        LandmarkList()
//    }
//}
