//
//  MainVC.swift
//  Banka
//
//  Created by Nikita Melnikov on 28.01.2024.
//

import Foundation
import UIKit
import SnapKit

class MainVC: UIViewController {
    
    private var infoView: UIView!
    private var todayProfit: UILabel!
    private var svContLabels: UIStackView!
    private var monthProfit: ProfitLabel!
    private var yesterdayProfit: ProfitLabel!
    private var addProfitButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
}

private extension MainVC {
    
    func setupView() {
        view.backgroundColor = D.Colors.mainBackgroundColor
        
        infoView = UIView()
        infoView.backgroundColor = D.Colors.mainBackgroundColor
        view.addSubview(infoView)
        
        let todayCountLable = UILabel()
        todayCountLable.text = D.Texts.todayProfit
        todayCountLable.font = UIFont(name: "Nexa-Light", size: 20)
        todayCountLable.textColor = D.Colors.standartTextColor
        infoView.addSubview(todayCountLable)
        
        todayProfit = UILabel()
        todayProfit.text = "+2033$"
        todayProfit.font = UIFont(name: "Nexa-Bold", size: 50)
        todayProfit.textColor = D.Colors.profitText
        infoView.addSubview(todayProfit)
        
        svContLabels = UIStackView()
        svContLabels.axis = .horizontal
        svContLabels.distribution = .fillEqually
        infoView.addSubview(svContLabels)
        
        let monthLabelsSV = LabelsStackView()
        svContLabels.addArrangedSubview(monthLabelsSV)
        
        let monthCountLabel = BaseCountLabel()
        monthCountLabel.text = D.Texts.monthProfit
        monthLabelsSV.addArrangedSubview(monthCountLabel)
        
        monthProfit = ProfitLabel()
        monthProfit.text = "33323$"
        monthLabelsSV.addArrangedSubview(monthProfit)
        
        let yesterdayLabelsSV = LabelsStackView()
        svContLabels.addArrangedSubview(yesterdayLabelsSV)
        
        let yesterdayCountLabel = BaseCountLabel()
        yesterdayCountLabel.text = D.Texts.yesterdayProfit
        yesterdayLabelsSV.addArrangedSubview(yesterdayCountLabel)
        
        yesterdayProfit = ProfitLabel()
        yesterdayProfit.text = "32$"
        yesterdayLabelsSV.addArrangedSubview(yesterdayProfit)
        
        addProfitButton = UIButton(type: .system)
        addProfitButton.setTitle("Add profit +", for: .normal)
        addProfitButton.titleLabel?.font = UIFont(name: "Nexa-Bold", size: 24)
        addProfitButton.tintColor = D.Colors.standartTextWithAlpha
        view.addSubview(addProfitButton)
        
        infoView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            $0.leading.trailing.equalToSuperview()
        }
        
        todayCountLable.snp.makeConstraints {
            $0.top.equalToSuperview().inset(20)
            $0.centerX.equalToSuperview()
        }
        
        todayProfit.snp.makeConstraints {
            $0.top.equalTo(todayCountLable.snp.bottom).inset(-20)
            $0.centerX.equalToSuperview()
        }
        
        svContLabels.snp.makeConstraints {
            $0.top.equalTo(todayProfit.snp.bottom).inset(-20)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.bottom.equalToSuperview().inset(20)
        }
        
        addProfitButton.snp.makeConstraints {
            $0.top.equalTo(infoView.snp.bottom).inset(-20)
            $0.trailing.equalToSuperview().inset(20)
        }
    }
}
