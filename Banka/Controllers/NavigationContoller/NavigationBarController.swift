//
//  NavigationBarController.swift
//  Banka
//
//  Created by Nikita Melnikov on 18.02.2024.
//

import Foundation
import UIKit

class NavigationBarController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = D.Colors.mainBackgroundColor
        navigationBar.isHidden = true
    }
}
