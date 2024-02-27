//
//  MainTableView.swift
//  Banka
//
//  Created by Nikita Melnikov on 26.02.2024.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa

class MainTableView: UITableView {
    
    private let cell = "MainTVC"
    private let viewModel = ProfitViewModel()
    private let disposeBag = DisposeBag()
    private var profitItems: [ProfitItem] = []
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        dataSource = self
        delegate = self
        register(MainTVC.self, forCellReuseIdentifier: cell)
        allowsSelection = false
        separatorStyle = .none
        showsVerticalScrollIndicator = false
        
        profitItems = viewModel.getItems()
        viewModel.observeProfitItems().subscribe(onNext: { event in
            self.profitItems = self.viewModel.getItems()
            self.reloadData()
        }).disposed(by: disposeBag)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}

extension MainTableView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        profitItems.isEmpty ? 1 : profitItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = dequeueReusableCell(withIdentifier: cell) as? MainTVC else {
            return UITableViewCell()
        }
        
        if profitItems.isEmpty {
            cell.setupEmptyCell()
        } else {
            let item = profitItems[indexPath.row]
            cell.setupProfit(date: item.date, source: item.source, profit: item.profit)
        }
        return cell
    }
}
