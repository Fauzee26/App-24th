//
//  ListSiswaTableViewCell.swift
//  StudentOfIDN
//
//  Created by Muhammad Hilmy Fauzi on 16/11/17.
//  Copyright © 2017 Hilmy Corp. All rights reserved.
//

import UIKit

class ListSiswaTableViewCell: UITableViewCell {

    @IBOutlet weak var labelNama: UILabel!
    @IBOutlet weak var labelEmail: UILabel!
    @IBOutlet weak var labelKelaS: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
