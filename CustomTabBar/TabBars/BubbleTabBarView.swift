//
//  BubbleTabBarView.swift
//  CustomTabBar
//
//  Created by MacBook Pro on 2020/10/26.
//

import SwiftUI

var bubbleTabBars = ["home","video","message","discover"]

struct BubbleTabBarView: View {
    
    @State private var selected = "home"
    @State var centerX : CGFloat = 0
    init() {
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        
        VStack(spacing: 0) {
            TabView(selection: $selected) {
                NavigationView {
                    HomeView()
                }
                .tag(tabBars[0])
                .ignoresSafeArea(.all, edges: .top)
                
                NavigationView {
                    VideoView()
                }
                .tag(tabBars[1])
                .ignoresSafeArea(.all, edges: .top)

                NavigationView {
                    FindView()
                }
                .tag(tabBars[2])
                .ignoresSafeArea(.all, edges: .top)

                NavigationView {
                    MessageView()
                }
                .tag(tabBars[3])
                .ignoresSafeArea(.all, edges: .top)

            }
            HStack(spacing: 0, content: {
                ForEach(bubbleTabBars, id: \.self) { (value)  in
                    BubbleTabBarButton(selected: $selected, value: value)
                    if value != bubbleTabBars.last{Spacer(minLength: 0)}
                }
            })
            .padding(.horizontal, 20)//关联TabBarButton中(UIScreen.main.bounds.size.width-2*24)/5
            .padding(.top)
            .padding(.bottom, UIApplication.shared.windows.first?.safeAreaInsets.bottom == 0 ? 15 : UIApplication.shared.windows.first?.safeAreaInsets.bottom)
        }
        .ignoresSafeArea(.all, edges: .bottom)
    }
}

struct BubbleTabBarView_Previews: PreviewProvider {
    static var previews: some View {
        BubbleTabBarView()
    }
}

struct BubbleTabBarButton: View {
    @Binding var selected: String
    var value: String

    var body: some View {
        
        Button(action: {
            withAnimation(.spring()) {
                selected = value
            }
        }, label: {
            HStack(spacing: 5, content: {
                Image(selected == value ? value + "_selected": value)
                    .resizable()
                    .renderingMode(.template)
                    .frame(width:26,height: 26)
                    .foregroundColor(selected == value ? .purple : .gray)
//                    .rotation3DEffect(selected == value ? .zero : .degrees(-180), axis: (x: 0.0, y: 1.0, z: 0.0))

                    Text(value)
                        .font(.caption)
                        .foregroundColor(selected == value ? .purple : .gray)
                        .opacity(selected == value ? 1.0 : 0)
            })
            .padding()
            .frame(width: selected == value ? 110 : 44,height: 44)
            .background(selected == value ? Color.black.opacity(0.1) : Color.white)
            .clipShape(Capsule())

        })
    }
}
