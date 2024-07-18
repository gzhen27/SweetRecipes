//
//  CardContentView.swift
//  SweetRecipes
//
//  Created by G Zhen on 7/18/24.
//

import SwiftUI

struct CardContentView: View {
    let name: String
    let width: CGFloat
    let height: CGFloat
    
    var body: some View {
        HStack() {
            Text(name)
                .font(.footnote)
                .fontWeight(.medium)
                .padding(.horizontal)
                .frame(width: width, height: height)
        }
        .background(Color("CardBackground"))
        .foregroundStyle(Color("CardContent"))
    }
}

#Preview {
    CardContentView(name: "Recipe Name", width: 200, height: 50)
}
