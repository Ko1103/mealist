//
//  Model.swift
//  mealist
//
//  Created by 山浦功 on 2017/12/14.
//  Copyright © 2017年 KoYamaura. All rights reserved.
//

import Foundation
import RealmSwift


class Food: Object {
    dynamic var id = 0
    dynamic var name = ""
    dynamic var count = 0
    dynamic var url = ""
    dynamic var note = ""
    dynamic var deadLine = Date()
    
    override static func primaryKey() -> String? {
        return "id"
    }
}


class BaseModel <T : RealmSwift.Object> {
    let realm: Realm
    
    init() {
        try! realm = Realm()
    }
    
    /// 新規キーの発行
    ///
    /// - Returns: 新しいRealmオブジェクトの発行
    func newId() -> Int? {
        guard let key = T.primaryKey() else {
            return nil //primaryKeyの未設定
        }
        
        if let last = realm.objects(T.self).last, let lastId = last[key] as? Int {
            return lastId + 1
        }else {
            return 1
        }
    }
    
    /// 全件取得
    ///
    /// - Returns: Resultで返す
    func findAll() -> Results<T> {
        return realm.objects(T.self)
    }
    
    /// 1件目取得
    ///
    /// - Returns: すべてのオブジェクトから最初のもの
    func findFirst() -> T? {
        return findAll().first
    }
    
    /// 指定したオブジェクトの1件目
    ///
    /// - Parameter key: オブジェクト
    /// - Returns: T
    func findFirst(key: AnyObject) -> T? {
        return realm.object(ofType: T.self, forPrimaryKey: key)
    }
    
    /// 最後のレコードの取得
    ///
    /// - Returns: T
    func findLast() -> T? {
        return findAll().last
    }
    
    /// レコードの追加
    ///
    /// - Parameter d: T
    func add(d: T) {
        do {
            try realm.write {
                realm.add(d)
            }
        } catch let error as NSError {
            print(error.description)
        }
    }
    
    /// レコードの更新
    ///
    /// - Parameters:
    ///   - d: T
    ///   - block: primaryKey
    /// - Returns: 結果
    func update(d: T, block:(() -> Void)? = nil) -> Bool{
        do {
            try realm.write {
                block?()
                realm.add(d, update: true)
            }
            return true
        } catch let error as NSError {
            print(error.description)
        }
        return false
    }
    
    /// レコードの削除
    ///
    /// - Parameter d: 削除対象のモデル
    func delete(d: T){
        do {
            try realm.write {
                realm.delete(d)
            }
        } catch let error as NSError {
            print(error.description)
        }
    }
    
    /// すべてのデータを削除
    func deleteAll() {
        let objs = realm.objects(T.self)
        do {
            try realm.write {
                realm.delete(objs)
            }
        } catch let error as NSError {
            print(error.description)
        }
    }
}
