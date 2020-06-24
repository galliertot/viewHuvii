//
//  BookSession.swift
//  ViewHuvii
//
//  Created by Thomas Gallier on 22/06/2020.
//  Copyright © 2020 Thomas Gallier. All rights reserved.
//

import UIKit

class BookSession : UIViewController, UICollectionViewDelegate, UICollectionViewDataSource{
    
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var titre: UILabel!
    
    var coach:Coach? = nil
    var listBookings = [Bookings] ()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "BookingsCell", bundle: nil), forCellWithReuseIdentifier: "Cell")
        
        appendArray()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return listBookings.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! BookingsCellModel
        cell.titre.text = listBookings[indexPath.row].title
        cell.descript.text = listBookings[indexPath.row].description
        cell.backgroundColor = .blue
        return cell
    }
    
   func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
       return 1
   }
    
    func appendArray() {
        listBookings.append(Bookings(title : "Consultation", description : "Phone call"))
        listBookings.append(Bookings(title : "Private Training", description : "Zoom Class"))
        listBookings.append(Bookings(title : "Private Training", description : "In person"))
        listBookings.append(Bookings(title : "Group Training", description : "Zoom Class"))
    }
   
    override func viewDidAppear(_ animated: Bool) {
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
    }
    


}

