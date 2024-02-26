//
//  MainTVC.swift
//  Banka
//
//  Created by Nikita Melnikov on 26.02.2024.
//

import Foundation
import UIKit
import SnapKit

class MainTVC: UITableViewCell {
    
    private var view: UIView!
    var profitTitle: ProfitLabel!
    var dateLabel: ProfitLabel!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}

private extension MainTVC {
    
    func setupView() {
        contentView.backgroundColor = .clear
        
        view = UIView()
        view.backgroundColor = .clear
        view.layer.cornerRadius = 20
        view.layer.borderColor = D.Colors.standartTextWithAlpha.cgColor
        view.layer.borderWidth = 1
        contentView.addSubview(view)
        
        profitTitle = ProfitLabel()
        view.addSubview(profitTitle)
        
        dateLabel = ProfitLabel()
        dateLabel.textColor = D.Colors.standartTextColor
        view.addSubview(dateLabel)
        
        view.snp.makeConstraints {
            $0.height.equalTo(80).priority(.low)
            $0.edges.equalToSuperview().inset(8)
        }
        
        dateLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().inset(20)
        }
        
        profitTitle.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().inset(20)
        }
    }
}
