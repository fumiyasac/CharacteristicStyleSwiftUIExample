import Foundation
import SwiftData

// 実装参考:
// SwiftDataをMVVM（SVVS）のArchitecture内で利用する際の参考
// https://dev.to/jameson/swiftui-with-swiftdata-through-repository-36d1
// SVVS参考
// https://github.com/chatwork/svvs-sample

final class AnnouncementDataStore {

    // MARK: - Property

    private let modelContainer: ModelContainer
    private let modelContext: ModelContext

    // MARK: - Singleton Instance

    @MainActor
    static let shared = AnnouncementDataStore()

    @MainActor
    private init() {
        self.modelContainer = try! ModelContainer(for: AnnouncementDataObject.self)
        self.modelContext = modelContainer.mainContext
    }

    // MARK: - Function

    // MEMO: SwiftDataとのやりとりは「Entity構造体⇔専用Modelクラス」の様にする

    // MEMO: 引数で受け取ったデータを1件追加する
    func insert(_ announcementDataObject: AnnouncementDataObject) {
        modelContext.insert(announcementDataObject)
        do {
            try modelContext.save()
        } catch {
            fatalError(error.localizedDescription)
        }
    }

    // MEMO: 格納されているデータを全件更新する
    func fetchAll() -> [AnnouncementDataObject] {
        do {
            return try modelContext.fetch(FetchDescriptor<AnnouncementDataObject>())
        } catch {
            fatalError(error.localizedDescription)
        }
    }

    // MEMO: 引数で受け取ったデータを1件削除する
    func delete(_ announcementDataObject: AnnouncementDataObject) {
        modelContext.delete(announcementDataObject)
    }
}
