//
//  DiscoverController.swift
//  ViewHuvii
//
//  Created by Thomas Gallier on 22/06/2020.
//  Copyright © 2020 Thomas Gallier. All rights reserved.
//

import UIKit
import Foundation


class DiscoverController: SuperViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var tableView: UITableView!
    var menuDiscover = ["Categories", "Collections", "Coaches"]
    var listCategorie = [Categorie] ()
    var listCoach = [Coach] ()
    var listCollection = [Collection] ()
    var selectedRowIndex = -1

    @IBOutlet weak var descriptionDiscover: UILabel!
    
    var currentDiscover = "Categories"
    var selectedDiscover = ""
    var selectCoach:Coach? = nil
    
    @objc func changDiscover(sender : UIButton) {
        selectedDiscover = sender.titleLabel?.text as! String
        let destinationVC = DiscoverController.storyboardInstance(storyboardId: "Main", restorationId: "Discover") as! DiscoverController
        destinationVC.currentDiscover = selectedDiscover
        self.navigationController?.pushViewController(destinationVC, animated: false)

    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return listCategorie.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch currentDiscover {
            case "Categories":
                if listCategorie[section].expanded == true {
                    return listCategorie[section].workout.count + 1
                } else {
                    return 1
                }
            case "Collections":
                return listCollection.count
            case "Coaches":
                return listCoach.count
            default:
                break
            
        }
        return 0
    }

    
    

    
    func updateMenuBorder() {
        for i in 0...menuDiscover.count-1 {
            let button = stackView.arrangedSubviews[i] as! UIButton
            if (button.titleLabel?.text == currentDiscover) {
                addBorderBottom(button: button)
            } else {
                for view in button.subviews {
                    if view.tag == 100 {
                        view.removeFromSuperview()
                    }
                }
            }
        }
    }
    
    func fillStackView() {
        for i in menuDiscover
        {
            let button = UIButton(frame: CGRect(x: 0, y: 100, width: 100, height: 50))
            button.backgroundColor = .white
            button.setTitle(i, for: .normal)
            button.setTitleColor(.black, for: .normal)
            button.contentVerticalAlignment = .center
            button.titleLabel?.adjustsFontSizeToFitWidth = true
            button.addTarget(self, action: #selector(changDiscover), for: .touchUpInside)
            stackView.addArrangedSubview(button)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.titleController = currentDiscover
        tableView.reloadData()
        super.viewWillAppear(true)

        
    }
    
    
    func appendArray() {
        listCategorie.append(Categorie(title: "Fitness", image: "categorie_image.jpg", workout: [Workout(title : "Name title", description: "Description", image : "categorie_image.jpg"), Workout(title : "Name tiaatle", description: "Description", image : "categorie_image.jpg"), Workout(title : "Name tiatle", description: "Description", image : "categorie_image.jpg")], expanded : false))
        listCategorie.append(Categorie(title: "Run", image: "categorie_image.jpg",workout: [Workout(title : "Name title", description: "Description", image : "categorie_image.jpg"), Workout(title : "Name tiaatle", description: "Description", image : "categorie_image.jpg"), Workout(title : "Name tiatle", description: "Description", image : "categorie_image.jpg")], expanded : false))
        listCoach.append(Coach(nom: "Arthur", image: "categorie_image.jpg", numberWorkout: 48, instagram : "@arthur.sene_"))
        listCoach.append(Coach(nom: "Thomas", image: "categorie_image.jpg", numberWorkout: 21, instagram : "@arthur.sene_"))
        listCollection.append(Collection(title: "Home sweet home", description : "Celebrating French art of living", image: "categorie_image.jpg", numberWorkout: 13))
        listCollection.append(Collection(title: "Home sweet home", description : "Celebrating French art of living", image: "categorie_image.jpg", numberWorkout: 6))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        super.titleController = currentDiscover
        self.navigationItem.hidesBackButton = true
        
        fillStackView()
        appendArray()
        updateMenuBorder()

    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
                let identifier = segue.identifier ?? ""
        
                switch identifier {
                  case "detailCoach":
                    guard let vc = segue.destination as? DetailCoach else {
                      return
                    }
                    
                    vc.coach = selectCoach
                  default:
                    break
                }
    }


    func addBorderBottom(button: UIButton) {
        let separatorView = UIView.init(frame: CGRect(x: 0, y: button.frame.size.height-10, width: (button.titleLabel?.frame.size.width)!, height: 2))
            separatorView.backgroundColor = .green
            separatorView.tag = 100
            button.addSubview(separatorView)
    }
    
    /* func addSeparatorCell(cell : UITableViewCell) {
        let separatorView = UIView.init(frame: CGRect(x: 0, y: cell.frame.size.height+50, width: cell.frame.size.width - 10, height: 2))
        separatorView.backgroundColor = .white
        cell.contentView.addSubview(separatorView)
    } */
    
    
    
    func tableView(_ tableView : UITableView, didSelectRowAt indexPath : IndexPath) {
        switch currentDiscover {
            case "Categories":
                if(listCategorie[indexPath.section].expanded == true) {
                    listCategorie[indexPath.section].expanded = false
                    let sections = IndexSet.init(integer: indexPath.section)
                    tableView.reloadSections(sections, with: .none)
                } else {
                    listCategorie[indexPath.section].expanded = true
                    let sections = IndexSet.init(integer: indexPath.section)
                    tableView.reloadSections(sections, with: .none)
                }
            case "Coaches":
                self.selectCoach = listCoach[indexPath.row]
                performSegue(withIdentifier : "detailCoach", sender : tableView)
            default:
                break
        }
    }
    
    func switchCellValue(cell : DiscoverCategorieListModel, cellForRowAt indexPath: IndexPath) {
        switch currentDiscover {
            case "Categories":
                if indexPath.row == 0 {
                    cell.title?.text = listCategorie[indexPath.section].title
                    cell.imageCategorie?.image = UIImage(named: listCategorie[indexPath.section].image)
                } else {
                    cell.titleCollection?.text = listCategorie[indexPath.section].workout[indexPath.row-1].title
                    cell.imageCollection?.image = UIImage(named: listCategorie[indexPath.section].workout[indexPath.row-1].image)
                }
                 break
            case "Collections":
                cell.titleCollection?.text = listCollection[indexPath.row].title
                cell.descriptionCollectionLabel?.text = listCollection[indexPath.row].description
                cell.imageCollection?.image = UIImage(named: listCollection[indexPath.row].image)
                cell.numberWorkout?.text = String(listCollection[indexPath.row].numberWorkout)
                cell.collectionBlackView?.backgroundColor = UIColor(white: 0, alpha: 0.5)
                 break
            case "Coaches":
                cell.nameCoaches?.text = listCoach[indexPath.row].nom
                cell.imageCoaches?.image = UIImage(named: listCoach[indexPath.row].image)
                break
            default:
                break
            
        }
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       tableView.register(load(indexPath : indexPath.row), forCellReuseIdentifier: "Cell")
       let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! DiscoverCategorieListModel

       switchCellValue(cell: cell, cellForRowAt: indexPath)
       return cell
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
    }
    
    func load(indexPath : Int) -> UINib{
        
        switch currentDiscover {
            case "Categories":
                descriptionDiscover.text = "What do you feel like today ?"
                if indexPath == 0 {
                    return UINib(nibName: "DiscoverCategorieList", bundle: nil)
                } else {
                    return UINib(nibName: "DiscoverCollectionList", bundle: nil)
                }
                // fait bugger l'accordeon en ajoutant le nib collection, probleme d'index je pense
            case "Collections":
                descriptionDiscover.text = "Find the collection to guid you reach your goal !"
                return UINib(nibName: "DiscoverCollectionList", bundle: nil)
            case "Coaches":
                descriptionDiscover.text = "What do you feel like today ?"
                return UINib(nibName: "DiscoverCoachesList", bundle: nil)
            default:
                break
        }
        return UINib()
    }

}
