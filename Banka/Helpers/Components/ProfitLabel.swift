//
//  ProfitLabel.swift
//  Banka
//
//  Created by Nikita Melnikov on 18.02.2024.
//

import Foundation
import UIKit

class ProfitLabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        font = UIFont(name: "Nexa-Bold", size: 18)
        textColor = D.Colors.profitText.withAlphaComponent(0.5)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
