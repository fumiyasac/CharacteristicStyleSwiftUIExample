import NukeUI
import SwiftUI
import ViewObject

struct AnnouncementRowView: View {

    // MARK: - Property

    private var announcementViewObject: AnnouncementViewObject

    // MARK: - Initializer

    init(announcementViewObject: AnnouncementViewObject) {
        self.announcementViewObject = announcementViewObject
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
                            .frame(width: 64.0, height: 64.0)
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
            // 2. Summary表示
            HStack(spacing: 0.0) {
                Text(announcementViewObject.summary)
                    .font(.footnote)
                    .foregroundStyle(.secondary)
                    .padding(.vertical, 10.0)
                    .lineLimit(2)
                Spacer()
            }
            // 3. 下側Divider表示
            Divider()
                .background(.gray)
        }
        .padding(.top, 16.0)
        .padding(.horizontal, 16.0)
    }
}
