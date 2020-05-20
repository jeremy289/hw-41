//
//  GoodsEditor.swift
//  hw-4
//
//  Created by User20 on 2020/5/20.
//  Copyright © 2020 00657110. All rights reserved.
//

import SwiftUI

struct GoodsEditor: View {
    
    @Environment(\.presentationMode) var presentationMode
    var goodsData:GoodsData
    var editGoods :Goods?
    @State private var name = ""
    @State private var number = 0
    @State private var Total = 0
    @State private var Soldout = 0
    
    var body: some View {
        Form{
            TextField("名字", text: $name)
            Stepper("Number \(number)", value: $number, in: 0...99)
            Stepper("Total \(Total)", value: $Total, in: 0...99)
            Stepper("Sold \(Soldout)", value: $Soldout, in: 0...99)
        }
        .navigationBarTitle(editGoods == nil ? "Add new goods" : "Edit Goods")
        .navigationBarItems(trailing: Button("Save") {
            let goods = Goods(name:self.name,number:self.number,total:self.Total,soldout:self.Soldout)
            if let editGoods = self.editGoods {
                let index = self.goodsData.goods.firstIndex {
                    $0.id == editGoods.id
                    }!
                self.self.goodsData.goods[index] = goods
            } else {
                self.goodsData.goods.insert(goods, at: 0)
            }
            self.presentationMode.wrappedValue.dismiss()
            
        })
            .onAppear {
                if let editGoods = self.editGoods {
                    self.name = editGoods.name
                    self.number = editGoods.number
                    self.Total = editGoods.total
                    self.Soldout = editGoods.soldout
                    
                }
        }

        
    }
}

struct GoodsEditor_Previews: PreviewProvider {
    static var previews: some View {
        GoodsEditor( goodsData: GoodsData())
    }
}
