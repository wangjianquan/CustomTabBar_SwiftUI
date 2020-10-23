//
//  HomeView.swift
//  AppDemo_SwiftUI
//
//  Created by MacBook Pro on 2020/10/16.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        List {
            ForEach(0...20, id: \.self) { (id) in
                Text("首页")
            }
            
        }.navigationTitle("首页")
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
