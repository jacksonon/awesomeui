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
    @Binding var sitem: ItemModel?
    
    
    /// 拷贝按钮弹窗
    @State private var showCopyTip = false
    
    @State private var isAnimation = true
    
    @State private var useCode = ""
    
    var body: some View {
        
        ScrollView {
            VStack (spacing: 10){
                
                HStack(spacing: 20) {
                    
    
                    
                    Image(systemName: self.sitem?.iconName ?? "")
                        .resizable()
                        .frame(width: 150, height: 150, alignment: .leading)
                    Text(self.sitem?.desc ?? "")
                        .foregroundColor(.gray)
                        .bold()
                        .padding()
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .padding()
                
                VStack {
//                    Text(jw2oclint(self.code!))
                    Text(self.sitem?.code ?? "")
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
//                    ppt.setString(jw2oclint(self.code!), forType: .string)
                    ppt.setString(self.sitem?.code ?? "", forType: .string)
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

// 代码格式化
func jw2oclint(_ ipts: String) -> String {
    var rvaarr = ipts.map{String($0)} // 字符转成数组
    
    var lstack = 0
    var rstack = 0
    var fstack = 0
    var tstack = 0
    
    for (index, item) in rvaarr.enumerated() {
        // print("\(item) => \(index)")
        if item == "{" {
            let uindex = index + lstack + rstack + fstack
            lstack += 1
            var istr = ""
            print(lstack)
            if lstack >= 1 {
                for _ in 0...lstack {
                    istr += "  "
                }
            }
            rvaarr.insert("\n\(istr)", at: uindex + 1)
            tstack += 1
        }
        if item == "}" {
            let uindex = index + lstack + rstack + fstack
            rstack += 1
            var istr = ""
            for _ in 0..<tstack {
                istr += "  "
            }
            tstack -= 1
            rvaarr.insert("\n\(istr)", at: uindex + 1)
        }
        if item == ";" {
            let uindex = index + lstack + rstack + fstack
            fstack += 1
            var istr = ""
            for _ in 0...lstack {
                istr += "  "
            }
            rvaarr.insert("\n\(istr)", at: uindex + 1)
        }
    }
    
    return rvaarr.joined();
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
     }
     
     return rva;
 }
 */

/*
struct DetailView_Previews: PreviewProvider {
    @State private var sitem = itemData[0]
    static var previews: some View {
        Group {
            DetailView(sitem: $items[0])
        }
    }
}
*/
