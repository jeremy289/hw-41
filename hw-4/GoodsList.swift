//
//  GoodsList.swift
//  hw-4
//
//  Created by User20 on 2020/5/20.
//  Copyright © 2020 00657110. All rights reserved.
//

import SwiftUI

struct GoodsList: View {
        @ObservedObject var goodsData=GoodsData()
        @State private var editGoods = false

        
        var body: some View {
            NavigationView{
                List{
                    ForEach(goodsData.goods){ (goods) in
                        NavigationLink(destination:GoodsEditor(goodsData:self.goodsData,editGoods:goods)){
                        
                                GoodsRow(goods:goods)
                            
                            
                        }
                     
                    }.onDelete { (indexSet) in
                    self.goodsData.goods.remove(atOffsets: indexSet)
                }
                NavigationLink(destination:allGoods(goodsData:self.goodsData)){
                    Text("圖表總分析").foregroundColor(Color.orange).bold()
                       
                }
            }
            .navigationBarTitle("Goods List")
                .navigationBarItems(leading: EditButton(), trailing: Button(action: {self.editGoods=true}, label: {
                    Image(systemName: "plus.circle.fill")
                    }))
                    .sheet(isPresented: $editGoods)
                    {
                        NavigationView{
                            GoodsEditor(goodsData:self.goodsData)
                        }
                        
                }
                
            }
    }
}

struct GoodsList_Previews: PreviewProvider {
    static var previews: some View {
        GoodsList()
    }
}
