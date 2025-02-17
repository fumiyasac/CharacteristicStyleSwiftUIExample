import Foundation

public struct AnnouncementViewObject {

    // MARK: - Property

    public let id: Int
    public let title: String
    public let category: String
    public let summary: String
    public let thumbnailUrl: URL?
    public let publishedAt: String

    // MARK: - Initializer

    public init(
        id: Int,
        title: String,
        category: String,
        summary: String,
        thumbnailUrl: String,
        publishedAt: String
    ) {
        self.id = id
        self.title = title
        self.category = category
        self.summary = summary
        self.thumbnailUrl = URL(string: thumbnailUrl) ?? nil
        self.publishedAt = publishedAt
    }
}
