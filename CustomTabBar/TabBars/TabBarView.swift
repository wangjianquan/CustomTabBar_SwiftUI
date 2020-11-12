//
//  TabBarView.swift
//  AppDemo_SwiftUI
//
//  Created by MacBook Pro on 2020/10/22.
//

import SwiftUI


var tabBars = ["home","video","message","discover","profile"]

struct TabBarView: View {
    
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

                NavigationView {
                    MyView()
                }
                .tag(tabBars[4])
                .ignoresSafeArea(.all, edges: .top)

            }
            HStack(spacing: 0, content: {
                ForEach(tabBars, id: \.self) { (value)  in
                    GeometryReader(content: { geometry in
                        TabBarButton(selected: $selected, value: value,centerX: $centerX,rect: geometry.frame(in: .global))
                            .onAppear(perform: {
                                if value == tabBars.first {
                                    centerX = geometry.frame(in: .global).midX
                                }
                            })
                    })
                    .frame(height: 50)
                    if value != tabBars.last{Spacer(minLength: 0)}
                }
            })
            .padding(.horizontal, 24)//关联TabBarButton中(UIScreen.main.bounds.size.width-2*24)/5
            .padding(.top)
            .padding(.bottom, UIApplication.shared.windows.first?.safeAreaInsets.bottom == 0 ? 15 : UIApplication.shared.windows.first?.safeAreaInsets.bottom)
            .background(Color.white.clipShape(AnimatedShape(centerX: centerX)))
            .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: -5)
            .padding(.top, -15)
        }
        .ignoresSafeArea(.all, edges: .bottom)
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}

struct TabBarButton: View {
    @Binding var selected: String
    var value: String
    @Binding var centerX: CGFloat
    var rect : CGRect

    var body: some View {
        
        Button(action: {
            withAnimation(.spring()) {
                selected = value
                centerX = rect.midX
            }
        }, label: {
            VStack {
                Image(selected == value ? value + "_selected": value)
                    .resizable()
                    .renderingMode(.template)
                    .frame(width:26,height: 26)
                    .foregroundColor(selected == value ? .purple : .gray)
                    .rotation3DEffect(selected == value ? .zero : .degrees(-180), axis: (x: 0.0, y: 1.0, z: 0.0))

                Text(value)
                    .font(.caption)
                    .foregroundColor(selected == value ? .purple : .gray)
                    .opacity(selected == value ? 1.0 : 0)
            }
            .padding(.top)
//            .background(Color.red)
            .frame(width: (UIScreen.main.bounds.size.width-2*24)/5,height: 50)
        })
    }
}


struct AnimatedShape: Shape {
    var centerX : CGFloat
    var animatableData: CGFloat {
        get{return centerX}
        set{centerX = newValue}
    }
    
    func path(in rect : CGRect) -> Path {
        return Path { path in
            path.move(to: CGPoint(x: 0, y: 15))
            path.addLine(to: CGPoint(x: 0, y: rect.height))
            path.addLine(to: CGPoint(x: rect.width, y: rect.height))
            path.addLine(to: CGPoint(x: rect.width, y: 15))

            let buttonWidth = (UIScreen.main.bounds.size.width-2*24)/5

            path.move(to: CGPoint(x: centerX-buttonWidth/2, y: 15))
            path.addQuadCurve(to: CGPoint(x: centerX + buttonWidth/2, y: 15), control: CGPoint(x: centerX, y: -30))
        }
    }
    
}
