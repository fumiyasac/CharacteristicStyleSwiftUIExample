import Extension
import SwiftUI
import ViewStateProvider
import ViewObject

public struct AnnouncementScreenView: View {

    // MARK: - ViewStateProvider

    private let viewStateProvider: AnnouncementViewStateProvider

    // MARK: - Initializer

    public init(viewStateProvider: AnnouncementViewStateProvider = AnnouncementViewStateProvider()) {
        self.viewStateProvider = viewStateProvider
    }

    // MARK: - Body

    public var body: some View {
        NavigationStack {
            Group {
                if viewStateProvider.requestStatus == .success {
                    ScrollView {
                        ForEach(viewStateProvider.announcementViewObjects, id: \.id) { viewObject in
                            AnnouncementRowView(
                                announcementViewObject: viewObject,
                                tapStockAnnouncementButtonAction: { _, _ in })
                        }
                    }
                } else {
                    // TODO: Error発生時のハンドリング処理を実施する
                    Text("AnnouncementScreen")
                }
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
