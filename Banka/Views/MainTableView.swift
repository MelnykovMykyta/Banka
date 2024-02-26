//
//  MainTableView.swift
//  Banka
//
//  Created by Nikita Melnikov on 26.02.2024.
//

import Foundation
import UIKit

class MainTableView: UITableView {
    
    private let cell = "MainTVC"
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        dataSource = self
        delegate = self
        register(MainTVC.self, forCellReuseIdentifier: cell)
        allowsSelection = false
        separatorStyle = .none
        showsVerticalScrollIndicator = false
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}

extension MainTableView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 30
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = dequeueReusableCell(withIdentifier: cell) as? MainTVC else {
            return UITableViewCell()
        }
        
        cell.profitTitle.text = " + 2000 $"
        cell.dateLabel.text = "13.02.2024"
        return cell
    }
}
