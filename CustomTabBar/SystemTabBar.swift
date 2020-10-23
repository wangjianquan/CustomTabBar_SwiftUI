//
//  SystemTabBar.swift
//  CustomTabBar
//
//  Created by MacBook Pro on 2020/10/23.
//

import SwiftUI

extension SystemTabBar {
    enum Tab {
        case home
        case video
        case discover
        case message
        case profile
    }
}


struct SystemTabBar: View {
    @State private var selection: Tab = .home
    
    var body: some View {
        TabView(selection: $selection) {
            NavigationView {
                HomeView()
            }.tabItem {
                Label("微博", systemImage: "house.fill")
            }.tag(Tab.home)
            
            NavigationView {
                VideoView()
            }.tabItem {
                Label("视频", systemImage: "video.fill")
            }.tag(Tab.video)

            NavigationView {
                FindView()
            }.tabItem {
                Label("发现", systemImage: "magnifyingglass.circle.fill")
            }.tag(Tab.discover)

            NavigationView {
                MessageView()
            }.tabItem {
                Label("我", systemImage: "message.fill")
            }.tag(Tab.message)

            NavigationView {
                MyView()
            }.tabItem{
                Label("我", systemImage: "person.fill")
            }.tag(Tab.profile)
        }
    }
}

struct SystemTabBar_Previews: PreviewProvider {
    static var previews: some View {
        SystemTabBar()
    }
}
