import Entity
import Extension
import SwiftUI
import ViewStateProvider
import ViewObject

public struct MenuScreenView: View {

    // MARK: - ViewStateProvider

    private let viewStateProvider: MenuViewStateProvider

    // MARK: - Property (`@State`)

    // 現在選択されているTab要素としての変数
    @State private var activeTab: MenuEntity.FoodMenuCategeory = .washoku

    // Animation実行時の変化量を格納するための変数
    @State private var animationProgress: CGFloat = 0

    // スクロール可能なNavigationBarにくっ付くタブ要素のScroll変化量を格納するための変数
    @State private var scrollableTabOffset: CGFloat = 0

    // スクロール変化完了時のScroll変化量を格納するための変数(※この値は更新される)
    @State private var initialOffset: CGFloat = 0

    // MARK: - Property (Constants)

    // 文字列を基準としてGeometryReaderから座標値を取得するにあたり、基準となる特定の文字列
    private let coordinateSpaceContentView = "CONTENTVIEW"

    // タブ要素内に配置した下線をタップ時に動かす際に必要な、.matchedGeometryEffectに付与する一意なID文字列
    private let matchedGeometryEffectUniqueId = "ACTIVETAB"

    // MARK: - Property (`@Namespace`)

    // タブ要素をScrollに追従して動かす際に利用するNamespace Property Wrapper
    @Namespace private var animation

    // MARK: - Initializer

    public init(viewStateProvider: MenuViewStateProvider = MenuViewStateProvider()) {
        self.viewStateProvider = viewStateProvider
    }

    // MARK: - Body

    public var body: some View {
        NavigationStack {
            ScrollViewReader { proxy in
                MenuGroupedSectionScrollView(proxy: proxy)
            }
            // 独自定義したModifier「.getRectangleViewToCoordinateSpace」に定めるための基準を設定する（※今回は特定の文字列を定める）
            .coordinateSpace(name: coordinateSpaceContentView)
            .navigationBarTitle("Food Menu")
            .navigationBarTitleDisplayMode(.inline)
            .background {
                Rectangle()
                    .fill(.white)
                    .ignoresSafeArea()
            }
            .onFirstAppear {
                viewStateProvider.fetchMenus()
            }
            .navigationTitle("🍙メニュー画面")
            .navigationBarTitleDisplayMode(.inline)
        }
    }

    // MARK: - Private Function

    @ViewBuilder
    func MenuGroupedSectionScrollView(proxy: ScrollViewProxy) -> some View {
        ScrollView(.vertical, showsIndicators: false) {
            LazyVStack(spacing: 0.0, pinnedViews: [.sectionHeaders]) {
                Section {
                    // Section要素一覧データを表示する
                    ForEach(viewStateProvider.groupedMenuViewObjects, id: \.self) { menuViewObjects in
                        MenuSectionView(menuViewObjects: menuViewObjects)
                    }
                } header: {
                    // SectionHeader部分に対してスクロール可能なタブ要素を設置する
                    MenuCategoryScrollTab(proxy)
                }
            }
            // coordinateSpaceに定義した名前空間を基準としたオフセット値を反映する処理
            .getRectangleViewToCoordinateSpace(coordinateSpaceContentView) { rect in
                scrollableTabOffset = rect.minY - initialOffset
            }
        }
        .background(
            Rectangle()
                .fill(.white)
        )
    }
    
    
    @ViewBuilder
    func MenuSectionView(menuViewObjects: [MenuViewObject]) -> some View {
        VStack(alignment: .leading, spacing: 10.0) {
            // Section要素に対応するカテゴリー名を表示する
            if let menuViewObject = menuViewObjects.first {
                MenuHeaderView(menuViewObject: menuViewObject)
            }
            // Section要素に紐づいているメニューデータ一覧を表示する
            ForEach(menuViewObjects, id: \.self) { menuViewObject in
                MenuRowView(menuViewObject: menuViewObject)
            }
        }
        .padding(10.0)
        // Section要素にID値（CategoryのEnum文字列）を設定し、ScrollViewReaderの基準とする
        .id(menuViewObjects.categoryIdentifier)
        // coordinateSpaceに定義した名前空間を基準としたオフセット値を反映する処理
        .getRectangleViewToCoordinateSpace(coordinateSpaceContentView) { rect in
            let minY = rect.minY
            // コンテンツ要素がSectionのトップ位置に到達した際に、現在のタブ位置を更新するための条件
            let shouldUpdateCurrentTab = (minY < 30.0 && -minY < (rect.midY / 2.0) && activeTab != menuViewObjects.categoryIdentifier)
            if shouldUpdateCurrentTab && animationProgress == 0 {
                // 条件に合致する場合には、Animationを伴って現在のタブ位置を更新する（スクロール処理の最中に実施される）
                withAnimation(.easeInOut(duration: 0.3)) {
                    activeTab = shouldUpdateCurrentTab ? menuViewObjects.categoryIdentifier : activeTab
                }
            }
        }
    }
    
    @ViewBuilder
    func MenuCategoryScrollTab(_ proxy: ScrollViewProxy) -> some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 12.0) {
                // カテゴリー一覧表示を元にして、Tab要素を配置する
                ForEach(MenuEntity.FoodMenuCategeory.allCases, id: \.rawValue) { category in
                    MenuCategoryTabText(category: category, proxy: proxy)
                }
            }
            .padding(.vertical, 12.0)
            // 変数: activeTabに変更が生じた場合は、Tab要素のAnimation処理を実行する
            // 👉 ProductSectionView内の処理と対応する
            .onChange(of: activeTab) {
                withAnimation(.easeInOut(duration: 0.3)) {
                    // 合致するTab要素に対応するSectionまで0.3秒のAnimationを伴って移動する
                    proxy.scrollTo(activeTab.tabID, anchor: .center)
                }
            }
            // Animation処理が完了次第、変数: animationProgressをリセットする
            .checkAnimationCompleted(for: animationProgress) {
                animationProgress = 0.0
            }
        }
        .background(.white)
    }

    @ViewBuilder
    func MenuCategoryTabText(
        category: MenuEntity.FoodMenuCategeory,
        proxy: ScrollViewProxy
    ) -> some View {
        Text(category.title)
            .fontWeight(.regular)
            .font(.caption)
            .foregroundColor(Color(uiColor: UIColor(code: "#f3b664")))
            // 現在選択中のTab要素の場合は、下線を表示させる形にする
            .background(alignment: .bottom, content: {
                if activeTab == category {
                    Capsule()
                        .fill(Color(uiColor: UIColor(code: "#f3b664")))
                        .frame(height: 3.0)
                        .padding(.horizontal, -3.0)
                        .offset(y: 12.0)
                        // 現在選択中以外のTab要素を押下時に、該当位置まで移動する処理のために、.matchedGeometryEffectを利用している
                        .matchedGeometryEffect(id: matchedGeometryEffectUniqueId, in: animation)
                }
            })
            .padding(.horizontal, 12.0)
            .contentShape(Rectangle())
            // タップ時に下線表示の位置を持ってくるために、Tab要素にIDを付与する
            .id(category.tabID)
            .onTapGesture {
                withAnimation(.easeInOut(duration: 0.3)) {
                    activeTab = category
                    animationProgress = 1.0
                    // 現在選択中以外のTab要素タップ時は、該当するTab要素までスクロール移動をする
                    proxy.scrollTo(category, anchor: .topLeading)
                }
            }
    }
}

// MARK: - Preview

#Preview {
    MenuScreenView()
}

// MARK: - Fileprivate Function

fileprivate extension [MenuViewObject] {

    // MEMO: APIからの取得データは[[MenuViewObject]]型となるため、最初のデータから取得できるCategory値を利用する

    // MARK: - Computed Property

    var categoryIdentifier: MenuEntity.FoodMenuCategeory {
        if let firstProduct = self.first {
            return firstProduct.category
        }
        return .washoku
    }
}
