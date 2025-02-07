import Extension
import SwiftUI
import ViewStateProvider
import ViewObject

public struct GalleryScreenView: View {

    // MARK: - ViewStateProvider

    private let viewStateProvider: GalleryViewStateProvider

    // MARK: - Initializer

    public init(viewStateProvider: GalleryViewStateProvider = GalleryViewStateProvider()) {
        self.viewStateProvider = viewStateProvider
    }

    // MARK: - Body

    public var body: some View {
        NavigationStack {
            Group {
                if viewStateProvider.requestStatus == .success {
                    List {
                        Section {
                            ForEach(viewStateProvider.galleryViewObjects, id: \.id) { galleryViewObject in
                                Text(galleryViewObject.title)
                            }
                        } header: {
                            Text("正常処理OK")
                        }
                    }
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
}

#Preview {
    GalleryScreenView()
}
