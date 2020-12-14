//
//  UserChatBubble.swift
//  chatbase
//
//  Created by Antonius George S on 09/12/20.
//

import UIKit

class UserChatBubble: UITableViewCell {

    @IBOutlet weak var textView: UITextView!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
        
        textView.adjustsFontForContentSizeCategory = true
        textView.font = UIFont.preferredFont(forTextStyle: .body)
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        textView.roundCorners(corners: [ .layerMinXMaxYCorner, .layerMaxXMinYCorner, .layerMinXMinYCorner], radius: 8)
    }

    public func setupCell(text: String?) {
        textView.text = text
    }
}
