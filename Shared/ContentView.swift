//
//  ContentView.swift
//  Shared
//
//  Created by 王家伟 on 2020/8/10.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
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
        .navigationTitle(Text("UI辅助工具"))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
