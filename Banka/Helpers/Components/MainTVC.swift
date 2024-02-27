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
    private var dateLabel: UILabel!
    private var sourceLabel: UILabel!
    private var label: UILabel!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .clear
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override internal func prepareForReuse() {
        super.prepareForReuse()
        [view, profitTitle, dateLabel, label].forEach { elem in
            elem?.removeFromSuperview()
        }
    }
}

extension MainTVC {
    
    func setupEmptyCell() {
        label = UILabel()
        label.text = "Add your profits"
        label.font = UIFont(name: "Nexa-Bold", size: 48)
        label.textColor = D.Colors.standartTextColor.withAlphaComponent(0.1)
        label.textAlignment = .center
        label.numberOfLines = 2
        contentView.addSubview(label)
        
        label.snp.makeConstraints {
            $0.height.equalTo(contentView.snp.width)
            $0.edges.equalToSuperview().inset(40)
        }
    }
    
    func setupProfit(date: Date, source: String, profit: Int) {
        view = UIView()
        view.backgroundColor = .clear
        contentView.addSubview(view)
        
        let dateSourceSV = UIStackView()
        dateSourceSV.axis = .vertical
        dateSourceSV.alignment = .leading
        dateSourceSV.spacing = 8
        view.addSubview(dateSourceSV)
        
        dateLabel = UILabel()
        dateLabel.text = date.description.getFullDate()
        dateLabel.font = UIFont(name: "Nexa-Bold", size: 12)
        dateLabel.textColor = D.Colors.standartTextWithAlpha
        dateSourceSV.addArrangedSubview(dateLabel)
        
        sourceLabel = UILabel()
        sourceLabel.text = source
        sourceLabel.numberOfLines = 0
        sourceLabel.font = UIFont(name: "Nexa-Bold", size: 16)
        sourceLabel.textColor = D.Colors.standartTextColor
        dateSourceSV.addArrangedSubview(sourceLabel)
        
        profitTitle = ProfitLabel()
        profitTitle.text = "+\(profit.description)$"
        view.addSubview(profitTitle)
        
        let separatorView = UIView()
        separatorView.backgroundColor = D.Colors.standartTextWithAlpha
        view.addSubview(separatorView)
        
        view.snp.makeConstraints {
            $0.height.equalTo(80).priority(.low)
            $0.edges.equalToSuperview().inset(8)
        }
        
        dateSourceSV.snp.makeConstraints {
            $0.top.bottom.equalToSuperview().inset(8)
            $0.leading.equalToSuperview().inset(20)
            $0.trailing.equalTo(profitTitle.snp.leading).inset(-20)
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
