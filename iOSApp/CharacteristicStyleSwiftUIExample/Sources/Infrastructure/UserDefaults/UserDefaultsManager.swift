//
//  UserDefaultsManager.swift
//
//
//  Created by 酒井文也 on 2023/10/26.
//

import Foundation

// MARK: - Protocol

protocol UserDefaultsManagerProtocol {

    // MEMO: UserDefaultsManagerをうまく書く事ができないか...
}

final class UserDefaultsManager {

    // MARK: - Singleton Instance

    static let shared = UserDefaultsManager()

    private init() {}

    // MARK: - Enum

    private enum Keys {
        
    }

    // MARK: - Property

}
