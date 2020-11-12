//
//  TabBarLineStyle.swift
//  CustomTabBar
//
//  Created by MacBook Pro on 2020/10/30.
//

import SwiftUI

struct TabBarLineStyle: View {
    
    @State private var selection: MainTab = .home
    @Namespace var animation
    
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
                    LineTabBarButton(selected: $selection, currentValue: value, animation: animation)
                    if value != mainTabBars.last{
                        Spacer(minLength: 0)
                    }
                }
            })
            .padding(.horizontal, 24)
            .padding(.bottom, UIApplication.shared.windows.first?.safeAreaInsets.bottom == 0 ? 15 : UIApplication.shared.windows.first?.safeAreaInsets.bottom)
            .background(Color.white)
        }
        .ignoresSafeArea(.all, edges: .bottom)
        .background(Color.black.opacity(0.05).ignoresSafeArea(.all, edges: .all))
    }
}

struct TabBarLineStyle_Previews: PreviewProvider {
    static var previews: some View {
        TabBarLineStyle()
    }
}


struct LineTabBarButton: View {
    @Binding  var selected: MainTab
    var currentValue: MainTab
    var animation: Namespace.ID
    
    var body: some View {
        
        Button(action: {
            withAnimation(.spring()) {
                selected = currentValue
            }
        }, label: {
            VStack(spacing:5) {
                ZStack {
                    LineShape()
                        .fill(Color.clear)
                        .frame(width: 45, height: 6)//(width: 6, height: 6)
                    
                    if selected == currentValue {
                        LineShape()
                            .fill(Color.purple)
                            .frame(width: 45, height: 6)//(width: 6, height: 6)
                            .matchedGeometryEffect(id: "Tab_Change", in: animation)
                    }
                }
                .padding(.bottom,5)

                let imageName = currentValue.rawValue
                Image(selected == currentValue ? imageName + "_selected": imageName)
                    .resizable()
                    .renderingMode(.template)
                    .frame(width:26,height: 26)
                    .foregroundColor(selected == currentValue ? .purple : .gray)

                Text(currentValue.rawValue)
                    .font(.caption)
                    .foregroundColor(selected == currentValue ? .purple : .gray)
//                    .opacity(selected == currentValue ? 1.0 : 0)
            }
        })
    }
}


struct LineShape: Shape {
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: [.topLeft,.topRight,.bottomLeft,.bottomRight], cornerRadii: CGSize(width: 10, height: 10))
       
        return Path(path.cgPath)
    }
    
    
}
