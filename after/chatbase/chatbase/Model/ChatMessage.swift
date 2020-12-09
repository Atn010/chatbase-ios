//
//  ChatMessage.swift
//  chatbase
//
//  Created by Antonius George S on 09/12/20.
//

import Foundation

public struct ChatMessage: Equatable, Codable {
    public init(message: String?, sender: String?) {
        self.message = message
        self.sender = sender
    }
    
    public let message: String?
    public let sender: String?
    
    public static func == (lhs: ChatMessage, rhs: ChatMessage) -> Bool {
        return lhs.message == rhs.message &&
            lhs.sender == rhs.sender
    }
}
