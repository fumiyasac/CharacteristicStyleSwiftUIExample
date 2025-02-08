//
//  SwiftUIView.swift
//  CharacteristicStyleSwiftUIExample
//
//  Created by 酒井文也 on 2025/02/08.
//

import SwiftUI
import ViewObject

struct GallerySelectedImageView: View {

    // MARK: - Property (Display Animation)

    // 選択された画面切り替え対象のViewObjectと連動する
    @Binding var selectedViewObject: GalleryViewObject?

    // 選択された画面切り替え対象のImage要素と連動する
    @Binding var selectedImage: Image?

    // .matchedGeometryEffectで利用する名前空間
    let namespace: Namespace.ID

    // MARK: - Body

    var body: some View {
        VStack {
            if let id = selectedViewObject?.id, let cachedSelectedImage = selectedImage {

                // 拡大画像が存在する場合は比率を維持した状態で横幅いっぱいに表示する
                cachedSelectedImage
                    .resizable()
                    .scaledToFit()
                    .matchedGeometryEffect(id: "gallery-\(id)", in: namespace)
                    .onTapGesture {
                        withAnimation(.spring(response: 0.36, dampingFraction: 0.48)) {
                            selectedImage = nil
                            selectedViewObject = nil
                        }
                    }

            } else {

                // 拡大画像が存在しない場合は白色背景を表示する
                Color(.white)
            }
        }
        .padding()
    }
}
