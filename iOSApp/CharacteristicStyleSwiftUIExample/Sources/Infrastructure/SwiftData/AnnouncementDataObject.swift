import Foundation
import SwiftData

@Model
final class AnnouncementDataObject {

    // MARK: - Property

    private(set) var id: Int
    private(set) var title: String
    private(set) var category: String
    private(set) var summary: String
    private(set) var thumbnailUrl: String
    private(set) var timestamp: Date

    // MARK: - Initializer

    init(
        id: Int,
        title: String,
        category: String,
        summary: String,
        thumbnailUrl: String,
        timestamp: Date = Date()
    ) {
        self.id = id
        self.title = title
        self.category = category
        self.summary = summary
        self.thumbnailUrl = thumbnailUrl
        self.timestamp = timestamp
    }
}
