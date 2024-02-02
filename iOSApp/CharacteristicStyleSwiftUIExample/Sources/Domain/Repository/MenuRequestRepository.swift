import Entity
import Foundation
import Infrastructure

// MARK: - Protocol

public protocol MenuRequestRepository {
    func getMenus() async throws -> [MenuEntity]
}

public final class MenuRequestRepositoryImpl: MenuRequestRepository {
    
    // MARK: - Property

    private let apiClientManager: ApiClientManager

    // MARK: - Initializer

    public init(apiClientManager: ApiClientManager = ApiClientManager.shared) {
        self.apiClientManager = apiClientManager
    }

    // MARK: - Function

    public func getMenus() async throws -> [MenuEntity] {
        try await apiClientManager.getMenus().result
        // TODO: Category毎にSortしてSectionにまとめておく必要がある
    }
}
