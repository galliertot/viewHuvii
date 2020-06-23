//
//  DetailCoachCell.swift
//  ViewHuvii
//
//  Created by Thomas Gallier on 22/06/2020.
//  Copyright © 2020 Thomas Gallier. All rights reserved.
//

import UIKit
 
class DetailCoachCell: UITableViewCell {
    
    @IBOutlet weak var blackViewDetailCoachWorkout: UIView!
    @IBOutlet weak var descriptionWorkout: UILabel!
    @IBOutlet weak var titleWorkout: UILabel!
    @IBOutlet weak var imageWorkout: UIImageView!
    
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
  
}
 
