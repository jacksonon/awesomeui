//
//  UserData.swift
//  awesomeui
//
//  Created by wangjiawei on 2020/8/17.
//

import Foundation
import Combine

final class UserData: ObservableObject {
    @Published var sharedData = itemData
    
    // 无效：可能因为界面布局的原因
    func flush() {
        itemData.shuffle()
    }
}
