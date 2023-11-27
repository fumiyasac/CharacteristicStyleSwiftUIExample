import SwiftUI
import AppFeature

// ※実装方針: iOS17(正確にはiOS17.0.0)から利用可能になる機能を活用する
// その1: SwiftData
// その2: Observation
// その3: TipKit
// 👉 基本的にはMVVMの様な形で上手にまとめられる様にしておく

// MEMO:
// Packageの依存関係をまとめる

@main
struct CharacteristicStyleSwiftUIExampleApp: App {

    // MARK: - AppDelegate

    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

    // MARK: - Body

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
