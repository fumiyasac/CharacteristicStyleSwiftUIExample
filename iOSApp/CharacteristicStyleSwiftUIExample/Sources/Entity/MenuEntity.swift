import Foundation

public struct MenuEntity: Hashable, Decodable {
    
    // MARK: - Property

    public let id: Int
    public let name: String
    public let catchCopy: String
    public let summary: String
    public let foodCategory: String
    public let price: Int
    public let rate: Double
    public let thumbnailUrl: String
    public let publishedAt: String

    // MARK: - Enum

    private enum Keys: String, CodingKey {
        case id
        case name
        case catchCopy = "category_copy"
        case summary
        case foodCategory = "food_category"
        case price
        case rate
        case thumbnailUrl = "thumbnail_url"
        case publishedAt = "published_at"
    }

    // MARK: - Initializer

    public init(from decoder: Decoder) throws {

        // JSONの配列内の要素を取得する
        let container = try decoder.container(keyedBy: Keys.self)

        // JSONの配列内の要素にある値をDecodeして初期化する
        self.id = try container.decode(Int.self, forKey: .id)
        self.name = try container.decode(String.self, forKey: .name)
        self.catchCopy = try container.decode(String.self, forKey: .catchCopy)
        self.summary = try container.decode(String.self, forKey: .summary)
        self.foodCategory = try container.decode(String.self, forKey: .foodCategory)
        self.price = try container.decode(Int.self, forKey: .price)
        self.rate = try container.decode(Double.self, forKey: .rate)
        self.thumbnailUrl = try container.decode(String.self, forKey: .thumbnailUrl)
        self.publishedAt = try container.decode(String.self, forKey: .publishedAt)
    }

    // MARK: - Hashable

    // MEMO: Hashableプロトコルに適合させるための処理
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }

    public static func == (lhs: MenuEntity, rhs: MenuEntity) -> Bool {
        return lhs.id == rhs.id
    }
}
