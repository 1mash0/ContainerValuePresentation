//
//  ValueFlowSlide.swift
//  ContainerValuePresentation
//
//  Created by 今末 翔太 on 2024/10/23.
//

import SlideKit
import SwiftUI

@Slide
struct ValueFlowSlide: View {
    enum SlidePhase: Int, PhasedState {
        case initial, second, third
    }
    
    @Phase var phase: SlidePhase
    
    var body: some View {
        switch $phase.current {
            case .initial:
                EnvironmentValuesHeaderSlide {
                    ZStack(alignment: .center) {
                        Image("EnvironmentValuesFlow")
                            .resizable()
                            .scaledToFit()
                    }
                    .frame(maxWidth: .infinity)
                }
            case .second:
                HeaderSlide("Preferences") {
                    ZStack(alignment: .center) {
                        Image("PreferenceFlow")
                            .resizable()
                            .scaledToFit()
                    }
                    .frame(maxWidth: .infinity)
                }
            case .third:
                ContainerValuesHeaderSlide {
                    ZStack(alignment: .center) {
                        Image("ContainerValuesFlow")
                            .resizable()
                            .scaledToFit()
                    }
                    .frame(maxWidth: .infinity)
                }
        }
    }
    
    var script: String {
        switch $phase.current {
            case .initial:
                "EnvironmentValues はビュー階層全体で上から下に渡される"
            case .second:
                "Preference は含まれてるビューの階層全体で下から上に渡される"
            case .third:
                "ContainerValues はサブビューの上位のコンテナからしかアクセスできないようになっている。\nそのためコンテナ固有のカスタムオプションを実装するのに最適"
        }
    }
}

#Preview {
    SlidePreview {
        ValueFlowSlide()
    }
}
