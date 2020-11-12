//
//  CurvedTabBar.swift
//  CustomTabBar
//
//  Created by MacBook Pro on 2020/11/11.
//

import SwiftUI

struct CurvedTabBar: View {
    fileprivate var tabBars = ["home","video","message","profile"]

    @State private var selected = "home"
    @State var centerX : CGFloat = 0
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

            HStack(content: {
                ZStack( content: {
                    BottomBar(selected: $selected)
                        .padding(.horizontal,24)
                        .padding(.bottom,UIApplication.shared.windows.first?.safeAreaInsets.bottom)
                        .background(CurvedShape())

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
                    .frame(width: 49, height: 49)
                    .clipShape(Circle())
                    .shadow(color: Color.black.opacity(0.5), radius: 5, x: 0.0, y: 0.0)
                    .offset(y:  UIApplication.shared.windows.first?.safeAreaInsets.bottom == 0 ? -25 : -40)
                })
            })
        }
        .ignoresSafeArea(.all, edges: .bottom)
        .background(Color.white)

    }
}

struct CurvedTabBar_Previews: PreviewProvider {
    static var previews: some View {
        CurvedTabBar()
    }
}
struct BottomBar: View {
    @Binding  var selected: String

    var body: some View {
        HStack(alignment: .top, spacing: nil, content: {
            Button(action: {
                withAnimation(.spring()) {
                    self.selected = "home"
                }
            }, label: {
                VStack(spacing:0){
                    Spacer(minLength: 5)
                    Image("home")
                        .resizable()
                        .renderingMode(.template)
                        .frame(width: 26, height: 26)
                    Text("首页")
                        .font(.caption)
                    Spacer(minLength: 5)
                }
            })
            .foregroundColor(selected == "home" ? .red : .secondary)
            
            Spacer(minLength: 12)
            
            Button(action: {
                withAnimation(.spring()) {
                    self.selected = "video"
                }
            }, label: {
                VStack(spacing:0){
                    Spacer(minLength: 5)
                    Image("video")
                        .resizable()
                        .renderingMode(.template)
                        .frame(width: 26, height: 26)
                    Text("视频")
                        .font(.caption)
                    Spacer(minLength: 5)
                }
            })
            .foregroundColor(selected == "video" ? .red : .secondary)
            
            Spacer().frame(width:100)

            Button(action: {
                withAnimation(.spring()) {
                    self.selected = "message"
                }
            }, label: {
                VStack(spacing:0){
                    Spacer(minLength: 5)
                    Image("message")
                        .resizable()
                        .renderingMode(.template)
                        .frame(width: 26, height: 26)
                    Text("消息")
                        .font(.caption)
                    Spacer(minLength: 5)
                }
            })
            .foregroundColor(selected == "message" ? .red : .secondary)

            
            Spacer(minLength: 12)
            Button(action: {
                withAnimation(.spring()) {
                    self.selected = "profile"
                }
            }, label: {
                VStack(spacing:0){
                    Spacer(minLength: 5)
                    Image("profile")
                        .resizable()
                        .renderingMode(.template)
                        .frame(width: 26, height: 26)
                    Text("我的")
                        .font(.caption)
                    Spacer(minLength: 5)
                }
            }).foregroundColor(selected == "profile" ? .red : .secondary)

        })
        .frame(height:49)
//        .background(Color.blue)
    }
}

struct CurvedTabBarButton: View {
    @Binding var selected: String
    var value: String

    var body: some View {
        
        Button(action: {
            withAnimation(.spring()) {
                selected = value
            }
        }, label: {
            VStack(spacing: 5, content: {
                Image(selected == value ? value + "_selected": value)
                    .resizable()
                    .renderingMode(.template)
                    .frame(width:26,height: 26)
                    .foregroundColor(selected == value ? .purple : .gray)
//                    Text(value)
//                        .font(.caption)
//                        .foregroundColor(selected == value ? .purple : .gray)
            })
            .padding()
//            .offset(y: "message" == value ? -35 : 0)
//            .frame(height: 44)
//            .background(Color.black.opacity(0.5))

        })
    }
}

struct CurvedShape: View {
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
        .shadow(color: Color.black.opacity(0.3), radius: 5, x: 0.0, y: 0.0)
        .rotationEffect(.init(degrees: 180))
    }
}

