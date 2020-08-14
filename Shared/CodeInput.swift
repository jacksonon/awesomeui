//
//  CodeInput.swift
//  awesomeui
//
//  Created by wangjiawei on 2020/8/14.
//

import SwiftUI

/*
 
 代码录入：
 1. TextEditor文本录入
 2. 缩略图图片选择
 3. 标题
 */

/// 代码录入界面
struct CodeInput: View {
    
    @State private var codeStr: String = "请将常用代码粘贴到此处"
    @State private var ustr: String = "读取到的数据"
    
    var body: some View {
        VStack {
            
            // 录入代码
            Text("代码录入")
            TextEditor(text: $codeStr)
                .frame(width: 300, height: 200)
            
            // 展示粘贴过来的代码
            Text(self.codeStr)
                .fixedSize(horizontal: false, vertical: true)
            
            // 拷贝diamante
            Button("拷贝代码") {
                
                // 拷贝
                let ppt = NSPasteboard.general
                ppt.declareTypes([.string], owner: nil)
                ppt.setString(self.codeStr, forType: .string)
                
                // 将代码写入文件
                
                // 1. 获取document path
                let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
                let path = paths[0]
                
                // 2. 拼接写入文件路径
                let pathUse = path + "/codejson.json"
                let url = URL(fileURLWithPath: pathUse)
                
                // 3.0
                let itemModel = ItemModel(titleName: "模拟视图标题", titleIcon: "", iconName: "", desc: "这是一段可以快速创建SwiftUI预览的代码", code: self.codeStr)
                
                // 模拟3组数据
                var uarr = [ItemModel]()
                for _ in 0..<3 {
                    uarr.append(itemModel)
                }
                
                // 模拟多数据写入
                let jsonEncoder = JSONEncoder()
                let mdata = try? jsonEncoder.encode(uarr)
                try! mdata?.write(to: url, options: .atomic)
                
                // 获取数据
                let rdata = NSData(contentsOf: url)
                
            
                
                // 模拟解码👍
                let jd = JSONDecoder()
                let uar: [ItemModel] = try! jd.decode([ItemModel].self, from: rdata as! Data)
                print(uar)
                self.ustr = uar[0].code

                
                /* 模拟解码笨蛋方法
                let array = try? JSONSerialization.jsonObject(with: rdata! as Data, options: JSONSerialization.ReadingOptions.mutableContainers)
                 
                for item in array as! [Dictionary<String, Any>]  {
                    // 解码
                    let jsonDecoder = JSONDecoder()
                    let jsonData = try? JSONSerialization.data(withJSONObject: item, options: [])
                    let model: ItemModel = try! jsonDecoder.decode(ItemModel.self, from: jsonData!)
                    
                    print(model)
                    self.ustr = model.code
                }
 */
                
                
                /* 3. 写入文件：
                let data = try! JSONSerialization.data(withJSONObject: [self.codeStr], options: JSONSerialization.WritingOptions.prettyPrinted)
                try! data.write(to: url, options: .atomic)

                
                // 4. 读文件并复制到新的text
                let rdata = NSData(contentsOf: url)
                let array = try? JSONSerialization.jsonObject(with: rdata! as Data, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String]
                print(array?[0] ?? "")
                self.ustr = array?[0] ?? ""
 
                 */
            }
            
            Text(ustr)
                .fixedSize(horizontal: false, vertical: true)
        }
    }
}

struct CodeInput_Previews: PreviewProvider {
    static var previews: some View {
        CodeInput()
    }
}
