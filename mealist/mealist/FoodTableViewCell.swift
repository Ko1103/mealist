//
//  FoodTableViewCell.swift
//  mealist
//
//  Created by 山浦功 on 2017/12/16.
//  Copyright © 2017年 KoYamaura. All rights reserved.
//

import UIKit

class FoodTableViewCell: UITableViewCell {

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var count: UILabel!
    @IBOutlet weak var note: UILabel!
    @IBOutlet weak var url: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
