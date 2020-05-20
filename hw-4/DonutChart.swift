//
//  DonutChart.swift
//  hw-4
//
//  Created by User20 on 2020/5/20.
//  Copyright © 2020 00657110. All rights reserved.
//

import SwiftUI

struct DonutChart: View {
    var stop:CGFloat
    var body: some View {
        ZStack{
        Circle()
            .trim(from: CGFloat(0.0),to:stop)
            .stroke(Color.green,lineWidth: 10)
          
        Circle()
        .trim(from: stop,to: CGFloat(1.0))
            .stroke(Color.red,lineWidth: 10)
            Text("賣出%").foregroundColor(Color.green)
        }.frame(width:150, height:150)
    }
}

struct DonutChart_Previews: PreviewProvider {
    static var previews: some View {
        DonutChart(stop:CGFloat(0.25))
    }
}
