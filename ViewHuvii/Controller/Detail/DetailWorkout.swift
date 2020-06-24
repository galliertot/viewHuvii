//
//  DetailWorkout.swift
//  ViewHuvii
//
//  Created by Thomas Gallier on 22/06/2020.
//  Copyright © 2020 Thomas Gallier. All rights reserved.
//

import UIKit

class DetailWorkout: SuperViewController{
    
    var coach:Coach? = nil
    var workout:Workout? = nil
    
    @IBOutlet weak var imageTop: UIImageView!
    @IBOutlet weak var imageCoach: UIImageView!
    @IBOutlet weak var minutes: UILabel!
    @IBOutlet weak var titleWorkout: UILabel!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var titleDescription: UILabel!
    @IBOutlet weak var longDescription: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        super.titleController = coach?.nom as! String
        self.navigationItem.title = workout?.title
        
        load()
    }
    
    /* func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listWorkout.count
    }*/
    func imageCoachConfig() {
        imageCoach.image = UIImage(named: coach!.imageProfil)
        imageCoach.layer.borderWidth = 1.5
        imageCoach.layer.masksToBounds = false
        imageCoach.layer.borderColor = UIColor.green.cgColor
        imageCoach.layer.cornerRadius = imageCoach.frame.height/2
        imageCoach.clipsToBounds = true
    }
    func load(){
        imageCoachConfig()
        imageTop.image = UIImage(named: workout!.image)
        minutes.text = workout?.minutes
        titleWorkout.text = workout?.title
        titleDescription.text = workout?.description
        longDescription.text = workout?.description
    }
    
    /*
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       tableView.register(load(), forCellReuseIdentifier: "Cell")
       let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! DetailCoachCell
       cell.titleWorkout?.text = listWorkout[indexPath.row].title
       cell.imageWorkout?.image = UIImage(named: listWorkout[indexPath.row].image)
        cell.descriptionWorkout.text = listWorkout[indexPath.row].description
        cell.blackViewDetailCoachWorkout?.backgroundColor = UIColor(white: 0, alpha: 0.5)
       return cell
    } */
    
    override func viewDidAppear(_ animated: Bool) {
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
    }
    
    
    
    


}

