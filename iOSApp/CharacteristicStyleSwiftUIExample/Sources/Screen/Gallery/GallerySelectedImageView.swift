//
//  SwiftUIView.swift
//  CharacteristicStyleSwiftUIExample
//
//  Created by 酒井文也 on 2025/02/08.
//

import SwiftUI
import ViewObject

struct GallerySelectedImageView: View {

    @Binding var selectedImage: Image?
    @Binding var selectedViewObject: GalleryViewObject?
    let namespace: Namespace.ID

    public var body: some View {
        VStack {
            if let id = selectedViewObject?.id, let cachedSelectedImage = selectedImage {
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
                Color(.white)
            }
        }
        .padding()
    }
}
