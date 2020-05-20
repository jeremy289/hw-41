//
//  GoodsRow.swift
//  hw-4
//
//  Created by User20 on 2020/5/20.
//  Copyright © 2020 00657110. All rights reserved.
//

import SwiftUI

struct GoodsRow: View {
    
    var goods:Goods
    
    var body: some View {
        
        HStack{
            VStack{
            Text("Name:"+goods.name)
            Text("Number:"+String(goods.number))
            }
            Spacer()
            VStack{
                Text("Total Shoot:"+String(goods.total))
                Text("Total hit:"+String(goods.soldout))
                
            }
            DonutChart(stop: CGFloat(Double(goods.soldout)/Double(goods.total)))
           
            
            
        }//.background(Color.blue)
    }
}

struct GoodsRow_Previews: PreviewProvider {
    static var previews: some View {
        GoodsRow(goods:Goods(name:"pencil",number:15,total:200,soldout:10))
    }
}
