//
//  Chart.swift
//  hw-4
//
//  Created by User20 on 2020/5/20.
//  Copyright © 2020 00657110. All rights reserved.
//

import SwiftUI

struct Chart: View {
    var count:Int
    var start:[Double]
    var information:[String]
    let colors: [Color] = [.red, .yellow, .blue,.green,.orange,.pink,.gray]
    fileprivate func pie(start:Double,end:Double) -> Path {
        return Path{(path) in
            path.move(to:CGPoint(x:200, y:200))
            path.addArc(center:CGPoint(x:200, y:200),radius:100,startAngle:.degrees(start),endAngle:.degrees(end),clockwise:false)
        }
    }
    
    var body: some View {
            VStack {
                ZStack{
                    if count==1{
                            pie(start: 0,end: 360).fill(Color.red)
                    }
                    else if count==2{
                        pie(start: self.start[0],end:self.start[1]).fill(Color.red)
                        pie(start: self.start[1],end: 360).fill(Color.yellow)
                    }
                    else if count==3{
                        pie(start: self.start[0],end:self.start[1]).fill(Color.red)
                        pie(start: self.start[1],end:self.start[2]).fill(Color.yellow)
                        pie(start: self.start[2],end: 360).fill(Color.blue)
                    }
                    else if count==4{
                            pie(start: self.start[0],end:self.start[1]).fill(Color.red)
                            pie(start: self.start[1],end:self.start[2]).fill(Color.yellow)
                            pie(start: self.start[2],end:self.start[3]).fill(self.colors[2])
                            pie(start: self.start[3],end: 360).fill(self.colors[3])
                        
                    }
                    else if count==5{
                        pie(start: self.start[0],end:self.start[1]).fill(Color.red)
                        pie(start: self.start[1],end:self.start[2]).fill(Color.yellow)
                        pie(start: self.start[2],end:self.start[3]).fill(self.colors[2])
                        pie(start: self.start[3],end:self.start[4]).fill(self.colors[3])
                        pie(start: self.start[4],end: 360).fill(self.colors[4])
                    }
                    else if count==6{
                            pie(start: self.start[0],end:self.start[1]).fill(Color.red)
                            pie(start: self.start[1],end:self.start[2]).fill(Color.yellow)
                            pie(start: self.start[2],end:self.start[3]).fill(self.colors[2])
                            pie(start: self.start[3],end:self.start[4]).fill(self.colors[3])
                            pie(start: self.start[4],end:self.start[5]).fill(self.colors[4])
                            pie(start: self.start[2],end: 360).fill(self.colors[5])
                    }
                    else if count==7{
                        pie(start: self.start[0],end:self.start[1]).fill(Color.red)
                        pie(start: self.start[1],end:self.start[2]).fill(Color.yellow)
                        pie(start: self.start[2],end:self.start[3]).fill(self.colors[2])
                        pie(start: self.start[3],end:self.start[4]).fill(self.colors[3])
                        pie(start: self.start[4],end:self.start[5]).fill(self.colors[4])
                        pie(start: self.start[5],end:self.start[6]).fill(self.colors[5])
                        pie(start: self.start[6],end: 360).fill(self.colors[6])
                    }
                    else{
                        Text("Sorry,No Data!!!").foregroundColor(Color.red)
                    }
                }
                ForEach(0..<self.count) { index in
                    VStack {
                        Text(self.information[index+1])
                            .background(self.colors[index])
                    }
                    
                }
            }.frame(width:400,height:400)
        
    }
}

struct Chart_Previews: PreviewProvider {
    static var previews: some View {
        Chart(count: 3,start: [0,210,270],information:["Lee","Lin","Feng"])
    }
}
