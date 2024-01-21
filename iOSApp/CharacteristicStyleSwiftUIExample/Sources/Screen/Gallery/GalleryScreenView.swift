import Extension
import SwiftUI
import ViewStateProvider
import ViewObject

public struct GalleryScreenView: View {

    // MARK: - ViewStateProvider

    @State private var viewStateProvider: GalleryViewStateProvider

    // MARK: - Initializer

    public init(viewStateProvider: GalleryViewStateProvider = GalleryViewStateProvider()) {
        self.viewStateProvider = viewStateProvider
    }

    // MARK: - Body

    public var body: some View {
        Group {
            Text("GalleryScreen")
        }
        .onFirstAppear {
            viewStateProvider.fetchGalleries()
        }
    }
}

#Preview {
    GalleryScreenView()
}
