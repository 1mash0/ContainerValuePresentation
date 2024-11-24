//
//  ContainerValuesSlide.swift
//  ContainerValuePresentation
//
//  Created by 今末 翔太 on 2024/10/23.
//

import SlideKit
import SwiftUI

@Slide
struct ContainerValuesHeaderSlide<Content: View>: View {
    @ViewBuilder var content: Content
    
    var body: some View {
        HeaderSlide("ContainerValues") {
            content
        }
    }
}

@Slide
struct ContainerValuesSlide_1: View {
    enum SlidePhase: Int, PhasedState {
        case initial, second, third
    }
    
    @Phase var phase: SlidePhase
    
    var body: some View {
        HeaderSlide("ContainerValues って？") {
            Item("WWDC2024のセッション『Demystify SwiftUI containers』内で紹介された新しいAPI")
            
            if $phase.after(.second) {
                Item("iOS 18.0+ | iPadOS 18.0+")
            }
            
            if $phase.after(.third) {
                Item("Environment や Preference に似たキー付きストレージ")
            }
        }
    }
}

@Slide
struct ContainerValuesSlide_2: View {
    enum SlidePhase: Int, PhasedState {
        case initial, second, third
    }
    
    @Phase var phase: SlidePhase
    
    var body: some View {
        ContainerValuesHeaderSlide {
            Item("特定のビューに関連付けられたコンテナ値のコレクション")
            
            if $phase.after(.second) {
                Code(code, fontSize: 30)
                    .padding()
            }
            
            if $phase.after(.third) {
                Item("`Subview`のコンテナ値コレクションからアクセスする")
            }
        }
    }
    
    private let code = """
extension ContainerValue {
    @Entry var myContainerValue: String = "Default Value"
}

struct ContentView: View {
    var body: some View {
        VStack {
            Text("aaa") // myContainerValue is `hoge`
                .containerValue(\\.myContainerValue, "hoge")

            Text("bbb") // myContainerValue is `Default Value`
        }
    }
}
"""
}

@Slide
struct ContainerValuesSlide_3: View {
    var body: some View {
        ContainerValuesHeaderSlide {
            Item("ForEach(subviews:)")
            Item("Group(subviews:)")
            Item("ForEach(sections:)")
            Item("etc...")
        }
    }
}

@Slide
struct ContainerValuesSlide_SampleCode_1: View {
    var body: some View {
        HStack {
            Code(code, fontSize: 28)
                .padding()
            Image("ContainerValuesPreview")
                .resizable()
                .scaledToFit()
        }
    }
    
    private let code = """
struct ContentView: View {
    var body: some View {
        DisplayBoardV5 {
            Section("Person1’s\\nFavorites") {
                Text("Song 1")
                    .displayBoardCardRejected(true)
                Text("Song 2")
                Text("Song 3")
            }

            Section("Person2’s\\nFavorites") {
                ForEach(Songs.fromPerson2) { song in
                    Text(song.title)
                        .displayBoardCardRejected(
                            song.person2CalledDibs
                        )
                }
            }

            Section("Person3’s\\nFavorites") {
                ForEach(Songs.fromPerson3) { song in
                    Text(song.title)
                }
            }
            .displayBoardCardRejected(true)
        }
        .ignoresSafeArea()
    }
}
"""
}

#Preview {
    SlidePreview {
        ContainerValuesSlide_1()
    }
}

#Preview {
    SlidePreview {
        ContainerValuesSlide_2()
    }
}

#Preview {
    SlidePreview {
        ContainerValuesSlide_3()
    }
}

#Preview {
    SlidePreview {
        ContainerValuesSlide_SampleCode_1()
    }
}
