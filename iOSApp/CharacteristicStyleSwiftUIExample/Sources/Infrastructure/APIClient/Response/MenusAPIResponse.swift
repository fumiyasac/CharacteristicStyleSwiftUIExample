import Entity
import Foundation

struct MenusAPIResponse: Decodable, Equatable {

    let result: [MenuEntity]

    // MARK: - Enum

    private enum Keys: String, CodingKey {
        case result
    }

    // MARK: - Initializer

    init(result: [MenuEntity]) {
        self.result = result
    }

    // JSONの配列内の要素を取得する → JSONの配列内の要素にある値をDecodeして初期化する
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: Keys.self)
        self.result = try container.decode([MenuEntity].self, forKey: .result)
    }

    // MARK: - Equatable

    // MEMO: Equatableプロトコルに適合させるための処理

    static func == (lhs: MenusAPIResponse, rhs: MenusAPIResponse) -> Bool {
        return lhs.result == rhs.result
    }
}
