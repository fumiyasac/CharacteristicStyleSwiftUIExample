import Domain
import Entity
import Foundation
import Infrastructure
import Observation
import ViewObject

@Observable
public final class MenuViewStateProvider {

    // MARK: - Property
    
    private let menuRequestRepository: MenuRequestRepository

    public var requestStatus: APIRequestState = .none

    // MEMO: 一覧表示に関係するProperty（●●●ViewObjectsの様な命名をしている）
    public var groupedMenuViewObjects: [[MenuViewObject]] = []

    // MARK: - Initializer

    public init(menuRequestRepository: MenuRequestRepository = MenuRequestRepositoryImpl()) {
        self.menuRequestRepository = menuRequestRepository
    }

    // MARK: - Function

    public func fetchMenus() {
        Task { @MainActor in
            self.requestStatus = .requesting
            do {
                let menuEntities = try await self.menuRequestRepository.getMenus()
                let menuViewObjects = menuEntities.map {
                    MenuViewObject(
                        id: $0.id,
                        name: $0.name,
                        notice: $0.notice,
                        category: $0.category,
                        price: $0.price,
                        unit: $0.unit,
                        rate: $0.rate
                    )
                }
                for category in MenuEntity.FoodMenuCategeory.allCases {
                    let foodMenus = menuViewObjects.filter { $0.category == category }
                    groupedMenuViewObjects.append(foodMenus)
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
