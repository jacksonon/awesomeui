//
//  Data.swift
//  awesomeui
//
//  Created by wangjiawei on 2020/8/11.
//

import Foundation

let itemData: [ItemModel] = load("items.json")

func load<T: Decodable>(_ filename: String) -> T {
    let data: Data
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil) else {
        fatalError("找不到文件")
    }
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("无法加载文件")
    }
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("无法解析文件")
    }
}


