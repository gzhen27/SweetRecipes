//
//  InstructionsView.swift
//  SweetRecipes
//
//  Created by G Zhen on 7/21/24.
//

import SwiftUI

struct InstructionsView: View {
    let instructions: [String]
    let scrollViewProxy: ScrollViewProxy
    
    var body: some View {
        VStack(alignment: .leading) {
            ForEach(instructions.indices, id: \.self) { index in
                Text("Step \(index + 1):")
                    .font(.headline)
                    .padding(.bottom, 4)
                    .id(0)
                Text(instructions[index])
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                    .background(Color("CardBackground"))
                    .clipShape(RoundedRectangle(cornerRadius: 12))
            }
            .padding(.bottom, 4)
        }
        .onAppear {
            scrollViewProxy.scrollTo(0)
        }
    }
}

#Preview {
    ScrollViewReader { proxy in
        InstructionsView(instructions: MealDetail.previewData.instructions, scrollViewProxy: proxy)
    }
}
