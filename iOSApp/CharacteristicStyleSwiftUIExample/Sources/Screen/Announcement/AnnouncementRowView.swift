import NukeUI
import SwiftUI
import ViewObject

struct AnnouncementRowView: View {

    // MARK: - Typealias

    typealias TapStockAnnouncementButtonAction = (Bool) -> Void

    // MARK: - Property

    private var announcementViewObject: AnnouncementViewObject

    private var tapStockAnnouncementButtonAction: AnnouncementRowView.TapStockAnnouncementButtonAction

    // Favoriteボタン（ハート型ボタン要素）の状態を管理するための変数
    @State private var isStocked: Bool = false

    // MARK: - Initializer

    init(
        announcementViewObject: AnnouncementViewObject,
        tapStockAnnouncementButtonAction: @escaping AnnouncementRowView.TapStockAnnouncementButtonAction
    ) {
        self.announcementViewObject = announcementViewObject
        self.tapStockAnnouncementButtonAction = tapStockAnnouncementButtonAction
    }

    // MARK: - Body

    var body: some View {
        VStack(alignment: .leading, spacing: 0.0) {
            Text("AnnouncementRowView")
        }
        .padding(8.0)
    }
}
