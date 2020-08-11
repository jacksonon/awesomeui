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
    
    @State private var isAnimation = true
    
    @State private var useCode = ""
    
    var body: some View {
        
        ScrollView {
            VStack (spacing: 10){
                
                HStack(spacing: 20) {
                    
    
                    
                    Image(systemName: self.iconName ?? "")
                        .resizable()
                        .frame(width: 150, height: 150, alignment: .leading)
                    Text(self.desc!)
                        .foregroundColor(.gray)
                        .bold()
                        .padding()
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .padding()
                
                VStack {
                    Text(self.code!)
                        .bold()
                        .foregroundColor(.black)
//                        .lineLimit(0)
                        .padding(.all, 5)
                        .fixedSize(horizontal: false, vertical: true) // fix: linelimit 无效的问题
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                
                
                TextEditor(text: self.$useCode)
                    .frame(width: 300, height: 200)
                
                Button(action: {
                    print("copy code")
                    #if os(macOS)
                    let ppt = NSPasteboard.general
                    ppt.declareTypes([.string], owner: nil)
//                    ppt.setString(self.code!, forType: .string)
                    ppt.setString(self.useCode, forType: .string)
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



/*
 OC:代码格式化规则
 1. 遇到 左{ 添加换行符 + 2个空格 ，并且使用一个 stack保存入栈数 . stack + 1
 2. 遇到 ； 添加换行符
 3. 遇到 右} 左侧添加 (stakc - 1) * 2个空格，同时(stack数组减一)
 
 func jw2oclint(_ ipts: String) -> String {
     var rva = ""
     var rvaarr = ipts.map{String($0)} // 字符转成数组
     
     for item in rvaarr {
         <#code#>
     }
     
     return rva;
 }
 */

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            DetailView(iconName: "tv.circle.fill", desc: "控件描述：该控件经常适用于各种基础视图的搭建，请谨慎使用该控件。在任何情况下，该控件都不会造成什么问题，但是不敢保证！！！", code: "UIButton *btn = [[UIButton alloc] init]", linkUrl: "https://www.baidu.com")
        }
    }
}
