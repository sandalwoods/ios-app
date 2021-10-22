import UIKit
import MixinServices

class CallMessageViewModel: IconPrefixedTextMessageViewModel {
    
    override var rawContent: String {
        let isRemote = message.userId != myUserId
        switch message.category {
        case MessageCategory.WEBRTC_AUDIO_CANCEL.rawValue:
            return isRemote ? R.string.localizable.chat_message_call_remote_cancelled() : R.string.localizable.chat_message_call_cancelled()
        case MessageCategory.WEBRTC_AUDIO_DECLINE.rawValue:
            return isRemote ? R.string.localizable.chat_message_call_declined() : R.string.localizable.chat_message_call_remote_declined()
        case MessageCategory.WEBRTC_AUDIO_BUSY.rawValue:
            return isRemote ? R.string.localizable.chat_message_call_busy() : R.string.localizable.chat_message_call_remote_busy()
        case MessageCategory.WEBRTC_AUDIO_FAILED.rawValue:
            return R.string.localizable.chat_message_call_failed()
        case MessageCategory.WEBRTC_AUDIO_END.rawValue:
            let mediaDuration = Double(message.mediaDuration ?? 0) / millisecondsPerSecond
            let duration = CallDurationFormatter.string(from: mediaDuration) ?? "0"
            return R.string.localizable.chat_message_call_duration(duration)
        default:
            return ""
        }
    }
    
    override var showStatusImage: Bool {
        return false
    }
    
    override func layout(width: CGFloat, style: MessageViewModel.Style) {
        super.layout(width: width, style: style)
        if style.contains(.received) {
            prefixImage = R.image.call.ic_message_prefix_received()
        } else {
            prefixImage = R.image.call.ic_message_prefix_sent()
        }
    }
    
}
