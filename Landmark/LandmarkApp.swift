//
//  LandmarkApp.swift
//  Landmark
//
//  Created by xiao on 2021/7/5.
//

import SwiftUI

@main
struct LandmarkApp: App {
    
    @StateObject private var modelData = ModelData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                //在视图层次结构中向下传递数据
                .environmentObject(modelData)
        }
    }
}
