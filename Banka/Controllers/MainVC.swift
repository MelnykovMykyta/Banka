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
    private var todayCountLable: UILabel!
    private var todayProfit: UILabel!
    private var svContLabels: UIStackView!
    private var monthProfit: ProfitLabel!
    private var yesterdayProfit: ProfitLabel!
    private var buttonsSV: UIStackView!
    private var addProfitBtnView: UIView!
    private var calendarBtnView: UIView!
    private var addProfitButton: UIButton!
    private var calendarButton: UIButton!
    private var tableView: MainTableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        tableView.delegate = self
    }
    
    override func viewWillLayoutSubviews() {
        [addProfitBtnView, calendarBtnView].forEach { elem in
            elem.layer.cornerRadius = elem.frame.height / 2
            elem.layer.masksToBounds = true
        }
    }
}

private extension MainVC {
    
    func setupView() {
        view.backgroundColor = D.Colors.mainBackgroundColor
        
        infoView = UIView()
        infoView.backgroundColor = D.Colors.mainBackgroundColor
        view.addSubview(infoView)
        
        todayCountLable = UILabel()
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
        
        buttonsSV = UIStackView()
        buttonsSV.axis = .horizontal
        buttonsSV.spacing = 40
        view.addSubview(buttonsSV)
        
        addProfitBtnView = UIView()
        calendarBtnView = UIView()
        [addProfitBtnView,calendarBtnView].forEach { elem in
            elem.backgroundColor = .gray
            buttonsSV.addArrangedSubview(elem)
        }
        
        addProfitButton = UIButton(type: .system)
        addProfitButton.setImage(UIImage(systemName: "plus"), for: .normal)
        addProfitButton.tintColor = D.Colors.standartTextWithAlpha
        addProfitBtnView.addSubview(addProfitButton)
        
        calendarButton = UIButton(type: .system)
        calendarButton.setImage(UIImage(systemName: "calendar"), for: .normal)
        calendarButton.tintColor = D.Colors.standartTextWithAlpha
        calendarBtnView.addSubview(calendarButton)
        
        tableView = MainTableView()
        view.addSubview(tableView)
        
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
        
        buttonsSV.snp.makeConstraints {
            $0.top.equalTo(infoView.snp.bottom).inset(-20)
            $0.centerX.equalToSuperview()
        }
        
        addProfitBtnView.snp.makeConstraints { $0.size.equalTo(80) }
        
        addProfitButton.snp.makeConstraints { $0.edges.equalToSuperview() }
        
        calendarBtnView.snp.makeConstraints { $0.size.equalTo(80) }
        
        calendarButton.snp.makeConstraints { $0.edges.equalToSuperview() }
        
        tableView.snp.makeConstraints {
            $0.top.equalTo(buttonsSV.snp.bottom).inset(-20)
            $0.leading.trailing.bottom.equalToSuperview()
        }
    }
}

extension MainVC: UIScrollViewDelegate, UITableViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offset = scrollView.contentOffset.y
        let minOffset: CGFloat = 0
        let maxOffset: CGFloat = 50
        let limitedOffset = max(minOffset, min(maxOffset, offset))
        let alpha = 1 - (limitedOffset * 2) / maxOffset
        
        svContLabels.alpha = alpha
        
        UIView.animate(withDuration: 0.2) {
            self.todayCountLable.snp.updateConstraints {
                $0.top.equalToSuperview().inset(-limitedOffset)
            }
            
            self.svContLabels.snp.updateConstraints {
                $0.bottom.equalToSuperview().offset(limitedOffset)
            }
            self.view.layoutIfNeeded()
        }
    }
}
