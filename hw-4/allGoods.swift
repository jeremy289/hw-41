//
//  allGoods.swift
//  hw-4
//
//  Created by User20 on 2020/5/20.
//  Copyright © 2020 00657110. All rights reserved.
//

import SwiftUI

struct allGoods: View {
     var goodsData:GoodsData
       var totalSoldout=0
       var total=0
       var degrees=[0.0]
       var degreesHit=[0.0]
       var information=[" "]
       var lastCount=0.0
       var lastCountHit=0.0
       init(goodsData:GoodsData){
           self.goodsData=goodsData
           
           
           for goods in self.goodsData.goods{
               totalSoldout+=goods.soldout
               total+=goods.total
               self.information.append(goods.name)
           }
          for goods in self.goodsData.goods{
           
           degrees.append(self.lastCount+(Double(goods.total)/Double(total)*360))
           self.lastCount+=Double(goods.total)/Double(total)*360
               print(degrees)
           degreesHit.append(self.lastCountHit+(Double(goods.soldout)/Double(totalSoldout)*360))
            self.lastCountHit+=Double(goods.soldout)/Double(totalSoldout)*360
               print(degreesHit)
           }
       }
       var body: some View {
           VStack {
               Chart(count: self.goodsData.goods.count, start: degrees, information: information).frame(width:200,height:200)
               Text("商品分別佔了多少")
               Chart(count: self.goodsData.goods.count, start: degreesHit, information: information).frame(width:200,height:200)
               Text("商品分別賣出了多少")
           }
       }
}

struct allGoods_Previews: PreviewProvider {
    static var previews: some View {
        allGoods(goodsData: GoodsData())
    }
}
