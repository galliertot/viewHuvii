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
    var imageProfil : String
    var instagram : String
}

struct Collection {
    var title : String
    var description : String
    var image : String
    var workout : [Workout]
}

struct Workout {
    var title : String
    var description : String
    var image : String
    var minutes : String
    var coach : Coach
    var steps : [Step]
}

struct Bookings {
    var title : String
    var description : String
}

struct Step {
    var title : String
    var movements : [Movement]
}
struct Movement {
    var title : String
    var lenght : String
    var image : String
}

/*
func createDataBool(_ Categorie : Bool, _ Coach : Bool, _ Collection : Bool, _ Workout : Bool, _ Bookings : Bool, _ Step : Bool, _ Movement : Bool) {
    if Categorie {
        appendCategorie()
    }
    if Categorie {
        appendCoach()
    }
    if Categorie {
        appendCollection()
    }
    if Categorie {
        appendWorkout()
    }
    if Categorie {
        appendBookings()
    }
    if Categorie {
        appendStep()
    }
    if Movement {
        appendMovement()
    }
}
 */

func appendCategorie() -> [Categorie]{
    var list = [Categorie]()
    list.append(Categorie(title: "Fitness", image: getImageGlobal(), workout: appendWorkout(), expanded: false))
    list.append(Categorie(title: "Run", image: getImageGlobal(), workout: appendWorkout(), expanded: false))
    return list
}

func appendCoach() -> [Coach]{
    var list = [Coach]()
    list.append(Coach(nom: "Arthur", image: getImageGlobal(), imageProfil: getImageGlobal(), instagram: "arthur_sene"))
    list.append(Coach(nom: "Arthuro", image: getImageGlobal(), imageProfil: getImageGlobal(), instagram: "arthuro_sene"))
    return list
}

func appendCollection() -> [Collection]{
    var list = [Collection]()
    list.append(Collection(title: "Home weet home", description: "Celebrating French art of living", image: getImageGlobal(), workout: appendWorkout()))
    list.append(Collection(title: "Home weet home", description: "Celebrating French art of living", image: getImageGlobal(), workout: appendWorkout()))
    return list
}

func appendWorkout() -> [Workout] {
    var list = [Workout]()
    list.append(Workout(title: "Name title", description: "12m cardio beginner", image: getImageGlobal(), minutes: "10", coach: appendCoach()[0], steps: appendStep()))
    list.append(Workout(title: "Name title", description: "12m cardio beginner", image: getImageGlobal(), minutes: "10", coach: appendCoach()[1], steps: appendStep()))
    return list
}

func appendBookings() -> [Bookings]{
    var list = [Bookings]()
    list.append(Bookings(title : "Consultation", description : "Phone call"))
    list.append(Bookings(title : "Private Training", description : "Zoom Class"))
    list.append(Bookings(title : "Private Training", description : "In person"))
    list.append(Bookings(title : "Group Training", description : "Zoom Class"))
    return list
}

func appendStep() -> [Step] {
    var list = [Step]()
    list.append(Step(title: "Warm up", movements: appendMovement()))
    list.append(Step(title: "First round", movements: appendMovement()))
    return list
}

func appendMovement() -> [Movement]{
    var list = [Movement]()
    list.append(Movement(title: "Split Squats", lenght: "0:20", image: getImageGlobal()))
    list.append(Movement(title: "Split Squats", lenght: "0:10", image: getImageGlobal()))
    list.append(Movement(title: "Split Squats", lenght: "0:30", image: getImageGlobal()))
    return list
}

func getImageGlobal() -> String {
    return "categorie_image.jpg"
}

func getWorkoutByCoach(coach : Coach) -> [Workout] {
    var list = [Workout]()
    for i in appendWorkout() {
        if i.coach.nom == coach.nom {
            list.append(i)
        }
    }
    return list
}
