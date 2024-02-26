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
    private var profitTitle: ProfitLabel!
    private var dateLabel: ProfitLabel!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .clear
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override internal func prepareForReuse() {
        super.prepareForReuse()
        [view, profitTitle, dateLabel].forEach { elem in
            elem?.removeFromSuperview()
        }
    }
}

extension MainTVC {
    
    func setutProfit(date: String, profit: String) {
        view = UIView()
        view.backgroundColor = .clear
        view.layer.cornerRadius = 20
        contentView.addSubview(view)
        
        profitTitle = ProfitLabel()
        profitTitle.text = "+\(profit)$"
        view.addSubview(profitTitle)
        
        dateLabel = ProfitLabel()
        dateLabel.text = date
        dateLabel.textColor = D.Colors.standartTextColor
        view.addSubview(dateLabel)
        
        let separatorView = UIView()
        separatorView.backgroundColor = D.Colors.standartTextWithAlpha
        view.addSubview(separatorView)
        
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
        
        separatorView.snp.makeConstraints {
            $0.height.equalTo(0.5)
            $0.leading.equalToSuperview().inset(20)
            $0.trailing.bottom.equalToSuperview()
        }
    }
}
