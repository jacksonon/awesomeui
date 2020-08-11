//
//  ContentView.swift
//  Shared
//
//  Created by 王家伟 on 2020/8/10.
//

import SwiftUI


/// 定制左侧单个Item对应视图
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

struct ContentView: View {
    
    
    /// 定制左侧列表视图
    var list: some View {
        // 默认应该使用数据读取，暂时模拟
        List {
//            ForEach(1...100) { (<#_#>) -> index in
//
//            }
            
            Grouping(title: "UIButton", icon: "capsule") {
                DetailView(iconName: "tv.circle.fill", desc: "控件描述", code: "UIButton *btn = [[UIButton alloc] init]", linkUrl: "https://www.baidu.com")
            }
            Grouping(title: "Text", icon: "text.aligncenter") {
                DetailView(iconName: "tv.circle.fill", desc: "控件描述", code: "UILabel *label = [[UILabel alloc] init]UILabel *label = [[UILabel alloc] init]UILabel *label = [[UILabel alloc] init]UILabel *label = [[UILabel alloc] init]UILabel *label = [[UILabel alloc] init]UILabel *label = [[UILabel alloc] init]UILabel *label = [[UILabel alloc] init]UILabel *label = [[UILabel alloc] init]UILabel *label = [[UILabel alloc] init]UILabel *label = [[UILabel alloc] init]UILabel *label = [[UILabel alloc] init]UILabel *label = [[UILabel alloc] init]UILabel *label = [[UILabel alloc] init]UILabel *label = [[UILabel alloc] init]\nUILabel *label = [[UILabel alloc] init]UILabel *label = [[UILabel alloc] init]UILabel *label = [[UILabel alloc] init]UILabel *label = [[UILabel alloc] init]UILabel *label = [[UILabel alloc] init]\nUILabel *label = [[UILabel alloc] init]UILabel *label = [[UILabel alloc] init]UILabel *label = [[UILabel alloc] init]UILabel *label = [[UILabel alloc] init]UILabel *label = [[UILabel alloc] init]UILabel *label = [[UILabel alloc] init]UILabel *label = [[UILabel alloc] init]\nUILabel *label = [[UILabel alloc] init]UILabel *label = [[UILabel alloc] init]UILabel *label = [[UILabel alloc] init]UILabel *label = [[UILabel alloc] init]UILabel *label = [[UILabel alloc] init]UILabel *label = [[UILabel alloc] init]UILabel *label = [[UILabel alloc] init]UILabel *label = [[UILabel alloc] init]UILabel *label = [[UILabel alloc] init]\nUILabel *label = [[UILabel alloc] init]UILabel *label = [[UILabel alloc] init]UILabel *label = [[UILabel alloc] init]UILabel *label = [[UILabel alloc] init]UILabel *label = [[UILabel alloc] init]UILabel *label = [[UILabel alloc] init]UILabel *label = [[UILabel alloc] init]\nUILabel *label = [[UILabel alloc] init]UILabel *label = [[UILabel alloc] init]", linkUrl: "https://www.baidu.com")
            }
        }
    }
    
    
    var body: some View {
        NavigationView {
            #if os(iOS) || os(watchOS) || os(tvOS)
            list.navigationTitle("WMUIKit")
            Text("选择一个视图")
            #elseif os(OSX)
            list.listStyle(SidebarListStyle())
            Text("选择一个视图")
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            #endif
        }
        .accentColor(.accentColor)
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
        // .navigationSubtitle("内部UI代码示例")
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
