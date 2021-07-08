//
//  ContentView.swift
//  Landmark
//
//  Created by xiao on 2021/7/5.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        LandmarkList()
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ModelData())
            .padding()
    }
}
