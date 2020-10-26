//
//  FindView.swift
//  AppDemo_SwiftUI
//
//  Created by MacBook Pro on 2020/10/22.
//

import SwiftUI

struct FindView: View {
    var body: some View {
        List {
            ForEach(0...20, id: \.self) { (id) in
                Text("发现")
            }
            
        }
        .navigationTitle("发现")
        .navigationBarTitleDisplayMode(.inline)

    }
}

struct FindView_Previews: PreviewProvider {
    static var previews: some View {
        FindView()
    }
}
