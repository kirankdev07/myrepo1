//
//  JsonTableViewCell.swift
//  ExitTestApp
//
//  Created by Kirankumar Bollem on 12/29/18.
//  Copyright © 2018 Kirankumar Bollem. All rights reserved.
//

import UIKit

class JsonTableViewCell: UITableViewCell {

    @IBOutlet weak var imgUrl: UIImageView!
    
    
    
    
    @IBOutlet weak var countryLabel: UILabel!
    
    @IBOutlet weak var sectionLabel: UILabel!
    
    @IBOutlet weak var rankLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
