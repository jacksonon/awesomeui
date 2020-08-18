//
//  ContentView.swift
//  Shared
//
//  Created by 王家伟 on 2020/8/10.
//

import SwiftUI

/*
func tomakeawindow() {
    let windowRef = NSWindow(contentRect: NSRect(x: 0, y: 0, width: 100, height: 100), styleMask: [.titled, .closable, .miniaturizable, .fullSizeContentView], backing: .buffered, defer: false)
//    windowRef.contentView = NSHostingView(rootView: CodeInput())
    windowRef.makeKeyAndOrderFront(nil)
}
 */

/* 定制左侧单个Item对应视图
struct Grouping<Content: View>: View {
    var title: String
    var icon: String
    var content: () -> Content
    
    var body: some View {
        NavigationLink(
            destination: GroupView(title: title, content: content),
            label: {
                #if os(iOS)
                Label(title, systemImage: icon)
                    .font(.headline)
                    .padding(.vertical, 8)
                #else
                Label(title, systemImage: icon)
                #endif
            })
    }
}
 */

struct ContentView: View {
    
    // 初始化数据绑定
    init() {
        self.currentData = uitemData[0]
    }
    
    @State private var isCodeInput: Bool = false
    
    // 绑定数据
    @State private var uitemData: [ItemModel] = cload()
    @State var showCodeInput: Bool = false
    @State private var currentData: ItemModel?
    
    /// 定制左侧列表视图
    var list: some View {
        // 默认应该使用数据读取，暂时模拟
        List {
            ForEach(self.uitemData, id: \.self) { item in
                #if os(iOS)
                
                NavigationLink(
                    destination: GroupView(title: item.titleName, content: {
                        DetailView(sitem: &item)
                            .navigationTitle(item.titleName)
                    }),
                    label: {
                        #if os(iOS)
                        Label(title, systemImage: icon)
                            .font(.headline)
                            .padding(.vertical, 8)
                        #else
                        Label(item.titleName, systemImage: "capsule")
                        #endif
                    })
                
                #else
                Button(item.titleName) {
                    print("选中\(item.code)")
                    self.currentData = item
                }
                #endif
                
                
                
                /*
                Grouping(title: item.titleName, icon: "capsule") {
                    DetailView(iconName: "tv.circle.fill", desc: item.desc, code: item.code, linkUrl: "https://www.baidu.com")
                }
                */
                
            }
        }
    }
    
    var body: some View {
        NavigationView {
            #if os(iOS) || os(watchOS) || os(tvOS)
            list.navigationTitle("WMUIKit")
            Text("选择一个视图")
            #elseif os(OSX)
            list // .listStyle(SidebarListStyle())
            DetailView(sitem: self.$currentData)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            #endif
        }
        .navigationTitle("代码拷贝神器")
        .accentColor(.accentColor)
        .toolbar(content: {
            HStack {
                Button("显示/隐藏SideBar") {
                    self.toggleSidebar()
                }
                Button("录入代码") {
                    self.showCodeInput.toggle()
                }.sheet(isPresented: $showCodeInput) {
                    CodeInput(uitemData: $uitemData, showCodeInput: $showCodeInput)
                }
                Link("查看项目地址", destination: URL(string: "https://github.com/wang542413041/awesomeui")!)
            }.frame(alignment: .center)
        })
        // .navigationSubtitle("内部UI代码示例")
    }
    
    // 显示隐藏sidebar
    private func toggleSidebar() {
        #if os(iOS)
        #else
        NSApp.keyWindow?.firstResponder?.tryToPerform(#selector(NSSplitViewController.toggleSidebar(_:)), with: nil)
        #endif
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



/* 绝对视图
 GeometryReader { geo in
     HStack {
         MenuListView()
             .frame(width: 300, height: geo.size.height)
         DetailView()
             .frame(width: geo.size.width - 300, height: geo.size.height)
     }
     .frame(maxWidth: .infinity, maxHeight: .infinity)
 }
 .toolbar(content: {
     HStack {
         Text("【基于SwiftUI构建】")
             .frame(alignment: .leading)
             .font(.subheadline)
             .foregroundColor(.orange)
         Button("查看文档") {
             
         }
         Button("官方文档") {}
         Button("查看项目地址") {}
     }
 })
 .navigationTitle("WMUIKit")
 .navigationSubtitle("呵呵")
 */
