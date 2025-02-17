import Entity
import Foundation
import Infrastructure

// MARK: - Protocol

public protocol AnnouncementRepository {
    func getAnnouncements() async throws -> [AnnouncementEntity]
}

public final class AnnouncementRepositoryImpl: AnnouncementRepository {

    // MARK: - Property

    private let apiClientManager: ApiClientManager

    // MARK: - Initializer

    public init(apiClientManager: ApiClientManager = ApiClientManager.shared) {
        self.apiClientManager = apiClientManager
    }

    // MARK: - Function

    public func getAnnouncements() async throws -> [AnnouncementEntity] {
        try await apiClientManager.getAnnouncements().result
    }
}
