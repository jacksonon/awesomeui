//
//  MenuListView.swift
//  awesomeui
//
//  Created by 王家伟 on 2020/8/10.
//

import SwiftUI

struct MenuListView: View {
    var body: some View {
        GeometryReader { geo in
            VStack (spacing: 0) {
                Text("筛选、过滤视图")
                    .bold()
                    .foregroundColor(.red)
                    .frame(width: geo.size.width, height: 100, alignment: .center)
                ScrollView {
                    LazyVStack {
                        ForEach(1...100, id: \.self) {
                            Text("Row \($0)")
                        }
                    }
                }
                .background(Color.green)
            }
            .listStyle(SidebarListStyle())
        }
    }
}

struct MenuListView_Previews: PreviewProvider {
    static var previews: some View {
        MenuListView()
    }
}
