//
//  LabelsStackView.swift
//  Banka
//
//  Created by Nikita Melnikov on 18.02.2024.
//

import Foundation
import UIKit

class LabelsStackView: UIStackView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        axis = .vertical
        spacing = 8
        distribution = .equalCentering
        alignment = .center
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
    }
}
