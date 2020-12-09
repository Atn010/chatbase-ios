//
//  ChatVC.swift
//  chatbase
//
//  Created by Antonius George S on 09/12/20.
//

import UIKit

class ChatVC: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var chatInput: UITextView!
    @IBOutlet weak var sendButton: UIButton!
    @IBOutlet weak var sendButtonHeight: NSLayoutConstraint!
    
    var chatMessages: [ChatMessage] = []
    var isFirstload = true
    
    let botClass = EightBallBot.init()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(textViewDidChangeSelection), name: NSNotification.Name(rawValue: "TextViewDidChangeSelection"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(textViewDidEndEditingTextview), name: NSNotification.Name(rawValue: "TextViewDidEndEditingTextview"), object: nil)
        
        self.title = "8-Ball Bot"
        
        tableView.delegate = self
        tableView.dataSource = self
        sendButton.addTarget(self, action: #selector(textViewDidEndEditingTextview), for: .touchUpInside)
        
        chatInput.placeholder = "Type your Question"
        chatInput.layer.cornerRadius = 8
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "default")
        tableView.register(UINib.init(nibName: "UserChatBubble", bundle: nil), forCellReuseIdentifier: "user")
        tableView.register(UINib.init(nibName: "BotChatBubble", bundle: nil), forCellReuseIdentifier: "bot")
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.chatMessages.append(.init(message: "I am 8-Ball Bot, I will answer all your questions", sender: "bot"))
            self.tableView.reloadData()
        }
        

        
        tableView.transform = CGAffineTransform(scaleX: 1, y: -1)
    }
    
    override func viewDidLayoutSubviews() {
        tableView.contentInset.top = chatInput.contentSize.height + 32
        if isFirstload {
        sendButtonHeight.constant = chatInput.contentSize.height
        sendButton.layer.cornerRadius = sendButtonHeight.constant / 2
            isFirstload = false
        }
    }
}

extension ChatVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        let count = chatMessages.count
        
        // put emptyState Here
        
        return count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let defaultCell = tableView.dequeueReusableCell(withIdentifier: "default")!
        
        guard let chatMessage = chatMessages[safe: indexPath.row]
        else { return defaultCell }
        
        if let chatSource = chatMessage.sender{
            if chatSource.caseInsensitiveCompare("user") == .orderedSame,
               let cell = tableView.dequeueReusableCell(withIdentifier: "user") as? UserChatBubble {
                
                cell.setupCell(text: chatMessage.message)
                cell.contentView.transform = CGAffineTransform(scaleX: 1, y: -1)
                return cell
                
            } else if chatSource.caseInsensitiveCompare("bot") == .orderedSame,
                      let cell = tableView.dequeueReusableCell(withIdentifier: "bot") as? BotChatBubble {
                
                cell.setupCell(text: chatMessage.message)
                cell.contentView.transform = CGAffineTransform(scaleX: 1, y: -1)
                return cell
            }
            
            
        }
        
        defaultCell.textLabel?.text = chatMessage.message
        defaultCell.textLabel?.textAlignment = .center
        
        defaultCell.contentView.transform = CGAffineTransform(scaleX: 1, y: -1)
        return defaultCell
    }
    
    
}

extension ChatVC: UITableViewDelegate {
    
}


extension ChatVC {
    @objc func textViewDidEndEditingTextview() {
        if let message = chatInput.text,
           !message.isBlank {
            chatMessages.insert(.init(message: message, sender: "user"), at: 0)
            processText(message)
        }
        
        chatInput.text = ""
        chatInput.placeholder = "Input your message"
        self.view.endEditing(true)
        self.tableView.reloadData()
        chatInput.textViewDidChange(chatInput)
    }
    
    @objc func textViewDidChangeSelection() {
        DispatchQueue.main.async {
            self.tableView.contentInset.top = self.chatInput.intrinsicContentSize.height + 32
        }
        
    }
    
    func processText(_ message: String) {
        if botClass.triggerCondition(text: message) {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                self.chatMessages.insert(.init(message: self.botClass.triggeredResponse(), sender: "bot"), at: 0)
                self.tableView.reloadData()
            }
            
        }
    }
}

