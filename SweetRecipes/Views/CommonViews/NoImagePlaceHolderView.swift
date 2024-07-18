//
//  NoImagePlaceHolderView.swift
//  SweetRecipes
//
//  Created by G Zhen on 7/18/24.
//

import SwiftUI

struct NoImagePlaceHolderView: View {
    let width: CGFloat
    let height: CGFloat
    
    var body: some View {
        ZStack {
            Color.gray
            VStack {
                Text("NO")
                Text("Image")
            }
            .foregroundStyle(Color.black)
        }
        .opacity(0.2)
        .frame(width: width, height: height)
    }
}

#Preview {
    NoImagePlaceHolderView(width: 200, height: 200)
}
