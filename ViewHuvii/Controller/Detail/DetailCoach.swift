//
//  DetailCoach.swift
//  ViewHuvii
//
//  Created by Thomas Gallier on 22/06/2020.
//  Copyright © 2020 Thomas Gallier. All rights reserved.
//

import UIKit

class DetailCoach: SuperViewController, UITableViewDelegate, UITableViewDataSource  {
    
    @IBOutlet weak var imageCoach: UIImageView!
    @IBOutlet weak var btnBookSession: UIButton!
    @IBOutlet weak var btnProfile: UIButton!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var labelNbWorkout: UILabel!
    
    var coach:Coach? = nil
    var listWorkout = [Workout] ()
    
    func appendArray() {
        listWorkout.append(Workout(title : "Name title", description: "Description", image : "categorie_image.jpg"))
    }
    
    func btnRound() {
        btnProfile.layer.cornerRadius = 5
        btnProfile.layer.borderWidth = 1
        btnProfile.layer.borderColor = UIColor.green.cgColor
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        super.titleController = "Coaches"
        self.navigationItem.title = coach?.nom
        appendArray()
        btnRound()
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listWorkout.count
    }
    
    func load() -> UINib{
        imageCoach.image = UIImage(named: coach!.image)
        labelNbWorkout.text = String(coach!.numberWorkout)
        
        return UINib(nibName: "DetailCoachWorkOut", bundle: nil)
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       tableView.register(load(), forCellReuseIdentifier: "Cell")
       let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! DetailCoachCell
       cell.titleWorkout?.text = listWorkout[indexPath.row].title
       cell.imageWorkout?.image = UIImage(named: listWorkout[indexPath.row].image)
        cell.descriptionWorkout.text = listWorkout[indexPath.row].description
        cell.blackViewDetailCoachWorkout?.backgroundColor = UIColor(white: 0, alpha: 0.5)
       return cell
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
    }
    


}

