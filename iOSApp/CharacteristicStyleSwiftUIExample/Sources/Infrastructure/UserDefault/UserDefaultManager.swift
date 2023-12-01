import Foundation
import SwiftyUserDefaults

// MEMO: ライブラリ「SwiftyUserDefaults」を利用する形
// 補足: Quick/Nimbleを用いたテストコードで書きやすい点やPropertyWrapperにも標準で対応している

extension DefaultsKeys {

    // MARK: - Computed Property

    var onboardingStatus: DefaultsKey<Bool> {
        .init("onboardingStatus", defaultValue: true)
    }
}
