//
//  GraphsVC.swift
//  Banka
//
//  Created by Nikita Melnikov on 18.02.2024.
//

import Foundation
import UIKit
import SnapKit

class GraphsVC: UIViewController {
    
    private var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
}

private extension GraphsVC {
    
    func setupView() {
        view.backgroundColor = .blue
        
        label = UILabel()
        label.text = "GraphsVC"
        label.textColor = .white
        label.font = UIFont(name: "Arial", size: 36)
        view.addSubview(label)
        
        label.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
    }
}


