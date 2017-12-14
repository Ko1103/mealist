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
    dynamic var note = ""
    dynamic var deadLine = Date()
    
    override static func primaryKey() -> Int {
        return 
    }
}


class FoodViewModel {
    
    static let sharedInstance = FoodViewModel()
    
    let realm = try! Realm()
    
    let data = [Food]()
    
    private init() {
        
    }
}
