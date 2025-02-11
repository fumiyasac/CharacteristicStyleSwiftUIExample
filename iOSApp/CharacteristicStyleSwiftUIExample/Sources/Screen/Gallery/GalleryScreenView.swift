import Extension
import SwiftUI
import ViewStateProvider
import ViewObject
import NukeUI

public struct GalleryScreenView: View {

    // MARK: - ViewStateProvider

    private let viewStateProvider: GalleryViewStateProvider

    // MARK: - Property (Grid Layout)

    private let gridColumns = Array(repeating: GridItem(.flexible()), count: 2)

    // MARK: - Property (Display Animation)

    // 選択された画面切り替え対象のViewObjectを格納する
    @State private var selectedViewObject: GalleryViewObject?

    // 選択された画面切り替え対象のImage要素を格納する
    // 👉 Image自体を渡して連続的なAnimationにする
    @State private var selectedImage: Image?

    // .matchedGeometryEffectで利用する名前空間
    @Namespace private var namespace

    // MARK: - Initializer

    public init(viewStateProvider: GalleryViewStateProvider = GalleryViewStateProvider()) {
        self.viewStateProvider = viewStateProvider
    }

    // MARK: - Body
    
    public var body: some View {
        NavigationStack {
            Group {
                if viewStateProvider.requestStatus == .success {
                    TwoGridColumnScrollView()
                } else {
                    // TODO: Error発生時のハンドリング処理を実施する
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
    private func TwoGridColumnScrollView() -> some View {
        VStack(alignment: .leading) {
            ScrollView {
                LazyVGrid(columns: gridColumns) {
                    ForEach(viewStateProvider.galleryViewObjects, id: \.id) { galleryViewObject in
                        LazyImage(url: galleryViewObject.thumbnailUrl) { imageState in
                            if let cachedImage = imageState.image {

                                // サムネイル画像が存在する場合はGrid表示をする
                                VStack (alignment: .leading) {
                                    cachedImage
                                        .resizable()
                                        .scaledToFit()
                                        // 拡大表示先のViewに配置した要素Imageと同様に一意なID文字列と名前空間を定める
                                        // 👉 第3引数の「isSource」は何が正解かイマイチ理解していない...
                                        .matchedGeometryEffect(id: "gallery-\(galleryViewObject.id)", in: namespace, isSource: selectedImage == nil)
                                        .onTapGesture {
                                            // 選択された画面切り替え対象のViewObjectとImage要素を変数に格納してAnimationを実行する
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

                                // サムネイル画像が存在しない場合は白色背景を表示する
                                Color(.white)
                            }
                        }
                    }
                }
                .padding(12.0)
            }
            // 拡大画像表示が選択されている時はGrid表示のアルファ値を0にして操作ができない様にする
            .opacity(selectedImage == nil ? 1 : 0)
        }
        .overlay {
            // .overlayを利用して拡大画像表示を上に重ねる
            if selectedViewObject != nil {
                GallerySelectedImageView(
                    selectedViewObject: $selectedViewObject,
                    selectedImage: $selectedImage,
                    namespace: namespace
                )
            }
        }
    }
}
