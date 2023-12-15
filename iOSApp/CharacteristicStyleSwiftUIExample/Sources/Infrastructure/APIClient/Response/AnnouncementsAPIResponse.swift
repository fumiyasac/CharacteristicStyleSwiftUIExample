import Entity
import Foundation

struct AnnouncementsAPIResponse: Decodable, Equatable {

    let result: Array<AnnouncementEntity>

    // MARK: - Enum

    private enum Keys: String, CodingKey {
        case result
    }

    // MARK: - Initializer

    init(result: Array<AnnouncementEntity>) {
        self.result = result
    }

    // JSONの配列内の要素を取得する → JSONの配列内の要素にある値をDecodeして初期化する
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: Keys.self)
        self.result = try container.decode(Array<AnnouncementEntity>.self, forKey: .result)
    }

    // MARK: - Equatable

    // MEMO: Equatableプロトコルに適合させるための処理

    static func == (lhs: AnnouncementsAPIResponse, rhs: AnnouncementsAPIResponse) -> Bool {
        return lhs.result == rhs.result
    }
}
