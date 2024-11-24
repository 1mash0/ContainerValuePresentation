//
//  EnvironmentValuesSlide.swift
//  ContainerValuePresentation
//
//  Created by 今末 翔太 on 2024/10/23.
//

import SlideKit
import SwiftUI

@Slide
struct EnvironmentValuesHeaderSlide<Content: View>: View {
    @ViewBuilder var content: Content
    
    var body: some View {
        HeaderSlide("EnvironmentValues") {
            content
        }
    }
}

@Slide
struct EnvironmentValuesSlide: View {
    enum SlidePhase: Int, PhasedState {
        case initial, second, third, fourth
    }
    
    @Phase var phase: SlidePhase
    
    var body: some View {
        EnvironmentValuesHeaderSlide {
            Item("ビュー階層を通じて伝搬される環境値のコレクション")
            
            if $phase.after(.second) {
                Item("iOS 13.0+ | iPadOS 13.0+")
            }
            
            if $phase.after(.third) {
                Code(code, fontSize: 36)
                    .padding()
            }
            
            if $phase.after(.fourth) {
                Item("EnvironmentValuesの値はSubViewに伝搬する")
            }
        }
    }
    
    private let code = """
struct ContentView: View {
    @Environment(\\.locale) var locale: Locale

    var body: some View {
        ...
    }
}
"""
}

@Slide
struct EnvironmentValuesSlide_SampleCode: View {
    enum SlidePhase: Int, PhasedState {
        case initial, second, third, fourth
    }
    
    @Phase var phase: SlidePhase
    
    var body: some View {
        HStack {
            EnvironmentValuesHeaderSlide {
                switch $phase.current {
                    case .initial:
                        Code(initialCode, fontSize: 32)
                    case .second:
                        Code(secondCode, fontSize: 32)
                    case .third:
                        Code(thirdCode, fontSize: 24)
                    case .fourth:
                        Code(secondCode, fontSize: 32)
                }
            }
            
            if $phase.current == .fourth {
                Image("EnvironmentValuesPreview")
                    .resizable()
                    .scaledToFit()
            }
        }
    }
    
    private let initialCode = """
extension EnvironmentValues {
    @Entry var myEnvironmentValue: Int = 0
}

extension View {
    func myEnvironmentValue(_ value: Int) -> some View {
        environment(\\.myEnvironmentValue, value)
    }
}
"""
    
    private let secondCode = """
struct ContentView: View {
    // defaultValue is `0`
    @Environment(\\.myEnvironmentValue) var myEnvironmentValue
    
    var body: some View {
        VStack(spacing: 18) {
            Text("親: \\(myEnvironmentValue)")
                .padding()
                .border(.red)
            SubView1()
                .myEnvironmentValue(1)
                .padding()
                .border(.blue)
            SubView2()
                .padding()
                .border(.green)
        }
    }
}
"""
    
    private let thirdCode = """
struct SubView1: View {
    @Environment(\\.myEnvironmentValue) var myEnvironmentValue
    
    var body: some View {
        VStack(spacing: 10) {
            Text("子: \\(myEnvironmentValue)")
            SubSubView1()
        }
    }
}

struct SubSubView1: View {
    @Environment(\\.myEnvironmentValue) var myEnvironmentValue
    
    var body: some View {
        Text("孫: \\(myEnvironmentValue)")
    }
}

struct SubView2: View {
    @Environment(\\.myEnvironmentValue) var myEnvironmentValue
    
    var body: some View {
        Text("子: \\(myEnvironmentValue)")
    }
}
"""
}

@Slide
struct EnvironmentValuesSlide_Image: View {
    var body: some View {
        Image("EnvironmentValuesPreview")
            .resizable()
            .scaledToFit()
    }
}

#Preview {
    SlidePreview {
        EnvironmentValuesSlide()
    }
}

#Preview {
    SlidePreview {
        EnvironmentValuesSlide_SampleCode()
    }
}

#Preview {
    SlidePreview {
        EnvironmentValuesSlide_Image()
    }
}
