//
//  ModelData.swift
//  SwiftUI_Tutorial
//
//  Created by 박연배 on 2022/05/11.
//

import Foundation

var landmarks: [Landmark] = load("landmarkData.json")

func load<T: Decodable>(_ filename: String) -> T {
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil) else {
        fatalError("\(filename)을 번들에서 찾을 수 없음.")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("\(filename)을 메인 번들에서 로드할 수 없음.")
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("\(filename)을 파싱할 수 없음.")
    }
}
