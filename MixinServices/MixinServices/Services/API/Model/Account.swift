import Foundation

public enum ReceiveMessageSource: String {
    case everybody = "EVERYBODY"
    case contacts = "CONTACTS"
}

public enum AcceptConversationSource: String {
    case everybody = "EVERYBODY"
    case contacts = "CONTACTS"
}

public enum AcceptSearchSource: String {
    case everybody = "EVERYBODY"
    case contacts = "CONTACTS"
    case nobody = "NOBODY"
}

public struct Account: Encodable {
    
    public let user_id: String
    public let session_id: String
    public let type: String
    public let identity_number: String
    public let full_name: String
    public let biography: String
    public let avatar_url: String
    public let phone: String
    public let authentication_token: String
    public let code_id: String
    public let code_url: String
    public let reputation: Int
    public let created_at: String
    public let receive_message_source: String
    public let accept_conversation_source: String
    public let accept_search_source: String
    public let has_pin: Bool
    public var has_emergency_contact: Bool
    public let pin_token: String
    public let fiat_currency: String
    public let transfer_notification_threshold: Double
    public let transfer_confirmation_threshold: Double
    
}

extension Account: Decodable {
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        user_id = try container.decode(String.self, forKey: .user_id)
        session_id = try container.decode(String.self, forKey: .session_id)
        identity_number = try container.decode(String.self, forKey: .identity_number)
        type = try container.decodeIfPresent(String.self, forKey: .type) ?? ""
        full_name = try container.decodeIfPresent(String.self, forKey: .full_name) ?? ""
        biography = try container.decodeIfPresent(String.self, forKey: .biography) ?? ""
        avatar_url = try container.decodeIfPresent(String.self, forKey: .avatar_url) ?? ""
        phone = try container.decodeIfPresent(String.self, forKey: .phone) ?? ""
        authentication_token = try container.decodeIfPresent(String.self, forKey: .authentication_token) ?? ""
        code_id = try container.decodeIfPresent(String.self, forKey: .code_id) ?? ""
        reputation = try container.decodeIfPresent(Int.self, forKey: .reputation) ?? 0
        created_at = try container.decodeIfPresent(String.self, forKey: .created_at) ?? ""
        receive_message_source = try container.decodeIfPresent(String.self, forKey: .receive_message_source) ?? ""
        accept_conversation_source = try container.decodeIfPresent(String.self, forKey: .accept_conversation_source) ?? ""
        accept_search_source = try container.decodeIfPresent(String.self, forKey: .accept_search_source) ?? ""
        has_pin = try container.decodeIfPresent(Bool.self, forKey: .has_pin) ?? false
        has_emergency_contact = try container.decodeIfPresent(Bool.self, forKey: .has_emergency_contact) ?? false
        code_url = try container.decodeIfPresent(String.self, forKey: .code_url) ?? ""
        pin_token = try container.decodeIfPresent(String.self, forKey: .pin_token) ?? ""
        fiat_currency = try container.decodeIfPresent(String.self, forKey: .fiat_currency) ?? ""
        transfer_notification_threshold = try container.decodeIfPresent(Double.self, forKey: .transfer_notification_threshold) ?? 0
        transfer_confirmation_threshold = try container.decodeIfPresent(Double.self, forKey: .transfer_confirmation_threshold) ?? 0
    }
    
}
