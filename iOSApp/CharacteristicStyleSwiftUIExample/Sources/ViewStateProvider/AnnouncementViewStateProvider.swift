import Domain
import Foundation
import Observation
import ViewObject

@Observable
public final class AnnouncementViewStateProvider {
    
    // MARK: - Property

    private let announcementRepository: AnnouncementRequestRepository

    private(set) var announcementViewObjects: [AnnouncementViewObject] = []

    // MARK: - Initializer
    
    init(
        announcementRepository: AnnouncementRequestRepository
    ) {
        self.announcementRepository = announcementRepository
    }
}
