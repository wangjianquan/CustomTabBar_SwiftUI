//
//  VideoView.swift
//  AppDemo_SwiftUI
//
//  Created by MacBook Pro on 2020/10/22.
//

import SwiftUI

struct VideoView: View {
    var body: some View {
        List {
            ForEach(0...20, id: \.self) { (id) in
                Text("视频")
            }
            
        }.navigationTitle("视频")
    }
}

struct VideoView_Previews: PreviewProvider {
    static var previews: some View {
        VideoView()
    }
}
