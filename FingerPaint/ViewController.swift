//
//  ViewController.swift
//  FingerPaint
//
//  Created by Sanmao on 14-11-3.
//  Copyright (c) 2014年 Sanmao. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var canvasView:CanvasView!
    var colorpickers:[UIButton] = []
    var clearButton:UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        let canvasView = CanvasView(frame:self.view.frame)
        self.canvasView = canvasView
        self.view.addSubview(canvasView)
        self.canvasView.backgroundColor = UIColor.whiteColor()
        setupColorPickers()
        setupClearButton()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupColorPickers() {
        // Colors for the pickers.
        let colors : [UIColor] = [
            // 0x000000
            UIColor(red: 0, green: 0, blue: 0, alpha: 1),
            // 0x17A3A5
            UIColor(red: 0x17/255.0, green: 0xA3/255.0, blue: 0xA5/255.0, alpha: 1),
            // 0x8DBF67
            UIColor(red: 0x8D/255.0, green: 0xBF/255.0, blue: 0x67/255.0, alpha: 1),
            // 0xFCCB5F
            UIColor(red: 0xFC/255.0, green: 0xCB/255.0, blue: 0x5F/255.0, alpha: 1),
            // 0xFC6E59
            UIColor(red: 0xFC/255.0, green: 0x6E/255.0, blue: 0x59/255.0, alpha: 1),
        ]
        
        
        // (x,y)
        let positions = [
            (33,43),(86,43),(138,43),(190,43),(242,43)
        ]
        
        // size
        let size = (44,44)
        
        
        for i in 0...4{
            let button = UIButton(frame: CGRect(x:positions[i].0, y:positions[i].1, width:size.0, height:size.1))
            button.backgroundColor = colors[i]
            button.addTarget(self, action: "colorPickerTapped:", forControlEvents: UIControlEvents.TouchUpInside)
            
            button.layer.shadowColor = UIColor(white: 0.4, alpha: 1).CGColor
            button.layer.shadowOffset = CGSize(width: 0, height: 0)
            button.layer.shadowRadius = 3
            button.layer.shadowOpacity = 0
            colorpickers.append(button)
            self.view.addSubview(button)
        }
    }
    
    func setupClearButton() {
        let button = UIButton.buttonWithType(UIButtonType.System) as UIButton
        self.clearButton = button
        button.frame = CGRect(x: 267, y: 518, width: 37, height: 30)
        button.setTitle("Clear", forState: UIControlState.Normal)
        button.addTarget(self, action: "clearTapped:", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(button)
    }
    
    func clearTapped(button:UIButton){
        self.canvasView.clear()
    }
    
    func colorPickerTapped(button: UIButton) {
        for btn in colorpickers {
            if(btn.layer.shadowOpacity == 1){
               btn.layer.shadowOpacity = 0
            }
        }
        button.layer.shadowOpacity = 1
        self.canvasView.currentColor = button.backgroundColor!;
    }
    
    


}

