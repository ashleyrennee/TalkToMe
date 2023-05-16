//
//  ChatCell.swift
//  TalkToMe
//
//  Created by Ashley Acevedo on 5/15/23.
//

import UIKit

class ChatCell: UITableViewCell {

    @IBOutlet weak var textBubble: UIView!
    @IBOutlet weak var textBody: UILabel!
    @IBOutlet weak var currUserLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        textBubble.layer.cornerRadius = textBubble.frame.height / 5
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
