import Entity
import Foundation

public struct GalleriesAPIResponse: Decodable, Equatable {

    public let result: [GalleryEntity]

    // MARK: - Enum

    private enum Keys: String, CodingKey {
        case result
    }

    // MARK: - Initializer

    public init(result: [GalleryEntity]) {
        self.result = result
    }

    // JSONの配列内の要素を取得する → JSONの配列内の要素にある値をDecodeして初期化する
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: Keys.self)
        self.result = try container.decode([GalleryEntity].self, forKey: .result)
    }

    // MARK: - Equatable

    // MEMO: Equatableプロトコルに適合させるための処理

    public static func == (lhs: GalleriesAPIResponse, rhs: GalleriesAPIResponse) -> Bool {
        return lhs.result == rhs.result
    }
}
