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
            NavigationLink(
                destination: ContentView(title: "sdsd"),
                label: {
                    Text("首页 \(id)")

                })
            }
            
        }
        .navigationTitle("首页")
        .navigationBarTitleDisplayMode(.inline)
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
