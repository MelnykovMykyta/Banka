//
//  DBService.swift
//  Banka
//
//  Created by Nikita Melnikov on 27.02.2024.
//

import Foundation
import RealmSwift

class DBService {
    
    private let realm = try! Realm()
    
    func addObject<T: Object>(object: T) {
        try! realm.write {
            realm.add(object, update: .modified)
        }
    }
    
    func getObjects<T: Object>(_ objectType: T.Type) -> [T] {
        let objects = realm.objects(objectType)
        return Array(objects)
    }
    
    func removeObject<T: Object>(_ object: T) {
        try! realm.write {
            realm.delete(object)
        }
    }
}
