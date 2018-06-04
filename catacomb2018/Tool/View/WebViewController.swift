import WebKit
import UIKit

extension UIViewController {
    fileprivate func createWKWebViewFrame(size: CGSize) -> CGRect {
        let navigationHeight: CGFloat = 60
        let toolbarHeight: CGFloat = 44
        let height = size.height - navigationHeight - toolbarHeight
        return CGRect(x: 0, y: 0, width: size.width, height: height)
    }
}
