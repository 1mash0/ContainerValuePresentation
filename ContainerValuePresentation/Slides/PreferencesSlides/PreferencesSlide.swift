//
//  Untitled.swift
//  ContainerValuePresentation
//
//  Created by 今末 翔太 on 2024/10/23.
//

import SlideKit
import SwiftUI

@Slide
struct PreferencesHeaderSlide<Content: View>: View {
    @ViewBuilder var content: Content
    
    var body: some View {
        HeaderSlide("Preferences") {
            content
        }
    }
}

@Slide
struct PreferencesSlide: View {
    enum SlidePhase: Int, PhasedState {
        case initial, second, third
    }
    
    @Phase var phase: SlidePhase
    
    var body: some View {
        PreferencesHeaderSlide {
            Item("サブビューからコンテナに設定情報を送信する")
            
            if $phase.after(.second) {
                Item("iOS 13.0+ | iPadOS 13.0+")
            }
            
            if $phase.after(.third) {
                Item("コンテナは複数のサブビューから設定情報が流れてくるため、矛盾する場合は調整する必要がある")
            }
        }
    }
}

@Slide
struct PreferencesSlide_SampleCode: View {
    enum SlidePhase: Int, PhasedState {
        case initial, second
    }
    
    @Phase var phase: SlidePhase
    
    var body: some View {
        HStack {
            PreferencesHeaderSlide {
                HStack(alignment: .top, spacing: 30) {
                    Code(code_1, fontSize: 32)
                    Divider()
                    Code(code_2, fontSize: 32)
                }
            }
            
            if $phase.current == .second {
                Image("PreferencesPreview")
                    .resizable()
                    .scaledToFit()
            }
        }
    }
    
    private let code_1 = """
struct ContentView: View {
    var body: some View {
        NavigationStack {
            SubView()
        }
    }
}

struct SubView: View {
    var body: some View {
        SubSubView()
    }
}
"""
    
    private let code_2 = """
struct SubSubView: View {
    var body: some View {
        SubSubSubView()
    }
}

struct SubSubSubView: View {
    var body: some View {
        Text("SubSubSubView")
            .font(.title)
            .navigationTitle(
                "Hoge"
            )
    }
}
"""
}

#Preview {
    SlidePreview {
        PreferencesSlide()
    }
}

#Preview {
    SlidePreview {
        PreferencesSlide_SampleCode()
    }
}
