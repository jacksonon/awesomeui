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
    
    @Binding var uitemData: [ItemModel]
    @State private var ustr: String = "读取到的数据"
    @Binding var showCodeInput: Bool
    
    @State private var codeTitle: String = ""
    @State private var codeStr: String = "请将常用代码粘贴到此处，录入代码将在下次启动时生效"
    
    
    func writeToFile(_ someModel: ItemModel) {
        /* 首先读取文件原本内容：使用沙盒文件；应用在一开始的时候读取文件到沙盒，如果有添加，请在github上更新替换的文件；【一般除了我也不会有人修改这个文件】
         */
        // 获取本地现有的文件
        let paths = NSSearchPathForDirectoriesInDomains(.desktopDirectory, .userDomainMask, true)
        let path = paths[0]
        let pathUse = path + "/codes.json"
        let url = URL(fileURLWithPath: pathUse)
        // 然后追加新数据到文件，之后再写入文件
        self.uitemData.append(someModel)
        let jsonEncoder = JSONEncoder()
        let mdata = try? jsonEncoder.encode(self.uitemData)
        try! mdata?.write(to: url, options: .atomic)
        
        self.closePage()
    }
    
    func closePage() {
        self.showCodeInput = false
    }
    
    var body: some View {
        
        VStack {
            // 录入代码
            HStack {
                Text("代码录入")
                Button("关闭界面") {
                    self.closePage()
                }
            }
            
            TextField("输入代码块名称", text: $codeTitle)
            
            
            TextEditor(text: $codeStr)
                .frame(width: 300, height: 200)
            
            // 拷贝diamante
            Button("保存代码到json共享文件") {
                let itemModel = ItemModel(titleName: self.codeTitle, titleIcon: "", iconName: "", desc: "这是一段可以快速创建SwiftUI预览的代码", code: self.codeStr)
                self.writeToFile(itemModel)
            }
        }
    }
}

//struct CodeInput_Previews: PreviewProvider {
//    static var previews: some View {
//    }
//}


/* 拷贝
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
 */

/* 模拟3组数据
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
*/


/* 模拟解码👍
let jd = JSONDecoder()
let uar: [ItemModel] = try! jd.decode([ItemModel].self, from: rdata as! Data)
print(uar)
self.ustr = uar[0].code
 */


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
