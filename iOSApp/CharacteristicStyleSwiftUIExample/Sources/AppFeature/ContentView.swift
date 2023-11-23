import Extension
import Screen
import SwiftUI

public struct ContentView: View {

    // MARK: - Initializer

    public init() {}

    // MARK: - Body

    public var body: some View {
        // TabView表示要素の配置
        TabView {
            AnnouncementScreenView()
                .tabItem {
                    VStack {
                        Image(systemName: "newspaper.fill")
                        Text("お知らせ")
                    }
                }
                .tag(0)
            GalleryScreenView()
                .tabItem {
                    VStack {
                        Image(systemName: "photo.stack.fill")
                        Text("ギャラリー")
                    }
                }.tag(1)
            MenuScreenView()
                .tabItem {
                    VStack {
                        Image(systemName: "carrot.fill")
                        Text("メニュー")
                    }
                }.tag(2)
        }
        .accentColor(Color(uiColor: UIColor(code: "#f3b664")))
    }
}

// MARK: - Preview

#Preview {
    ContentView()
}
