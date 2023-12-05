import Foundation

public struct MenuEntity {
    
    // MARK: - Property

    let id: Int
    let name: String
    let catchCopy: String
    let summary: String
    let foodCategory: String
    let price: Int
    let rate: Double
    let thumbnailUrl: String
    let publishedAt: String

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
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }

    static func == (lhs: MenuEntity, rhs: MenuEntity) -> Bool {
        return lhs.id == rhs.id
    }
}
