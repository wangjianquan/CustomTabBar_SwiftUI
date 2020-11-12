//
//  PublishView.swift
//  CustomTabBar
//
//  Created by MacBook Pro on 2020/11/12.
//

import SwiftUI

struct PublishView: View {
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack {
            
            Text("信息发布")
                .font(.headline)
            Divider()
            Spacer()
            HStack(alignment:.center,spacing: 5, content: {
                Button(action: {
                    presentationMode.wrappedValue.dismiss()

                }, label: {
                    Image(systemName: "multiply.circle.fill")
                        .resizable()
                        .frame(width: 30, height: 30)
                })
            
                .frame(maxWidth: 44, maxHeight: 44)
            })
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.white)
//        .edgesIgnoringSafeArea(.all)
        .onTapGesture {
            presentationMode.wrappedValue.dismiss()
        }
        
    }
}

struct PublishView_Previews: PreviewProvider {
    static var previews: some View {
        PublishView()
    }
}
