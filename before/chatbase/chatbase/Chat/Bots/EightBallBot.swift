//
//  EightBallBot.swift
//  chatbase
//
//  Created by Antonius George S on 09/12/20.
//

import Foundation

public final class EightBallBot {
    let cannedResponse: [String] = [
        // Positive Responses
        "It is certain",
        "It is decidedly so",
        "Without a doubt",
        "Yes – definitely",
        "You may rely on it",
        "As I see it, yes",
        "Most likely",
        "Outlook good",
        "Yes",
        "Signs point to yes",
        
        // Neutral Responses
        "Reply hazy, try again",
        "Ask again later",
        "Better not tell you now",
        "Cannot predict now",
        "Concentrate and ask again",
        
        // Negative Responses
        "Don't count on it",
        "My reply is no",
        "My sources say no",
        "Outlook not so good",
        "Very doubtful"
        
    ]
    
    
    public func triggerCondition(text: String?) -> Bool {
        if (text ?? "").contains("?") { return true }
        return false
    }
    
    public func triggeredResponse() -> String {
        return cannedResponse.randomElement() ?? ""
    }
}
