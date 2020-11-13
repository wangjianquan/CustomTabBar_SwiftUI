//
//  ZZTabBar.swift
//  CustomTabBar
//
//  Created by MacBook Pro on 2020/11/12.
//  转转TabBar

import SwiftUI

struct ZZTabBar: View {
    fileprivate var tabBars = ["首页","玩家","消息","我的"]

    @State private var selected = "首页"
    @State private var isPresented = false

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
                    MessageView()
                }
                .tag(tabBars[2])
                .ignoresSafeArea(.all, edges: .top)

                NavigationView {
                    MyView()
                }
                .tag(tabBars[3])
                .ignoresSafeArea(.all, edges: .top)

            }
            ZStack {
                HStack(content: {
                    ForEach(tabBars, id: \.self) { (value)  in
                        ZZTabBarButton(selected: $selected, value: value)
                        if value != tabBars.last{Spacer(minLength: 0)}
                        if value == tabBars[1]{
                            Spacer().frame(width:40)
                        }
                    }
                })
                .frame(height: 49)
                .padding(.horizontal,20)
                .padding(.bottom,UIApplication.shared.windows.first?.safeAreaInsets.bottom)
                .background(ZZCurvedShape())
                
                Button(action: {
                    withAnimation(.spring()) {
                        self.isPresented.toggle()
                    }
                }, label: {
                    Image("tab_willsell")
                })
                .fullScreenCover(isPresented: $isPresented, content: {
                    PublishView()
                })
                .frame(width: 49,height: 49)
                .shadow(color: Color.red.opacity(0.5), radius: 5, x: 0.0, y: 0.0)
                .offset(y:  UIApplication.shared.windows.first?.safeAreaInsets.bottom == 0 ? -25 : -35)
            }
            



        }
        .ignoresSafeArea(.all, edges: .bottom)
        .background(Color.white)
    }
}

struct ZZTabBar_Previews: PreviewProvider {
    static var previews: some View {
        ZZTabBar()
    }
}

struct ZZTabBarButton: View {
    @Binding var selected: String
    var value: String

    var body: some View {
        
        Button(action: {
            withAnimation(.spring()) {
                selected = value
            }
        }, label: {
            VStack(spacing:0) {
                Image(selected == value ? value + "_select": value)
                    .frame(width:26,height: 26)
                Text(value)
                    .font(.caption)
                Spacer(minLength: 10)
            }
            .padding(.top)
        })
        .frame(width: 49,height: 49)
        .foregroundColor(selected == value ? .red : .gray)
//        .background(Color.green)

    }
}

struct ZZCurvedShape: View {
    var body: some View{
        Path{ path in
            
            let height = UIApplication.shared.windows.first?.safeAreaInsets.bottom == 0 ? 0 : UIApplication.shared.windows.first?.safeAreaInsets.bottom

            path.move(to: CGPoint(x: 0, y: 0))
            path.addLine(to: CGPoint(x: UIScreen.main.bounds.width, y: 0))
            path.addLine(to: CGPoint(x: UIScreen.main.bounds.width, y:49 + height!))

            path.addArc(center: CGPoint(x: UIScreen.main.bounds.width/2, y:49 + height!), radius: 35, startAngle: .zero, endAngle: .init(degrees: 180), clockwise: true)//false

            path.addLine(to: CGPoint(x: 0, y: 49 + height!))
        }
        .fill(Color.white)
        .shadow(color: Color.black.opacity(0.5), radius: 5, x: 0.0, y: 0.0)
        .rotationEffect(.init(degrees: 180))
    }
}
