import Foundation

public struct MenuViewObject {
    
    // MARK: - Property

    public let id: Int
    public let name: String
    public let catchCopy: String
    public let summary: String
    public let foodCategory: String
    public let price: Int
    public let rate: Double
    public let thumbnailUrl: URL?
    public let publishedAt: String

    // MARK: - Initializer

    public init(
        id: Int,
        name: String,
        catchCopy: String,
        summary: String,
        foodCategory: String,
        price: Int,
        rate: Double,
        thumbnailUrl: String,
        publishedAt: String
    ) {
        self.id = id
        self.name = name
        self.catchCopy = catchCopy
        self.summary = summary
        self.foodCategory = foodCategory
        self.price = price
        self.rate = rate
        self.thumbnailUrl = URL(string: thumbnailUrl) ?? nil
        self.publishedAt = publishedAt
    }
}
