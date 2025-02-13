import Extension
import SwiftUI
import ViewStateProvider
import ViewObject

public struct MenuScreenView: View {

    // MARK: - ViewStateProvider

    private let viewStateProvider: MenuViewStateProvider

    // MARK: - Initializer

    public init(viewStateProvider: MenuViewStateProvider = MenuViewStateProvider()) {
        self.viewStateProvider = viewStateProvider
    }

    // MARK: - Body
    
    public var body: some View {
        NavigationStack {
            Group {
                Text("MenuScreen")
            }
            .onFirstAppear {
                viewStateProvider.fetchMenus()
            }
            .navigationTitle("🍙メニュー画面")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

// MARK: - Preview

#Preview {
    MenuScreenView()
}
