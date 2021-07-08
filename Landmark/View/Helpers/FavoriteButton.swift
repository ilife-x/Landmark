//
//  FavoriteButton.swift
//  Landmark
//
//  Created by xiao on 2021/7/8.
//

import SwiftUI

struct FavoriteButton: View {
    
    @Binding var isSet:Bool
    
    var body: some View {
        /// toggle 切换
        /// Use this method to toggle a Boolean value from `true` to `false` or from
        /// `false` to `true`.
        Button(action: {isSet.toggle()}, label: {
            Image(systemName: isSet ? "star.fill" : "star")
                .foregroundColor(isSet ? Color.yellow : Color.gray)
        })
    }
}

struct FavoriteButton_Previews: PreviewProvider {
    static var previews: some View {
        //constant 常数
        FavoriteButton(isSet: .constant(true))
    }
}
