//
//  awesomeuiApp.swift
//  Shared
//
//  Created by 王家伟 on 2020/8/10.
//

import SwiftUI

@main
struct awesomeuiApp: App {
    var body: some Scene {
        WindowGroup {
            #if os(macOS)
            ContentView()
                .frame(minWidth: 600, idealWidth: 800, maxWidth: .infinity, minHeight: 400, idealHeight: 600, maxHeight: .infinity)
            #else
            ContentView()
            #endif
        }
    }
}

// TODO: 批量录入代码到文件
// TODO: 提供代码写入的功能【即新增代码，使用git同步，新增代码后，调用git上传当前存档代码json文件】
// TODO: 提供Server服务及客户端添加server服务
// TODO: 通过桥接，接入Flutter部分页面


// TODO: 格式化代码！！！


/*
 OC:代码格式化规则
 1. 遇到 左{ 添加换行符 + 2个空格 ，并且使用一个 stack保存入栈数 . stack + 1
 2. 遇到 ； 添加换行符
 3. 遇到 右} 左侧添加 (stakc - 1) * 2个空格，同时(stack数组减一)
 */
