//
//  UIViewControllerExtension.swift
//  CharacteristicStyleSwiftUIExample
//
//  Created by 酒井文也 on 2025/02/04.
//

import Foundation
import UIKit

// UIViewControllerの拡張
public extension UIViewController {

    // MARK: - Public Function

    // この画面のナビゲーションバーを設定するメソッド
    func setupNavigationBarTitle(_ title: String) {

        // NavigationControllerのデザイン調整を行う
        var attributes: [NSAttributedString.Key : Any] = [:]
        attributes[NSAttributedString.Key.font] = UIFont(name: "HelveticaNeue-Bold", size: 14.0)
        attributes[NSAttributedString.Key.foregroundColor] = UIColor.white

        // NavigationBarをタイトル配色を決定する
        guard let navigationController = self.navigationController else {
            return
        }
        navigationController.navigationBar.barTintColor = UIColor(code: "#f3b664")
        navigationController.navigationBar.titleTextAttributes = attributes

        // タイトルを入れる
        self.navigationItem.title = title
    }

    // 戻るボタンの「戻る」テキストを削除した状態にするメソッド
    func removeBackButtonText() {

        // NavigationBarをタイトル配色を決定する
        guard let navigationController = self.navigationController else {
            return
        }
        navigationController.navigationBar.tintColor = UIColor.white

        self.navigationItem.backButtonDisplayMode = .minimal
        self.navigationItem.backButtonTitle = self.navigationItem.title
    }
}

