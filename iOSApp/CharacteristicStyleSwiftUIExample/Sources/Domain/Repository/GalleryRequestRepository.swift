import Entity
import Foundation
import Infrastructure

// MARK: - Protocol

public protocol GalleryRequestRepository {
    func getGalleries() async throws -> [GalleryEntity]
}

public final class GalleryRequestRepositoryImpl: GalleryRequestRepository {

    // MARK: - Property

    private let apiClientManager: ApiClientManager

    // MARK: - Initializer

    public init(apiClientManager: ApiClientManager = ApiClientManager.shared) {
        self.apiClientManager = apiClientManager
    }

    // MARK: - Function

    public func getGalleries() async throws -> [GalleryEntity] {
        try await apiClientManager.getGalleries().result
    }
}
