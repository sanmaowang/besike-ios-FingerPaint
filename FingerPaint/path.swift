//
//  Path.swift
//  FingerPaint
//
//  Created by Sanmao on 14-11-5.
//  Copyright (c) 2014年 Sanmao. All rights reserved.
//

import UIKit

class Path{

    var points:[CGPoint] = []
    let color: UIColor
    init(color: UIColor){
        self.color = color
    }
    
    func add(point:CGPoint){
        points.append(point)
    }

}
