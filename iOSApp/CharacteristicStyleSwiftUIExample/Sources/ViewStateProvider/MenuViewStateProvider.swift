import Domain
import Foundation
import Infrastructure
import Observation
import ViewObject

@Observable
public final class MenuViewStateProvider {

    // MARK: - Property
    
    private let menuRequestRepository: MenuRequestRepository

    private var requestStatus: APIRequestState = .none

    // MEMO: 一覧表示に関係するProperty（●●●ViewObjectsの様な命名をしている）
    private(set) var menuViewObjects: [MenuViewObject] = []

    // MARK: - Initializer

    public init(menuRequestRepository: MenuRequestRepository = MenuRequestRepositoryImpl()) {
        self.menuRequestRepository = menuRequestRepository
    }

    // MARK: - Function

    public func fetchMenus() {
        Task { @MainActor in
            self.requestStatus = .requesting
            do {
                // MEMO: async/awaitベースの処理で必要な値を取得し、その後`private(set)`で定義した値を更新する
                let menuEntities = try await self.menuRequestRepository.getMenus()
                self.menuViewObjects = menuEntities.map {
                    MenuViewObject(
                        id: $0.id,
                        name: $0.name,
                        catchCopy: $0.catchCopy,
                        summary: $0.summary,
                        foodCategory: $0.foodCategory,
                        price: $0.price,
                        rate: $0.rate,
                        thumbnailUrl: $0.thumbnailUrl,
                        publishedAt: $0.publishedAt
                    )
                }
                self.requestStatus = .success
            } catch let error {
                // MEMO: 本来ならばエラーハンドリング処理等を入れる必要がある
                print("Fetch Menus Error: " + error.localizedDescription)
                self.requestStatus = .error
            }
        }
    }
}
