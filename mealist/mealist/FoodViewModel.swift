//
//  ViewModel.swift
//  mealist
//
//  Created by 山浦功 on 2017/12/15.
//  Copyright © 2017年 KoYamaura. All rights reserved.
//

import Foundation
import UIKit
import RealmSwift

class Food: Object {
    dynamic var id = 0
    dynamic var name = ""
    dynamic var count = 0
    dynamic var url = ""
    dynamic var note = ""
    dynamic var created = NSDate()
    
    override static func primaryKey() -> String? {
        return "id"
    }
}


final class FoodViewModel {
    var id = 0
    var name = ""
    var count = 0
    var url = ""
    var note = ""
    var created = NSDate()
    
    var description: String{
        return "\(id)" + created.description
    }
    
    static let dao = BaseModel<Food>() //Date Access Object
    
    init(_ object: Food){
        id = object.id
        name = object.name
        count = object.count
        url = object.url
        note = object.note
        created = object.created
    }
    
    static func load() -> [FoodViewModel] {
        let objects = dao.findAll()
        return objects.map{ FoodViewModel($0) }
    }
    
    static func create() -> FoodViewModel {
        let object = Food()
        object.id = dao.newId()!
        dao.add(d: object)
        return FoodViewModel(object)
    }
    
    func update() {
        let dao = type(of: self).dao
        guard let object = dao.findFirst(key: id as AnyObject) else {
            return
        }
        object.created = created
        let _ = dao.update(d: object)
    }
    
    func delete() {
        let dao = type(of: self).dao
        guard let object = dao.findFirst(key: id as AnyObject) else {
            return
        }
        dao.delete(d: object)
    }
}
