import Domain
import Foundation
import Infrastructure
import Observation
import ViewObject

@Observable
public final class AnnouncementViewStateProvider {
    
    // MARK: - Property

    private let announcementRepository: AnnouncementRepository

    public var requestStatus: APIRequestState = .none

    // MEMO: 一覧表示に関係するProperty（●●●ViewObjectsの様な命名をしている）
    public var announcementViewObjects: [AnnouncementViewObject] = []

    // MARK: - Initializer

    public init(announcementRepository: AnnouncementRepository = AnnouncementRepositoryImpl()) {
        self.announcementRepository = announcementRepository
    }

    // MARK: - Function

    public func fetchAnnouncements() {
        Task { @MainActor in
            self.requestStatus = .requesting
            do {
                let announcementEntities = try await self.announcementRepository.getAnnouncements()
                self.announcementViewObjects = announcementEntities.map {
                    AnnouncementViewObject(
                        id: $0.id,
                        title: $0.title,
                        category: $0.category,
                        summary: $0.summary,
                        thumbnailUrl: $0.thumbnailUrl,
                        publishedAt: $0.publishedAt
                    )
                }
                self.requestStatus = .success
            } catch let error {
                // MEMO: 本来ならばエラーハンドリング処理等を入れる必要がある
                print("Fetch Announcements Error: " + error.localizedDescription)
                self.requestStatus = .error
            }
        }
    }
}
