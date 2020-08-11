//
//  DetailView.swift
//  awesomeui
//
//  Created by 王家伟 on 2020/8/10.
//

import SwiftUI
import CoreServices

/// 业务视图：绑定每一个content，根据传入值不同，做不同的设计
struct DetailView: View {
    
    /// 展示效果图
    @State var iconName: String?
    
    /// 功能描述
    @State var desc: String?
    
    /// 快捷代码
    @State var code: String?
    
    /// 对应链接
    @State var linkUrl: String?
    
    /// 拷贝按钮弹窗
    @State private var showCopyTip = false
    
    var body: some View {
        
        ScrollView {
            VStack (spacing: 10){
                
                HStack(spacing: 20) {
                    VStack(spacing: 0) {
                        Image(systemName: self.iconName ?? "")
                            .resizable()
                            .frame(width: 100, height: 100)
                    }
                    
                    Text(self.desc!)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color.yellow)
                
                VStack {
                    Text(self.code!)
                        .bold()
                        .foregroundColor(.black)
//                        .lineLimit(0)
                        .padding(.all, 5)
                        .fixedSize(horizontal: false, vertical: true) // fix: linelimit 无效的问题
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                
                Button(action: {
                    print("copy code")
                    #if os(macOS)
                    let ppt = NSPasteboard.general
                    ppt.declareTypes([.string], owner: nil)
                    ppt.setString(self.code!, forType: .string)
                    #else
                    let ppt = UIPasteboard.general
                    // TODO: 稍后支持
                    #endif
                    
                    // 弹窗：
                    self.showCopyTip = true
                }, label: {
                    Text("拷贝代码")
                        .foregroundColor(.blue)
                        .bold()
                })
                .frame(alignment: .bottom)
                .alert(isPresented: self.$showCopyTip, content: {
                    Alert(title: Text("提示"), message: Text("复制代码成功，可以去XCode愉快的粘贴了！！！"), dismissButton: .default(Text("👌")))
                })
            }
            
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            DetailView(iconName: "tv.circle.fill", desc: "控件描述", code: "UIButton *btn = [[UIButton alloc] init]", linkUrl: "https://www.baidu.com")
        }
    }
}
