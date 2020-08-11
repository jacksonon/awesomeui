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
