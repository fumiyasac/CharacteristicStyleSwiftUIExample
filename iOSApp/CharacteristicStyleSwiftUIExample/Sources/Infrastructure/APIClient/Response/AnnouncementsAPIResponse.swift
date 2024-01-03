import Entity
import Foundation

public struct AnnouncementsAPIResponse: Decodable, Equatable {

    public let result: [AnnouncementEntity]

    // MARK: - Enum

    private enum Keys: String, CodingKey {
        case result
    }

    // MARK: - Initializer

    public init(result: [AnnouncementEntity]) {
        self.result = result
    }

    // JSONの配列内の要素を取得する → JSONの配列内の要素にある値をDecodeして初期化する
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: Keys.self)
        self.result = try container.decode([AnnouncementEntity].self, forKey: .result)
    }

    // MARK: - Equatable

    // MEMO: Equatableプロトコルに適合させるための処理

    public static func == (lhs: AnnouncementsAPIResponse, rhs: AnnouncementsAPIResponse) -> Bool {
        return lhs.result == rhs.result
    }
}
