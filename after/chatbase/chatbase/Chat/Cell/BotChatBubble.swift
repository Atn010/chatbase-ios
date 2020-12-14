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
        textView.adjustsFontForContentSizeCategory = true
        let font = UIFont.init(name: "Helvetica", size: 16)!
        let metric = UIFontMetrics.init(forTextStyle: .body)
        textView.font = metric.scaledFont(for: font)
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        textView.roundCorners(corners: [.layerMaxXMaxYCorner, .layerMaxXMinYCorner, .layerMinXMinYCorner], radius: 8)
    }

    public func setupCell(text: String?) {
        textView.text = text
    }
    
}
