import Extension
import SwiftUI
import ViewStateProvider
import ViewObject

public struct MenuScreenView: View {

    // MARK: - ViewStateProvider

    @State private var viewStateProvider: MenuViewStateProvider

    // MARK: - Initializer

    // MARK: - Initializer

    public init(viewStateProvider: MenuViewStateProvider = MenuViewStateProvider()) {
        self.viewStateProvider = viewStateProvider
    }

    // MARK: - Body
    
    public var body: some View {
        Text("MenuScreen")
    }
}

// MARK: - Preview

#Preview {
    MenuScreenView()
}
