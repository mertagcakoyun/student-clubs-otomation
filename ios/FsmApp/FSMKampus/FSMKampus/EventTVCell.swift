//
//  EventTVCell.swift
//  FSMKampus
//
//  Created by Mert Agcakoyun on 19.01.2019.
//  Copyright © 2019 Mert Agcakoyun. All rights reserved.
//

import UIKit

class EventTVCell: UITableViewCell {
    @IBOutlet weak var AfisIV: UIImageView!
    @IBOutlet weak var EventNameTF: UITextView!
    @IBOutlet weak var DescriptionTF: UITextView!
    @IBOutlet weak var InformationTF: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
