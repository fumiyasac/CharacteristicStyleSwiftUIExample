import Foundation

public struct GalleryEntity: Hashable, Decodable {

    // MARK: - Property

    public let id: Int
    public let title: String
    public let subtitle: String
    public let thumbnailUrl: String
    public let publishedAt: String

    // MARK: - Enum

    private enum Keys: String, CodingKey {
        case id
        case title
        case subtitle
        case thumbnailUrl = "thumbnail_url"
        case publishedAt = "published_at"
    }

    // MARK: - Initializer

    public init(from decoder: Decoder) throws {

        // JSONの配列内の要素を取得する
        let container = try decoder.container(keyedBy: Keys.self)

        // JSONの配列内の要素にある値をDecodeして初期化する
        self.id = try container.decode(Int.self, forKey: .id)
        self.title = try container.decode(String.self, forKey: .title)
        self.subtitle = try container.decode(String.self, forKey: .subtitle)
        self.thumbnailUrl = try container.decode(String.self, forKey: .thumbnailUrl)
        self.publishedAt = try container.decode(String.self, forKey: .publishedAt)
    }

    // MARK: - Hashable

    // MEMO: Hashableプロトコルに適合させるための処理
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }

    public static func == (lhs: GalleryEntity, rhs: GalleryEntity) -> Bool {
        return lhs.id == rhs.id
    }
}
