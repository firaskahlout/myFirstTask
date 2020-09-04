//
//  CollectionCellLbl.swift
//  myTasks
//
//  Created by IFone on 9/12/19.
//  Copyright © 2019 Firas Alkahlout. All rights reserved.
//

import UIKit

class CollectionCellLbl: UICollectionViewCell {
    
    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var viewOfLabel: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        viewOfLabel.layer.cornerRadius = 18
        
        
    }
    
    
}
