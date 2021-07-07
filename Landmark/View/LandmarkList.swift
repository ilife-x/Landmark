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
            .navigationTitle("landmarks")
        }
        //此处需注意设置标题的位置,是list上设置,不是在导航的容器上设置
//        .navigationBarItems(leading:Text("landmarks"))
//        .navigationBarTitle(Text("landmarks"))
        
    }
}

//struct LandmarkList_Previews: PreviewProvider {
//    static var previews: some View {
//        ForEach(["iPhone SE (2nd generation)", "iPhone XS Max"], id: \.self) { deviceName in
//            LandmarkList()
//                .previewDevice(PreviewDevice(rawValue: deviceName))
//
//        }
//    }
//}
