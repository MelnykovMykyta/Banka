//
//  MainVC.swift
//  Banka
//
//  Created by Nikita Melnikov on 28.01.2024.
//

import Foundation
import UIKit
import SnapKit
import Lottie

class MainVC: UIViewController {
    
    private var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
}

private extension MainVC {
    
    func setupView() {
        view.backgroundColor = .black
        
        label = UILabel()
        label.text = "MAIN"
        label.textColor = .white
        label.font = UIFont(name: "Arial", size: 36)
        view.addSubview(label)
        
        label.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
    }
}
