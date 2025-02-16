//
//  AnnouncementRowView.swift
//  CharacteristicStyleSwiftUIExample
//
//  Created by 酒井文也 on 2025/02/16.
//

import SwiftUI
import ViewObject

struct AnnouncementRowView: View {

    // MARK: - Property

    private var announcementViewObject: AnnouncementViewObject

    // MARK: - Initializer

    init(announcementViewObject: AnnouncementViewObject) {
        self.announcementViewObject = announcementViewObject
    }

    // MARK: - Body

    var body: some View {
        Text("AnnouncementRowView")
    }
}
