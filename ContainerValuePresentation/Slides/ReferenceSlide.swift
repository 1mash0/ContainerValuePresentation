//
//  ReferenceSlide.swift
//  ContainerValuePresentation
//
//  Created by 今末 翔太 on 2024/10/23.
//

import SlideKit
import SwiftUI

@Slide
struct ReferenceSlide: View {
    @Environment(\.openURL) var openURL
    
    var body: some View {
        HeaderSlide("参考") {
            VStack(alignment: .leading) {
                Item("ContainerValues") {
                    Text("https://developer.apple.com/documentation/swiftui/containervalues")
                        .font(.system(size: 40))
                }
                Item("EnvironmentValues") {
                    Text("https://developer.apple.com/documentation/swiftui/environmentvalues")
                        .font(.system(size: 40))
                }
                Item("Preferences") {
                    Text("https://developer.apple.com/documentation/swiftui/preferences")
                        .font(.system(size: 40))
                }
                Item("SwiftUIコンテナの解説") {
                    Text("https://developer.apple.com/jp/videos/play/wwdc2024/10146/")
                        .font(.system(size: 40))
                }
                Item("Creating custom container views") {
                    Text("https://developer.apple.com/documentation/swiftui/creating-custom-container-views")
                        .font(.system(size: 40))
                }
            }
        }
    }
}

#Preview {
    SlidePreview {
        ReferenceSlide()
    }
}
