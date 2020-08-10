//
//  DetailView.swift
//  awesomeui
//
//  Created by 王家伟 on 2020/8/10.
//

import SwiftUI

struct DetailView: View {
    var body: some View {
        GeometryReader { geo in
            VStack (spacing: 0){
                
                HStack(spacing: 0) {
                    VStack(spacing: 0) {
                        Image(systemName: "tv.circle.fill")
                            .resizable()
                            .frame(width: 100, height: 100)
                    }.frame(width: 200, height: 200, alignment: .leading)
                    
                    Text("此控件可以打开一个相册，并且选取图片，提供图片预览的功能！asdfkjadslkfjlaksdjflkjasdflkjds; dslkfj;laksdjflksdjfljsdf;jiasdjgosdjgisdjf;lsdaj")
                }
                .frame(width: geo.size.width, height: 300)
                .background(Color.yellow)
                
                Text("""
                    UIButton *btn = [UIButton new];
                    btn.backgroundColor = [UIColor whiteColor];
                    [self.view addSubview: btn];
                    """)
                    .bold()
                    .foregroundColor(.black)
                    .frame(width: geo.size.width, height: geo.size.height - 400)
                    .background(Color.orange)
                    
                
                Button(action: {
                    print("拷贝代码到剪贴板")
                }, label: {
                    Text("拷贝代码")
                        .foregroundColor(.blue)
                        .bold()
                })
                .frame(width: geo.size.width, height: 100 , alignment: .center)
                .background(Color.red)
            }
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            DetailView()
        }
    }
}
