import Entity
import Foundation
import Infrastructure

// MARK: - Protocol

public protocol AnnouncementRequestRepository {
    func getAnnouncementsBy(page: Int) async throws -> [AnnouncementEntity]
}

public final class AnnouncementRequestRepositoryImpl: AnnouncementRequestRepository {

    // MARK: - Property

    private let apiClientManager: ApiClientManager

    // MARK: - Initializer

    public init(apiClientManager: ApiClientManager = ApiClientManager.shared) {
        self.apiClientManager = apiClientManager
    }

    // MARK: - Function

    public func getAnnouncementsBy(page: Int) async throws -> [AnnouncementEntity] {
        try await apiClientManager.getAnnouncementsBy(page: page).result
    }
}
