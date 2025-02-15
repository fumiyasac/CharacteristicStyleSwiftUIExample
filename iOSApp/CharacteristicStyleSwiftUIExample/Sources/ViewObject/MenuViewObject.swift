import Entity
import Foundation

public struct MenuViewObject: Hashable {
    
    // MARK: - Property

    public let id: Int
    public let name: String
    public let notice: String
    public let category: MenuEntity.FoodMenuCategeory
    public let price: Int
    public let unit: String
    public let rate: Double

    // MARK: - Initializer

    public init(
        id: Int,
        name: String,
        notice: String,
        category: MenuEntity.FoodMenuCategeory,
        price: Int,
        unit: String,
        rate: Double
    ) {
        self.id = id
        self.name = name
        self.notice = notice
        self.category = category
        self.price = price
        self.unit = unit
        self.rate = rate
    }

    // MARK: - Hashable

    // MEMO: Hashableプロトコルに適合させるための処理
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }

    public static func == (lhs: MenuViewObject, rhs: MenuViewObject) -> Bool {
        return lhs.id == rhs.id
    }
}
