//
//  ItemCell.swift
//  DreamList
//
//  Created by Neven on 23/01/2017.
//  Copyright © 2017 Neven. All rights reserved.
//

import UIKit

class ItemCell: UITableViewCell {

    @IBOutlet weak var thumbnail: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var priceLbl: UILabel!
    @IBOutlet weak var detailLbl: UILabel!
    
    
    func updateUI(item: Item) {
        titleLbl.text = item.title
        priceLbl.text = "$ \(item.price)"
        detailLbl.text = item.details
    }
    

}
