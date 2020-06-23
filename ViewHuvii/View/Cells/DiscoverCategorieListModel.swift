//
//  DiscoverCategorieListModel.swift
//  ViewHuvii
//
//  Created by Thomas Gallier on 22/06/2020.
//  Copyright © 2020 Thomas Gallier. All rights reserved.
//

import UIKit
 
class DiscoverCategorieListModel: UITableViewCell {
    
    @IBOutlet weak var imageCollection: UIImageView!
    @IBOutlet weak var nameCoaches: UILabel!
    @IBOutlet weak var imageCoaches: UIImageView!
    @IBOutlet weak var descriptionCollectionLabel: UILabel!
    @IBOutlet weak var imageCategorie: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var titleCollection: UILabel!
    @IBOutlet weak var collectionBlackView: UIView!
    @IBOutlet weak var numberWorkout: UILabel!
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
  
}
 
