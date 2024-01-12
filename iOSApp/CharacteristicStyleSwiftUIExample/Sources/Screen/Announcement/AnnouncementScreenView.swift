import Extension
import SwiftUI
import ViewStateProvider
import ViewObject

public struct AnnouncementScreenView: View {

    // MARK: - ViewStateProvider

    @State private var viewStateProvider: AnnouncementViewStateProvider

    // MARK: - Initializer

    public init(viewStateProvider: AnnouncementViewStateProvider = AnnouncementViewStateProvider()) {
        self.viewStateProvider = viewStateProvider
    }

    // MARK: - Body

    public var body: some View {
        Text("AnnouncementScreen")
    }
}

// MARK: - Preview

#Preview {
    AnnouncementScreenView()
}
