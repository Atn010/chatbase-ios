//
//  BotChatBubble.swift
//  chatbase
//
//  Created by Antonius George S on 09/12/20.
//

import UIKit

class BotChatBubble: UITableViewCell {

    @IBOutlet weak var textView: UITextView!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        textView.roundCorners(corners: [.layerMaxXMaxYCorner, .layerMaxXMinYCorner, .layerMinXMinYCorner], radius: 8)
    }

    public func setupCell(text: String?) {
        textView.text = text
    }
    
}
