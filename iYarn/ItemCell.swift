//
//  ItemCell.swift
//  iYarn
//
//  Created by Jason Larkin on 10/9/16.
//  Copyright © 2016 Jason Larkin. All rights reserved.
//

import UIKit

class ItemCell: UITableViewCell {

    @IBOutlet weak var thumb: UIImageView!
    
    @IBOutlet weak var title: UILabel!
    
    @IBOutlet weak var price: UILabel!
    
    @IBOutlet weak var details: UILabel!
    
    func configureCell (item:Item) {
        
        title.text = item.title
        price.text = "\(item.price)"
        details.text = item.details
    }
    

}
