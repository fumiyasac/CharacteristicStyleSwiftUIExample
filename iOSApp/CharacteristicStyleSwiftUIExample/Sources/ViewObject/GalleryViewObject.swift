import Foundation

public struct GalleryViewObject {

    // MARK: - Property

    public let id: Int
    public let title: String
    public let subtitle: String
    public let thumbnailUrl: URL?
    public let publishedAt: String

    // MARK: - Initializer

    public init(
        id: Int,
        title: String,
        subtitle: String, 
        thumbnailUrl: String,
        publishedAt: String
    ) {
        self.id = id
        self.title = title
        self.subtitle = subtitle
        self.thumbnailUrl = URL(string: thumbnailUrl) ?? nil
        self.publishedAt = publishedAt
    }
}
