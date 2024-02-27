//
//  ProfitViewModel.swift
//  Banka
//
//  Created by Nikita Melnikov on 27.02.2024.
//

import Foundation
import RealmSwift
import RxRealm
import RxCocoa
import RxSwift

class ProfitViewModel {
    
    private let realm = try! Realm()
    private let dbService = DBService()
    
    func observeProfitItems() -> Observable<[ProfitItem]> {
        return Observable.collection(from: realm.objects(ProfitItem.self))
            .map { results in
                return results
                    .toArray()
                    .sorted { $0.date < $1.date }
            }
    }
    
    func getItems() -> [ProfitItem] {
           return dbService.getObjects(ProfitItem.self)
            .sorted { $0.date < $1.date }
       }
    
    func addProfit() {
        let a = ProfitItem(profit: 21221, source: "Bank percents")
        dbService.addObject(object: a)
    }
    
}
