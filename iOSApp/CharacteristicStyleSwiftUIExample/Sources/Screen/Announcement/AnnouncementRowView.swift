import NukeUI
import SwiftUI
import ViewObject

struct AnnouncementRowView: View {

    // MARK: - Typealias

    typealias TapStockAnnouncementButtonAction = (Bool, AnnouncementViewObject) -> Void

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
            // 1. サムネイル画像＆基本情報表示
            HStack(spacing: 0.0) {
                LazyImage(url: announcementViewObject.thumbnailUrl) { imageState in
                    if let cachedImage = imageState.image {
                        // サムネイル画像が存在する場合は正方形表示をする
                        cachedImage
                            .resizable()
                            .scaledToFit()
                            .frame(width: 64.0, height: 64.0)
                            .background(
                                RoundedRectangle(cornerRadius: 4.0)
                                    .stroke(.gray)
                            )

                    } else {
                        // サムネイル画像が存在しない場合は白色背景を表示する
                        Color(.white)
                            .background(
                                RoundedRectangle(cornerRadius: 4.0)
                                    .stroke(.gray)
                            )
                    }
                }
                VStack(alignment: .leading) {
                    Text(announcementViewObject.title)
                        .font(.footnote)
                        .bold()
                        .foregroundStyle(.primary)
                        .padding(.bottom, 2.0)
                    Text("公開日:" + announcementViewObject.publishedAt)
                        .font(.caption)
                        .foregroundStyle(.secondary)
                        .padding(.bottom, 2.0)
                    Text("カテゴリー:" + announcementViewObject.category)
                        .font(.caption)
                        .foregroundStyle(.secondary)
                }
                .padding(.leading, 12.0)

            }
            // 2. Summary表示＆ハート型お気に入り表示
            HStack(spacing: 0.0) {
                Text(announcementViewObject.summary)
                    .font(.footnote)
                    .foregroundStyle(.secondary)
                    .padding(.vertical, 10.0)
                Spacer()
                Button(action: {
                    isStocked = !announcementViewObject.isFavorited
                    tapStockAnnouncementButtonAction(isStocked, announcementViewObject)
                }, label: {
                    if announcementViewObject.isFavorited {
                        Image(systemName: "heart.fill")
                    } else {
                        Image(systemName: "heart")
                    }
                })
            }
            // 3. 下側Divider表示
            Divider()
                .background(.gray)
        }
        .padding(16.0)
    }
}

/*
#Preview {
    AnnouncementRowView(
        announcementViewObject: AnnouncementViewObject(
            id: 1,
            title: "サンプル店舗:No.1から新情報が追加されました！",
            category: "New Information",
            summary: "サンプル店舗:No.1からの耳寄りな情報が追加されましたので、是非ご確認下さい🙏。",
            thumbnailUrl: "https://characteristic-style.s3.ap-northeast-1.amazonaws.com/announcement/announcement_example1.jpg",
            publishedAt: "2025/02/08",
            isFavorited: true
        ),
        tapStockAnnouncementButtonAction: { _ in }
    )
}
*/
