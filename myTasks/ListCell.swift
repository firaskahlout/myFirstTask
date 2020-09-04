//
//  ListCell.swift
//  myTasks
//
//  Created by IFone on 9/11/19.
//  Copyright © 2019 Firas Alkahlout. All rights reserved.
//

import UIKit

class ListCell: UITableViewCell {
    
    @IBOutlet weak var nameLbl: UILabel!
    
    @IBOutlet weak var idLbl: UILabel!
    
    @IBOutlet weak var poolLbl: UILabel!
    
    @IBOutlet weak var noteLbl: UILabel!
    
    //@IBOutlet weak var conimg: UIImageView!
    @IBOutlet weak var vipLbl: UILabel!
    
    @IBOutlet weak var redView: UIView!
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var imgView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
        mainView.layer.cornerRadius = 25
        mainView.layer.borderColor = UIColor.lightGray.cgColor
        mainView.layer.borderWidth = 1
        
        redView.layer.cornerRadius = 11
        redView.layer.borderColor = UIColor.white.cgColor
        redView.layer.borderWidth = 2
        
        
        vipLbl.isHidden = true
        vipLbl.clipsToBounds = true
        vipLbl.layer.cornerRadius = 5
        
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
