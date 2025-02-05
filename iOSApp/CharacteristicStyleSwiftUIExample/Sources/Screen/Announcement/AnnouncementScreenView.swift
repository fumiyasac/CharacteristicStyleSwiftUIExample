import Extension
import SwiftUI
import ViewStateProvider
import ViewObject

// TODO: Pagination込みの表現をするView要素

public struct AnnouncementScreenView: View {

    // MARK: - ViewStateProvider

    @State private var viewStateProvider: AnnouncementViewStateProvider

    // MARK: - Initializer

    public init(viewStateProvider: AnnouncementViewStateProvider = AnnouncementViewStateProvider()) {
        self.viewStateProvider = viewStateProvider
    }

    // MARK: - Body

    public var body: some View {
        NavigationStack {
            Group {
                Text("AnnouncementScreen")
            }
            .onFirstAppear {
                viewStateProvider.fetchAnnouncements()
            }
            .navigationTitle("🚩お知らせ画面")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

// MARK: - Preview

#Preview {
    AnnouncementScreenView()
}
