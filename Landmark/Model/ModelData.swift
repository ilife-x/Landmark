//
//  ModelData.swift
//  Landmark
//
//  Created by xiao on 2021/7/6.
//

import Foundation


final class ModelData: ObservableObject{
//事件发送者
  @Published var landmarks:[Landmark] = load("landmarkData.json")

}



func load<T:Decodable>(_ filename:String) -> T {
    let data:Data
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)else {
        fatalError("couldn't fin \(filename) in main bundle")
    }
    
    do{
        data = try Data(contentsOf: file)
    }catch{
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }
    
    do{
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
        
    }catch{
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
        
    }
    
}

