//
//  CanvasView.swift
//  FingerPaint
//
//  Created by Sanmao on 14-11-3.
//  Copyright (c) 2014年 Sanmao. All rights reserved.
//

import UIKit

class CanvasView: UIView {
    
    var tempPath:Path!
    var paths: [Path] = []
    let zigzag:[(CGFloat, CGFloat)] = [(100,100),(100,150),(150,150),(150,200)]
    
    var currentColor:UIColor =  UIColor(red: 0, green: 0, blue: 0, alpha: 1){
        didSet{
            setNeedsDisplay()
        }
    };
    
    override func drawRect(rect: CGRect)
    {
        // Get the drawing context.
        let context = UIGraphicsGetCurrentContext()

        // Create the shape (a vertical line) in the context.
        CGContextBeginPath(context)

//        for i in 0..<zigzag.count-1{
//            CGContextMoveToPoint(context, zigzag[i].0, zigzag[i].1)
//            println(i)
//            CGContextAddLineToPoint(context, zigzag[i+1].0, zigzag[i+1].1)
//        }
//        CGContextSetStrokeColorWithColor(context, currentColor.CGColor)
//        CGContextStrokePath(context)
        
        for path in paths{
            let points = path.points
            for i in 0..<points.count-1{
//                println(points[i])
                CGContextMoveToPoint(context, points[i].x, points[i].y)
                CGContextAddLineToPoint(context, points[i+1].x, points[i+1].y)
            }
            CGContextSetStrokeColorWithColor(context, path.color.CGColor)
            CGContextStrokePath(context)
        }
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        tempPath = Path(color:currentColor)
        let t = touches.anyObject() as UITouch
        let point = t.locationInView(self)
        tempPath.add(point)
        paths.append(tempPath)
        println("touch point--> \(point)")
        setNeedsDisplay()
    }
    
    override func touchesMoved(touches: NSSet, withEvent event: UIEvent) {
        // TODO: Add a new touch point to the path
        let t = touches.anyObject() as UITouch
        let point = t.locationInView(self)
        tempPath.add(point)
        println("touch point--> \(point)")
        setNeedsDisplay()
        
    }
    
    override func touchesEnded(touches: NSSet, withEvent event: UIEvent) {
        // TODO: Add the end touch point
        let t = touches.anyObject() as UITouch
        let point = t.locationInView(self)
        tempPath.add(point)
        println("touch point--> \(point)")
        setNeedsDisplay()
    }
    
    func clear(){
        paths = []
        setNeedsDisplay()
    }
   
}
