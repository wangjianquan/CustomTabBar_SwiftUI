//
//  MyView.swift
//  AppDemo_SwiftUI
//
//  Created by MacBook Pro on 2020/10/16.
//

import SwiftUI


struct MyView: View {
    var body: some View {
        List {
            ForEach(0...20, id: \.self) { (id) in
                Text("我")
            }
        }
        .navigationTitle("我的")
    }
}

struct MyView_Previews: PreviewProvider {
    static var previews: some View {
        MyView()
    }
}
