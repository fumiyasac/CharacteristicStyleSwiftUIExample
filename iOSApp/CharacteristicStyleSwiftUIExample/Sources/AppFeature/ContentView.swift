//
//  ContentView.swift
//  CharacteristicStyleSwiftUIExample
//
//  Created by 酒井文也 on 2023/10/23.
//

import SwiftUI

public struct ContentView: View {

    // MARK: - Initializer

    public init() {}

    // MARK: - Body

    public var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

// MARK: - Preview

#Preview {
    ContentView()
}
