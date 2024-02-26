//
//  String + DateFormatter.swift
//  Banka
//
//  Created by Nikita Melnikov on 26.02.2024.
//

import Foundation

extension String {
    
    func getDayAndMonth() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss Z"
        
        guard let date = dateFormatter.date(from: self) else { return "" }
        dateFormatter.dateFormat = "dd.MM"

        return dateFormatter.string(from: date)
    }
    
    func getYear() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss Z"
        
        guard let date = dateFormatter.date(from: self) else { return "" }
        dateFormatter.dateFormat = "yyyy"
        
        return dateFormatter.string(from: date)
    }
    
    func getFullDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss Z"
        
        guard let date = dateFormatter.date(from: self) else { return "" }
        dateFormatter.dateFormat = "dd.MM.yyyy"

        return dateFormatter.string(from: date)
    }
}
