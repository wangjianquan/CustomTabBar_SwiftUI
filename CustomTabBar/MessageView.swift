//
//  MessageView.swift
//  AppDemo_SwiftUI
//
//  Created by MacBook Pro on 2020/10/22.
//

import SwiftUI

struct MessageView: View {
    var body: some View {
        List {
            ForEach(0...20, id: \.self) { (id) in
                Text("消息")
            }
        }
        .navigationTitle("消息")
    }
}

struct MessageView_Previews: PreviewProvider {
    static var previews: some View {
        MessageView()
    }
}
