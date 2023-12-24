import Foundation

public struct MenuViewObject {
    
    // MARK: - Property
    
    let id: Int
    let name: String
    let catchCopy: String
    let summary: String
    let foodCategory: String
    let price: Int
    let rate: Double
    let thumbnailUrl: URL?
    let publishedAt: String

    // MARK: - Initializer

    init(
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
