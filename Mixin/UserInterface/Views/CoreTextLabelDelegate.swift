import UIKit

protocol CoreTextLabelDelegate: AnyObject {
    func coreTextLabel(_ label: CoreTextLabel, didSelectURL url: URL)
    func coreTextLabel(_ label: CoreTextLabel, didLongPressOnURL url: URL)
}

extension CoreTextLabelDelegate {
    
    func openUrlOutsideApplication(_ url: URL) -> Bool {
        let absoluteString = url.absoluteString
        let fullRange = NSRange(location: 0, length: (absoluteString as NSString).length)
        if UIApplication.shared.canOpenURL(url), let regex = iTunesAppUrlRegex, regex.firstMatch(in: absoluteString, options: [], range: fullRange) != nil {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
            return true
        } else {
            return false
        }
    }
    
    func coreTextLabel(_ label: CoreTextLabel, didSelectURL url: URL) {
        
    }
    
    func coreTextLabel(_ label: CoreTextLabel, didLongPressOnURL url: URL) {
        let alert = UIAlertController(title: url.absoluteString, message: nil, preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: R.string.localizable.chat_message_open_url(), style: .default, handler: { [weak self] (_) in
            self?.coreTextLabel(label, didSelectURL: url)
        }))
        alert.addAction(UIAlertAction(title: R.string.localizable.chat_message_menu_copy(), style: .default, handler: { (_) in
            UIPasteboard.general.string = url.absoluteString
            showAutoHiddenHud(style: .notification, text: R.string.localizable.toast_copied())
        }))
        alert.addAction(UIAlertAction(title: R.string.localizable.dialog_button_cancel(), style: .cancel, handler: nil))
        UIApplication.currentActivity()?.present(alert, animated: true, completion: nil)
    }
    
}
