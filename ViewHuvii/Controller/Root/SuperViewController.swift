//
//  SuperViewController.swift
//  ViewHuvii
//
//  Created by Thomas Gallier on 22/06/2020.
//  Copyright © 2020 Thomas Gallier. All rights reserved.
//

import UIKit

extension UIViewController {
    class func storyboardInstance(storyboardId: String, restorationId: String) -> UIViewController {
        let storyboard = UIStoryboard(name: storyboardId, bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: restorationId)
    }
}


class SuperViewController: UIViewController {
    
    var titleController:String = ""
    
    
    func addBorderBottom(button: UINavigationController) {
        let separatorView = UIView.init(frame: CGRect(x: 0, y: button.navigationBar.frame.size.height+5, width: (button.navigationBar.frame.size.width), height: 0.5))
            separatorView.backgroundColor = .gray
            button.navigationBar.addSubview(separatorView)
    }
    
    func createShadowNavigationTop() {

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.topItem?.title = self.titleController
        addBorderBottom(button: self.navigationController!)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }

}
