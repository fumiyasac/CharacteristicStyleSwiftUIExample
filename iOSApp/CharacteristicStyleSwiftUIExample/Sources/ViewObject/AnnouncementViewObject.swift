import Foundation

public struct AnnouncementViewObject {

    // MARK: - Property

    let id: Int
    let title: String
    let subtitle: String
    let thumbnailUrl: URL?
    let publishedAt: String
    let isFavorited: Bool

    // MARK: - Initializer

    init(
        id: Int,
        title: String,
        subtitle: String, 
        thumbnailUrl: String,
        publishedAt: String,
        isFavorited: Bool
    ) {
        self.id = id
        self.title = title
        self.subtitle = subtitle
        self.thumbnailUrl = URL(string: thumbnailUrl) ?? nil
        self.publishedAt = publishedAt
        self.isFavorited = isFavorited
    }
}
