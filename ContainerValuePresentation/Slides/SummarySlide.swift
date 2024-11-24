//
//  SummarySlide.swift
//  ContainerValuePresentation
//
//  Created by 今末 翔太 on 2024/10/23.
//

import SlideKit
import SwiftUI

@Slide
struct SummarySlide: View {
    var body: some View {
        HeaderSlide("まとめ") {
            Item("ContainerValues は iOS 18 以降で使用できる")
            Item("サブビューの上位コンテナからしかアクセスできないため、コンテナ固有のカスタマイズオプションを実装するのに最適")
            Item("だが、発表されたばかりなのもあり、現状だと実例や関連記事が少なく実用的な使い方は試行錯誤中...")
        }
    }
}

#Preview {
    SlidePreview {
        SummarySlide()
    }
}
