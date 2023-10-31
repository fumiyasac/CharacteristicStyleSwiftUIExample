import Foundation
import UIKit

public extension String {

    // MARK: - Function

    // MEMO: 設定されたUIFontの値から幅を取得する（※Tab型切り替えMenu画面等で活用する）
    func widthOfString(usingFont font: UIFont) -> CGFloat {
        let fontAttributes = [NSAttributedString.Key.font: font]
        let size = self.size(withAttributes: fontAttributes)
        return size.width
    }
}
