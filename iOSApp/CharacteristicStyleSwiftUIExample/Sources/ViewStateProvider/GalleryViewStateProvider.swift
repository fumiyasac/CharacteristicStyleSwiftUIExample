import Domain
import Foundation
import Infrastructure
import Observation
import ViewObject

@Observable
public final class GalleryViewStateProvider {
    
    // MARK: - Property
    
    private let galleryRequestRepository: GalleryRequestRepository

    public var requestStatus: APIRequestState = .none

    // MEMO: 一覧表示に関係するProperty（●●●ViewObjectsの様な命名をしている）
    public var galleryViewObjects: [GalleryViewObject] = []

    // MARK: - Initializer

    public init(galleryRequestRepository: GalleryRequestRepository = GalleryRequestRepositoryImpl()) {
        self.galleryRequestRepository = galleryRequestRepository
    }

    // MARK: - Function

    public func fetchGalleries() {
        Task { @MainActor in
            self.requestStatus = .requesting
            do {
                // MEMO: async/awaitベースの処理で必要な値を取得し、その後`private(set)`で定義した値を更新する
                let galleryEntities = try await self.galleryRequestRepository.getGalleries()
                self.galleryViewObjects = galleryEntities.map {
                    GalleryViewObject(
                        id: $0.id,
                        title: $0.title,
                        subtitle: $0.subtitle,
                        thumbnailUrl: $0.thumbnailUrl,
                        publishedAt: $0.publishedAt
                    )
                }
                self.requestStatus = .success
            } catch let error {
                // MEMO: 本来ならばエラーハンドリング処理等を入れる必要がある
                print("Fetch Galleries Error: " + error.localizedDescription)
                self.requestStatus = .error
            }
        }
    }
}
