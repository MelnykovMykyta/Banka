//
//  BaseCountLabel.swift
//  Banka
//
//  Created by Nikita Melnikov on 18.02.2024.
//

import Foundation
import UIKit

class BaseCountLabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        font = UIFont(name: "Nexa-Bold", size: 14)
        textColor = D.Colors.standartTextWithAlpha
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}

