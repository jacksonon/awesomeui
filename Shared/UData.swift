//
//  Data.swift
//  awesomeui
//
//  Created by wangjiawei on 2020/8/11.
//

import Foundation
import SwiftUI

//@ObservableObject let itemData: [ItemModel] = cload()

// 从文件加载
//let itemData: [ItemModel] = mload("items.json")

var itemData: [ItemModel] = cload()

//final class UData: ObservableObject {
//    @Published var itemData: [ItemModel] = cload()
//}

// 加载共享文件
func cload<T: Decodable>() -> T {
    let data: Data
    let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
    let path = paths[0]
    let fp = path + "/codejson.json"
    let file = URL(fileURLWithPath: fp)
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

// 使用这个文件写入缓存中【还需要文件缓存到另一个】
func mload<T: Decodable>(_ filename: String) -> T {
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


