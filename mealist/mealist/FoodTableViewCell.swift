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
    var URL: String?
    var hasURL = false
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func updateCell(_ data: FoodViewModel){
        name.text = data.name
        count.text = "\(data.count)"
        note.text = data.note
        if data.url != "" {
            url.setTitle(data.url, for: .normal)
            URL = data.url
            hasURL = true
        }
    }
    
    @IBAction func openURL(_ sender: Any) {
        if URL != nil{
            if let url = NSURL(string: URL!) {
                UIApplication.shared.open(url as URL)
            }
        }
    }
}
