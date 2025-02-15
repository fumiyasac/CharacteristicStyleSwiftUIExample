import Components
import SwiftUI
import ViewObject

struct MenuRowView: View {

    // MARK: - Property

    private var menuViewObject: MenuViewObject

    // MARK: - Initializer

    init(menuViewObject: MenuViewObject) {
        self.menuViewObject = menuViewObject
    }

    // MARK: - Body

    var body: some View {
        // Row要素情報
        VStack(alignment: .leading, spacing: 0.0) {
            // 1. データ文言表示
            HStack {
                VStack(alignment: .leading, spacing: 0.0) {
                    // 1-(1).
                    Text(menuViewObject.name)
                        .font(.subheadline)
                        .bold()
                        .foregroundColor(.primary)
                    // 1-(2).
                    Text(menuViewObject.notice)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                        .padding(.top, 4.0)
                    // 1-(3).
                    Text("値段: \(menuViewObject.price) [円]")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                        .padding(.top, 4.0)
                    // 1-(4).
                    if !menuViewObject.unit.isEmpty {
                        Text("(\(menuViewObject.unit))")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                            .padding(.top, 4.0)
                    }
                }
                Spacer()
            }
            .padding(.horizontal, 8.0)
            // 2. 星型レーティング表示
            HStack {
                StarRatingView(rating: menuViewObject.rate)
                    .padding(.bottom, 8.0)
                Text("評価:")
                    .font(.subheadline)
                    .bold()
                    .foregroundColor(.gray)
                    .lineLimit(1)
                    .padding(.bottom, 8.0)
                Text(String(format: "%.1f", menuViewObject.rate))
                    .font(.subheadline)
                    .bold()
                    .foregroundColor(.red)
                    .lineLimit(1)
                    .padding(.bottom, 8.0)
            }
            .padding(.horizontal, 8.0)
            .padding(.vertical, 4.0)
            Spacer()
        }
    }
}
