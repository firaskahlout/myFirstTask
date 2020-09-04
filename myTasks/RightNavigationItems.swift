//
//  RightNavigationItems.swift
//  myTasks
//
//  Created by IFone on 9/18/19.
//  Copyright © 2019 Firas Alkahlout. All rights reserved.
//

import UIKit

class RightNavigationItems: UIView {

    @IBOutlet weak var serverImg: UIImageView!
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    override func awakeFromNib() {
        super.awakeFromNib()
        serverImg.layer.borderWidth = 1
        serverImg.layer.borderColor = UIColor.gray.cgColor
        serverImg.layer.cornerRadius = 3
        
    }

}
