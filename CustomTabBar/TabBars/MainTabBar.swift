//
//  MainTabBar.swift
//  CustomTabBar
//
//  Created by MacBook Pro on 2020/10/23.
//

import SwiftUI

enum MainTab: String {
    case home
    case video
    case discover
    case message
    case profile
}

var mainTabBars = [MainTab.home,MainTab.video,MainTab.discover,MainTab.message,MainTab.profile]

struct MainTabBar: View {
        @State private var selection: MainTab = .home
        

        init() {
            UITabBar.appearance().isHidden = true
        }
        var body: some View {
            
            VStack(spacing: 0) {
                TabView(selection: $selection) {
                    NavigationView {
                        HomeView()
                    }
                    .tag(MainTab.home)
                    .ignoresSafeArea(.all, edges: .top)
                    
                    NavigationView {
                        VideoView()
                    }
                    .tag(MainTab.video)
                    .ignoresSafeArea(.all, edges: .top)

                    NavigationView {
                        FindView()
                    }
                    
                    .tag(MainTab.discover)
                    .ignoresSafeArea(.all, edges: .top)

                    NavigationView {
                        MessageView()
                    }
                    
                    .tag(MainTab.message)
                    .ignoresSafeArea(.all, edges: .top)

                    NavigationView {
                        MyView()
                    }
                    
                    .tag(MainTab.profile)
                    .ignoresSafeArea(.all, edges: .top)

                }
                HStack( spacing: 0, content: {
                    ForEach(mainTabBars, id: \.self) { (value)  in
                        MainTabBarButton(selected: $selection, currentValue: value)
                        if value != mainTabBars.last{Spacer(minLength: 0)}
                    }
                })
                .frame(width: (UIScreen.main.bounds.size.width-2*24)/5,height: 50)
                .padding(.horizontal, 24)
                .padding(.bottom, UIApplication.shared.windows.first?.safeAreaInsets.bottom == 0 ? 15 : UIApplication.shared.windows.first?.safeAreaInsets.bottom)
            }
            .ignoresSafeArea(.all, edges: .bottom)
        }
    }

struct MainTabBar_Previews: PreviewProvider {
    static var previews: some View {
        MainTabBar()
    }
}

struct MainTabBarButton: View {
    @Binding  var selected: MainTab
    var currentValue: MainTab

    var body: some View {
        
        Button(action: {
            withAnimation(.spring()) {
                selected = currentValue
            }
        }, label: {
            VStack {
                let imageName = currentValue.rawValue
                
                Image(selected == currentValue ? imageName + "_selected": imageName)
                    .resizable()
                    .renderingMode(.template)
                    .frame(width:26,height: 26)
                    .foregroundColor(selected == currentValue ? .purple : .gray)
                Divider()
                    .background(Color.purple)
                    .frame(width: selected == currentValue ? 16 : 0)

                Text(currentValue.rawValue)
                    .font(.caption)
                    .foregroundColor(selected == currentValue ? .purple : .gray)
                    .opacity(selected == currentValue ? 1.0 : 0)
            }
            .frame(width: (UIScreen.main.bounds.size.width-2*24)/5,height: 50)
            .padding(.top)
//            .background(Color.red)
            .offset(y: selected == currentValue ? -8 : 0)
        })
    }
}
