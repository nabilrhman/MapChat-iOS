//
//  ChatTableViewCell.swift
//  calculate
//
//  Created by Nabil Rahman on 9/16/19.
//  Copyright © 2019 Nabil Rahman. All rights reserved.
//

import UIKit

class ChatCell: UITableViewCell {


    @IBOutlet weak var ChatNameLabel: UILabel!
    
    @IBOutlet weak var ChatMessageTextView: UITextView!
    
    func setChat(chat: Chat)
    {
        ChatNameLabel.text = chat.name
        ChatMessageTextView.text = chat.message
    }
}
