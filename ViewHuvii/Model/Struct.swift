//
//  Struct.swift
//  ViewHuvii
//
//  Created by Thomas Gallier on 22/06/2020.
//  Copyright © 2020 Thomas Gallier. All rights reserved.
//

import Foundation
import UIKit

struct Categorie {
    var title : String
    var image : String
    var workout : [Workout]
    var expanded : Bool
}

struct Coach {
    var nom : String
    var image : String
    var numberWorkout : Int
    var instagram : String
}

struct Collection {
    var title : String
    var description : String
    var image : String
    var numberWorkout : Int
}

struct Workout {
    var title : String
    var description : String
    var image : String
}

struct Bookings {
    var title : String
    var description : String
}
