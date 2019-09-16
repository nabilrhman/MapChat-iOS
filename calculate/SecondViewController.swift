//
//  SecondViewController.swift
//  calculate
//
//  Created by Nabil Rahman on 9/16/19.
//  Copyright © 2019 Nabil Rahman. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var chats: [Chat] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        chats = createArray()
    }

    
    func createArray() -> [Chat] {
        var tempChats: [Chat] = []
        
        let chat1 = Chat(name: "SUBTRACT", message: ".")
        let chat2 = Chat(name: "DIVIDE", message: ".")
        let chat3 = Chat(name: "MULTIPLY", message: ".")
        let chat4 = Chat(name: "PERCENT", message: ".")
        let chat5 = Chat(name: "ROOT", message: ".")
        
        tempChats.append(chat1)
        tempChats.append(chat2)
        tempChats.append(chat3)
        tempChats.append(chat4)
        tempChats.append(chat5)
        
        return tempChats
        
        
    }
    

}


extension SecondViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chats.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let chat = chats[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChatCell") as! ChatCell
        
        cell.setChat(chat: chat)
        
        return cell
    }
}

