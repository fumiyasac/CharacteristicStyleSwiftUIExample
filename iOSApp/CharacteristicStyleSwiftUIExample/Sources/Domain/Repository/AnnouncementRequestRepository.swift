import Entity
import Foundation
import Infrastructure

public protocol AnnouncementRequestRepository {
    func getAnnouncementsBy(page: Int) async throws -> [AnnouncementEntity]
}

public final class AnnouncementRequestRepositoryImpl: AnnouncementRequestRepository {
    
    private let apiClientManager: ApiClientManager

    public init(apiClientManager: ApiClientManager = ApiClientManager.shared) {
        self.apiClientManager = apiClientManager
    }

    public func getAnnouncementsBy(page: Int) async throws -> [AnnouncementEntity] {
        try await apiClientManager.getAnnouncementsBy(page: page).result
    }
}
