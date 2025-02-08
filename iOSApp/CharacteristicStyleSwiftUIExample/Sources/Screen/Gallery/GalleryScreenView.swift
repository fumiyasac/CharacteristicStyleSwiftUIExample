import Extension
import SwiftUI
import ViewStateProvider
import ViewObject
import Nuke
import NukeUI

public struct GalleryScreenView: View {

    // MARK: - ViewStateProvider

    private let viewStateProvider: GalleryViewStateProvider

    @State private var selectedViewObject: GalleryViewObject?
    @State private var selectedImage: Image?

    @Namespace private var namespace

    let columns = Array(repeating: GridItem(.flexible()), count: 2)

    // MARK: - Initializer

    public init(viewStateProvider: GalleryViewStateProvider = GalleryViewStateProvider()) {
        self.viewStateProvider = viewStateProvider
    }

    // MARK: - Body

    
    public var body: some View {
        NavigationStack {
            Group {
                if viewStateProvider.requestStatus == .success {
                    getScrollView()
                } else {
                    
                    Text("GalleryScreen")
                }
             }
            .onFirstAppear {
                viewStateProvider.fetchGalleries()
            }
            .navigationTitle("🎨ギャラリー画面")
            .navigationBarTitleDisplayMode(.inline)
        }
    }

    @ViewBuilder
    private func getScrollView() -> some View {
        VStack(alignment: .leading) {
            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach(viewStateProvider.galleryViewObjects, id: \.id) { galleryViewObject in
                        LazyImage(url: galleryViewObject.thumbnailUrl) { imageState in
                            if let cachedImage = imageState.image {
                                VStack (alignment: .leading) {
                                    cachedImage
                                        .resizable()
                                        .scaledToFit()
                                        .matchedGeometryEffect(id: "gallery-\(galleryViewObject.id)", in: namespace, isSource: selectedImage == nil)
                                        .onTapGesture {
                                            withAnimation(.spring(response: 0.36, dampingFraction: 0.48)) {
                                                selectedImage = cachedImage
                                                selectedViewObject = galleryViewObject
                                            }
                                        }
                                    Text(galleryViewObject.title)
                                        .font(.subheadline)
                                        .bold()
                                        .foregroundStyle(.primary)
                                        .padding(.vertical, 4.0)
                                    Text(galleryViewObject.subtitle)
                                        .font(.footnote)
                                        .foregroundStyle(.secondary)
                                        .padding(.bottom, 4.0)
                                    Text("[公開日]:" + galleryViewObject.publishedAt)
                                        .font(.caption)
                                        .foregroundStyle(.secondary)
                                        .padding(.bottom, 8.0)
                                }
                            } else {
                                Color(.white)
                            }
                        }
                    }
                }
                .padding(12.0)
            }
            .opacity(selectedImage == nil ? 1 : 0)
        }
        .overlay {
            if selectedViewObject != nil {
                GallerySelectedImageView(
                    selectedImage: $selectedImage,
                    selectedViewObject: $selectedViewObject,
                    namespace: namespace
                )
            }
        }
    }
}
