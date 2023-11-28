import Foundation

// 参考: PropertyWrapperで管理しながらもMVVMアーキテクチャで利用しやすい形にする
// https://www.avanderlee.com/swift/property-wrappers/

@propertyWrapper
struct UserDefault<Value> {
    let key: String
    let defaultValue: Value
    var container: UserDefaults = .standard

    var wrappedValue: Value {
        get {
            return container.object(forKey: key) as? Value ?? defaultValue
        }
        set {
            container.set(newValue, forKey: key)
        }
    }
}

extension UserDefaults {

    @UserDefault(key: "has_seen_app_introduction", defaultValue: false)
    static var hasSeenAppIntroduction: Bool
}
