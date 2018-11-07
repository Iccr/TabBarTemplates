//
//  RealmPersistanceType.swift
//  TabController
//
//  Created by gme_2 on 07/11/2018.
//  Copyright © 2018 ccr. All rights reserved.
//

import Foundation
import RealmSwift

protocol RealmPersistenceType {
    var realmObject: Realm {get}
    
    func save(models: [Object])
    
    func deleteAll<T: Object>(ofType: T.Type)
    
    func fetch<T: Object>() -> [T]
    
    func fetch<T: Object>(primaryKey: Any) -> T?
    
    func changeModels(action: ()->())
    
    func delete(models: [Object])
    
    func deleteAll()
    
}

extension RealmPersistenceType {
    var realmObject: Realm {
        return realm
    }
    
    func save(models: [Object]) {
        try! self.realmObject.write {
            realmObject.add(models, update: true)
        }
    }
    
    func deleteAll() {
        try! realmObject.write {
            realm.deleteAll()
        }
    }
    
    func deleteAll<T: Object>(ofType: T.Type) {
        let objects: [T] = self.fetch()
        
        realmObject.beginWrite()
        do {
            realmObject.delete(objects)
            try realmObject.commitWrite()
        } catch {
            if realmObject.isInWriteTransaction { realmObject.cancelWrite() }
        }
    }
    
    func fetch<T: Object>() -> [T] {
        let values = realmObject.objects(T.self)
        return Array(values)
    }
    
    func fetch<T: Object>(filter: String) -> [T] {
        let values = realmObject.objects(T.self).filter(filter)
        return Array(values)
    }
    
    func fetch<T: Object>(predicates: [NSPredicate] = [], filters: [String] = []) -> [T] {
        var values = predicates.reduce(realmObject.objects(T.self)) { (result, predicate) in
            return result.filter(predicate)
        }
        values = filters.reduce(values) { (result, filter) in
            return result.filter(filter)
        }
        return Array(values)
    }
    
    func fetch<T: Object>(primaryKey: Any) -> T? {
        return realmObject.object(ofType: T.self, forPrimaryKey: primaryKey)
    }
    
    func changeModels(action: ()->()) {
        realmObject.beginWrite()
        do {
            action()
            try realmObject.commitWrite()
        } catch {
            if realmObject.isInWriteTransaction { realmObject.cancelWrite() }
        }
    }
    
    func delete(models: [Object]) {
        self.changeModels {
            realmObject.delete(models)
        }
    }
}

private let realm = try! Realm()
