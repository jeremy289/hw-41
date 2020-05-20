//
//  GoodsData.swift
//  hw-4
//
//  Created by User20 on 2020/5/20.
//  Copyright © 2020 00657110. All rights reserved.
//

import Foundation

class GoodsData:ObservableObject{
    
    @Published var goods=[Goods](){
        didSet {
            let encoder = JSONEncoder()
            if let data = try? encoder.encode(goods) {
                UserDefaults.standard.set(data, forKey: "goods")
            }
        }
    }
    
    init() {
        if let data = UserDefaults.standard.data(forKey: "goods") {
            let decoder = JSONDecoder()
            if let decodedData = try? decoder.decode([Goods].self, from: data) {
                goods = decodedData
            }
        }
    }
    
}
