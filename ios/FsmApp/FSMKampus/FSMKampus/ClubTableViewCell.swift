//
//  ClubTableViewCell.swift
//  FSMKampus
//
//  Created by mehmet özcan on 22.01.2019.
//  Copyright © 2019 Mert Agcakoyun. All rights reserved.
//

import UIKit

class ClubTableViewCell: UITableViewCell {
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    
    @IBOutlet weak var textArea: UITextView!
    
    
    @IBOutlet weak var logoView: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
