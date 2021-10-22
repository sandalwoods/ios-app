import Foundation

public func LocalizedString(_ key: String, comment: String) -> String {
    let localText = NSLocalizedString(key, comment: "")
    return localText == key ? comment : localText
}
