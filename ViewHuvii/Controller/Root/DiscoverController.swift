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
    @IBOutlet weak var descriptionDiscover: UILabel!

    var menuDiscover = ["Categories", "Collections", "Coaches"]
    var listCategorie = [Categorie] ()
    var listCoach = [Coach] ()
    var listCollection = [Collection] ()
    var selectedRowIndex = -1
    var currentDiscover = "Categories"
    var selectedDiscover = ""
    var selectCoach:Coach? = nil
    
    
    
    
    @objc func changDiscover(sender : UIButton) {
        currentDiscover = sender.titleLabel?.text as! String
        self.viewWillAppear(true)
    }
    //bug avec Y lors du premier load, pourquoi ?
    func addBorderBottom(button: UIButton) {
        let separatorView = UIView.init(frame: CGRect(x: 0, y: button.frame.size.height+3, width: (button.titleLabel?.frame.size.width)!, height: 2))
            separatorView.backgroundColor = .green
            separatorView.tag = 100
            button.addSubview(separatorView)
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
    
    func appendArray() {
        listCategorie.append(Categorie(title: "Fitness", image: "categorie_image.jpg", workout: [Workout(title : "Name title", description: "Description", image : "categorie_image.jpg", minutes : "9"), Workout(title : "Name tiaatle", description: "Description", image : "categorie_image.jpg", minutes :"9"), Workout(title : "Name tiatle", description: "Description", image : "categorie_image.jpg", minutes : "9")], expanded : false))
        listCategorie.append(Categorie(title: "Run", image: "categorie_image.jpg",workout: [Workout(title : "Name title", description: "Description", image : "categorie_image.jpg", minutes : "9"), Workout(title : "Name tiaatle", description: "Description", image : "categorie_image.jpg", minutes : "9"), Workout(title : "Name tiatle", description: "Description", image : "categorie_image.jpg", minutes : "9")], expanded : false))
        listCoach.append(Coach(nom: "Arthur", image: "categorie_image.jpg", imageProfil: "categorie_image.jpg", numberWorkout: 48, instagram : "@arthur.sene_"))
        listCoach.append(Coach(nom: "Thomas", image: "categorie_image.jpg", imageProfil: "categorie_image.jpg", numberWorkout: 21, instagram : "@arthur.sene_"))
        listCollection.append(Collection(title: "Home sweet home", description : "Celebrating French art of living", image: "categorie_image.jpg", numberWorkout: 13))
        listCollection.append(Collection(title: "Home sweet home", description : "Celebrating French art of living", image: "categorie_image.jpg", numberWorkout: 6))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        load()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.titleController = currentDiscover
        updateMenuBorder()
        tableView.reloadData()
        super.viewWillAppear(true)
    }
    

    func fillCellData(cell : UITableViewCell, indexPath : IndexPath) -> UITableViewCell{
        if cell.isKind(of: DiscoverCategoriesModel.self) {
            return fillCategoriesCell(cell : cell as! DiscoverCategoriesModel, indexPath: indexPath)
        } else if cell.isKind(of: DiscoverCoachesModel.self) {
            return fillCoachesCell(cell : cell as! DiscoverCoachesModel, indexPath: indexPath)
        } else if cell.isKind(of: DiscoverCollectionsModel.self) {
            return fillCollectionsCell(cell : cell as! DiscoverCollectionsModel, indexPath: indexPath)
        } else {
            return UITableViewCell()
        }
    }
    
    func registerNib() {
        tableView.register(UINib(nibName: "DiscoverCategorieList", bundle: nil), forCellReuseIdentifier: "CellCategories")
        tableView.register(UINib(nibName: "DiscoverCollectionList", bundle: nil), forCellReuseIdentifier: "CellCollections")
        tableView.register(UINib(nibName: "DiscoverCoachesList", bundle: nil), forCellReuseIdentifier: "CellCoaches")
    }
    
    func load(){
        super.titleController = currentDiscover
        self.navigationItem.hidesBackButton = true
        fillStackView()
        appendArray()
        updateMenuBorder()
        registerNib()
    }
    
    func dequeueCell() -> UITableViewCell{
        switch currentDiscover {
            case "Categories" :
                return tableView.dequeueReusableCell(withIdentifier: "CellCategories") as! DiscoverCategoriesModel
            case "Coaches" :
                return tableView.dequeueReusableCell(withIdentifier: "CellCoaches") as! DiscoverCoachesModel
            case "Collections" :
                return tableView.dequeueReusableCell(withIdentifier: "CellCollections") as! DiscoverCollectionsModel
            default:
                break
        }
        return UITableViewCell()
    }
    
    func fillCategoriesCell(cell : DiscoverCategoriesModel, indexPath : IndexPath) -> DiscoverCategoriesModel {
        if indexPath.row == 0 {
            cell.titre.text = listCategorie[indexPath.row].title
            cell.img.image = UIImage(named: listCategorie[indexPath.row].image)
        } else {
            cell.titre?.text = listCategorie[indexPath.section].workout[indexPath.row-1].title
            cell.img?.image = UIImage(named: listCategorie[indexPath.section].workout[indexPath.row-1].image)
        }
        self.descriptionDiscover.text = "What do you feel like today ?"
        return cell
        
        //comment faire pour changer le xib ici ???
    }

    func fillCoachesCell(cell : DiscoverCoachesModel, indexPath : IndexPath) -> DiscoverCoachesModel {
        cell.nom.text = listCoach[indexPath.row].nom
        cell.img.image = UIImage(named : listCategorie[indexPath.row].image)
        self.descriptionDiscover.text = ""

        return cell
    }
    
    func fillCollectionsCell(cell : DiscoverCollectionsModel, indexPath : IndexPath) -> DiscoverCollectionsModel {
        cell.titre.text = listCollection[indexPath.row].title
        cell.descriptionTitle.text = listCollection[indexPath.row].description
        cell.img.image = UIImage(named : listCollection[indexPath.row].image)
        cell.workout.text = String(listCollection[indexPath.row].numberWorkout)
        self.descriptionDiscover.text = "Find the collection to guid You reach your goal"
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return listCategorie.count
    }
    
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
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       return fillCellData(cell: dequeueCell(), indexPath: indexPath)
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
    
}

