//
//  FavoriteCell.swift
//  StockControlApp
//
//  Created by Guilherme on 03/12/2017.
//  Copyright © 2017 Guilherme. All rights reserved.
//

import UIKit

class FavoriteCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var contentTextLabel: UILabel!
    @IBOutlet weak var leftImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
