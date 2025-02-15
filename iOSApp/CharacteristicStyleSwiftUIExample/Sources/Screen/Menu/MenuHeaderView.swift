//
//  MenuHeaderView.swift
//  CharacteristicStyleSwiftUIExample
//
//  Created by 酒井文也 on 2025/02/15.
//

import NukeUI
import SwiftUI
import ViewObject

struct MenuHeaderView: View {

    // MARK: - Property

    private var menuViewObject: MenuViewObject

    // MARK: - Initializer

    init(menuViewObject: MenuViewObject) {
        self.menuViewObject = menuViewObject
    }

    // MARK: - Body

    var body: some View {
        // Header要素情報
        VStack(alignment: .leading) {
            // 1. タイトル文言表示
            HStack {
                Text(menuViewObject.category.title)
                    .font(.title2)
                    .bold()
                    .foregroundColor(.primary)
                    .lineLimit(1)
                Spacer()
            }
            .padding(.top, 32.0)
            .padding(.horizontal, 8.0)
            // 2. アイキャッチ画像表示
            HStack {
                Spacer()
                LazyImage(url: menuViewObject.category.eyecatchUrl) { imageState in
                    if let cachedImage = imageState.image {
                        cachedImage
                            .resizable()
                            .scaledToFit()
                    }
                }
                Spacer()
            }
            .padding(.horizontal, 8.0)
        }
    }
}

// MARK: - Preview

//#Preview {
//    MenuHeaderView(
//        menuViewObject: MenuViewObject(
//            id: 1,
//            name: "親子丼",
//            notice: "味噌汁・お新香付き",
//            category: .washoku,
//            price: 900,
//            unit: "1人前",
//            rate: 4.37
//        )
//    )
//}
