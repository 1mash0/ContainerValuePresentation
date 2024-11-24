//
//  TitleSlide.swift
//  ContainerValuePresentation
//
//  Created by 今末 翔太 on 2024/10/22.
//

import SlideKit
import SwiftUI

@Slide
struct TitleSlide: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 32) {
            Text("ContainerValues って何？")
                .fontWeight(.heavy)
                .font(.system(size: 120))
            Spacer()
                .frame(height: 40)
            Text("今末 翔太")
                .fontWeight(.semibold)
                .font(.system(size: 72))
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
        .foregroundColor(.white)
        .background(Color.accentColor)
    }
    
    var shouldHideIndex: Bool { true }
}

#Preview {
    SlidePreview {
        TitleSlide()
    }
}
