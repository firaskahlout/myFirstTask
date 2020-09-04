//
//  TodoForCell.swift
//  myTasks
//
//  Created by IFone on 9/11/19.
//  Copyright © 2019 Firas Alkahlout. All rights reserved.
//

import Foundation

class TodoForCell {
    
    var array = [myCell]()
    
    func setData(){
        array.append(myCell())
        array.append(myCell())
        array.append(myCell())
        array.append(myCell())
        array.append(myCell())
        array.append(myCell())
        array.append(myCell())
        array.append(myCell())
        array.append(myCell())
        array.append(myCell())
        
        var i = 1
        for item in array {
            item.name = "Name No. \(i)"
            item.id = "125.255.255.\(i)"

            item.note = "No Notes."
            if i == 2 {
                item.vipUser = true
            }
            if i >= 3{
                item.isconnected = false
            }

            i += 1
        }
    }

}
