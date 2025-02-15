import SwiftUI
import ViewObject

struct GallerySelectedImageView: View {

    // MARK: - Property (Display Animation)

    // 選択された画面切り替え対象のViewObjectと連動する
    @Binding var selectedViewObject: GalleryViewObject?

    // 選択された画面切り替え対象のImage要素と連動する
    @Binding var selectedImage: Image?

    // .matchedGeometryEffectで利用する名前空間
    let namespace: Namespace.ID

    // MARK: - Property (DragGesture Translation)

    // DragGestureでの変化量を格納する
    @State private var position = CGSize.zero

    // MARK: - Body

    var body: some View {
        VStack {
            if let id = selectedViewObject?.id, let cachedSelectedImage = selectedImage {

                // 拡大画像が存在する場合は比率を維持した状態で横幅いっぱいに表示する
                cachedSelectedImage
                    .resizable()
                    .scaledToFit()
                    .matchedGeometryEffect(id: "gallery-\(id)", in: namespace, isSource: selectedImage != nil)
                    .onTapGesture {
                        withAnimation(.spring(response: 0.36, dampingFraction: 0.48)) {
                            selectedImage = nil
                            selectedViewObject = nil
                        }
                    }
                    // DragGestureでの変化量と要素が追従する様にoffset値を更新する
                    .offset(position)
                    // DragGestureを実行し、①移動中は変化量を変数に格納する、②終了時は高さの閾値を見て超過する場合は表示を元に戻す、の2つを実行する
                    .gesture(
                        DragGesture()
                            .onChanged { value in
                                position = value.translation
                            }
                            .onEnded { _ in
                                withAnimation(.spring(response: 0.36, dampingFraction: 0.48)) {
                                    if 200.0 < abs(position.height) {
                                        selectedImage = nil
                                        selectedViewObject = nil
                                    } else {
                                        position = .zero
                                    }
                                }
                            }
                    )

            } else {

                // 拡大画像が存在しない場合は白色背景を表示する
                Color(.white)
            }
        }
        .padding()
    }
}
