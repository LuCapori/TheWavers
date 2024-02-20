//
//  SyntomsStruct.swift
//  TheWavers
//
//  Created by Luca Caporicci on 20/02/24.
//

import Foundation
import UIKit

class YourParentViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let viewController = ViewController()
        let navigationController = UINavigationController(rootViewController: viewController)
        
        // Puoi personalizzare il navigation controller se necessario
        // navigationController.navigationBar.tintColor = .white
        // navigationController.navigationBar.barTintColor = .blue
        
        present(navigationController, animated: true, completion: nil)
    }
}
