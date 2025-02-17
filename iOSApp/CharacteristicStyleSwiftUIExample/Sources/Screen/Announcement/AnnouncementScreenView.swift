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
                Text("AnnouncementScreen")
                
                AnnouncementRowView(
                    announcementViewObject: AnnouncementViewObject(
                        id: 1,
                        title: "サンプル店舗:No.1から新情報が追加されました！",
                        category: "New Information",
                        summary: "サンプル店舗:No.1からの耳寄りな情報が追加されましたので、是非ご確認下さい🙏。",
                        thumbnailUrl: "https://characteristic-style.s3.ap-northeast-1.amazonaws.com/announcement/announcement_example1.jpg",
                        publishedAt: "2025/02/08",
                        isFavorited: false
                    ),
                    tapStockAnnouncementButtonAction: { _ in }
                )
                
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
