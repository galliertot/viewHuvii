//
//  DiscoverCollectionModel.swift
//  ViewHuvii
//
//  Created by Thomas Gallier on 22/06/2020.
//  Copyright © 2020 Thomas Gallier. All rights reserved.
//

import UIKit
 
class DiscoverCollectionsModel: UITableViewCell {
    
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var blackView: UIView!
    @IBOutlet weak var titre: UILabel!
    @IBOutlet weak var descriptionTitle: UILabel!
    @IBOutlet weak var workout: UILabel!
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
  
}
 
