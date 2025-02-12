import Foundation

public struct MenuEntity: Hashable, Decodable {
    
    // MARK: - Property

    public let id: Int
    public let name: String
    public let notice: String
    public let category: MenuEntity.FoodMenuCategeory
    public let price: Int
    public let unit: String
    public let rate: Double

    // MARK: - Enum (Menu Category)

    public enum FoodMenuCategeory: String, CaseIterable {

        case washoku
        case yoshoku
        case chinese
        case otsumami
        case wagashi

        public var title: String {
            switch self {
            case .washoku: return "🍲和食・丼物・寿司"
            case .yoshoku: return "🍳洋食・揚げ物・グリル"
            case .chinese: return "🥟中華料理・点心"
            case .otsumami: return "🫛おつまみ・一品料理"
            case .wagashi: return "🧇和菓子・デザート"
            }
        }

        public var eyecatchUrl: String {
            switch self {
            case .washoku: return "https://characteristic-style.s3.ap-northeast-1.amazonaws.com/menu/menu_washoku.png"
            case .yoshoku: return "https://characteristic-style.s3.ap-northeast-1.amazonaws.com/menu/menu_yoshioku.png"
            case .chinese: return "https://characteristic-style.s3.ap-northeast-1.amazonaws.com/menu/menu_chinese.png"
            case .otsumami: return "https://characteristic-style.s3.ap-northeast-1.amazonaws.com/menu/menu_otsumami.png"
            case .wagashi: return "https://characteristic-style.s3.ap-northeast-1.amazonaws.com/menu/menu_wagashi.png"
            }
        }

        // Viewに配置したTab要素を識別するための文字列
        public var tabID: String {
            return self.rawValue
        }
    }
    
    // MARK: - Enum (Decoder)

    private enum Keys: String, CodingKey {
        case id
        case name
        case notice
        case category
        case price
        case unit
        case rate
    }

    // MARK: - Initializer

    public init(from decoder: Decoder) throws {

        // JSONの配列内の要素を取得する
        let container = try decoder.container(keyedBy: Keys.self)

        // JSONの配列内の要素にある値をDecodeして初期化する
        self.id = try container.decode(Int.self, forKey: .id)
        self.name = try container.decode(String.self, forKey: .name)
        self.notice = try container.decode(String.self, forKey: .notice)
        self.category = MenuEntity.FoodMenuCategeory(rawValue: try container.decode(String.self, forKey: .category)) ?? .washoku
        self.price = try container.decode(Int.self, forKey: .price)
        self.unit = try container.decode(String.self, forKey: .unit)
        self.rate = try container.decode(Double.self, forKey: .rate)
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
