//
//  Goods.swift
//  hw-4
//
//  Created by User20 on 2020/5/20.
//  Copyright © 2020 00657110. All rights reserved.
//

import Foundation

struct Goods:Identifiable,Codable{
    var id = UUID()
    var name:String
    var number:Int
    var total:Int
    var soldout:Int
    
   
}
