//
//  UIViewExtension.swift
//  UIWindowTest
//
//  Created by disappearping on 2015/9/30.
//  Copyright © 2015年 disappear. All rights reserved.
//

import UIKit
import Foundation

extension UIView {
//MARK:- Frame
    var viewOrigin: CGPoint {
        get
        {
          return self.frame.origin
        }
        set
        {
            var newFrame = self.frame
            newFrame.origin = newValue
            self.frame = newFrame
        }
    }
    var viewSize: CGSize {
        get
        {
            return self.frame.size
        }
        set
        {
            var newFrame = self.frame
            newFrame.size = newValue
            self.frame = newFrame
        }
    }
    
//MARK:- Frame Origin
    var x: CGFloat {
        get
        {
            return self.frame.origin.x
        }
        set
        {
            var newFrame = self.frame
            newFrame.origin.x = newValue
            self.frame = newFrame
        }
    }
    var y: CGFloat {
        get
        {
            return self.frame.origin.y
        }
        set
        {
            var newFrame = self.frame
            newFrame.origin.y = newValue
            self.frame = newFrame
        }
    }
    
//MARK:-  Frame Size
    var height: CGFloat {
        get
        {
            return self.frame.size.height
        }
        set
        {
            var newFrame = self.frame
            newFrame.size.height = newValue
            self.frame = newFrame

        }
    }
    var width: CGFloat {
        get
        {
            return self.frame.size.width
        }
        set
        {
            var newFrame = self.frame
            newFrame.size.width = newValue
            self.frame = newFrame
            
        }
    }

//MARK:-  Frame Borders
    var left: CGFloat {
        get
        {
            return self.x
        }
        set
        {
            self.x = left
        }
    }
    var right: CGFloat {
        get
        {
            return self.frame.origin.x + self.frame.size.width
        }
        set
        {
             self.x = right - self.width
        }
    }
    var top: CGFloat {
        get
        {
            return self.y
        }
        set
        {
            self.y = top
        }
    }
    var bottom: CGFloat {
        get
        {
            return self.frame.origin.y + self.frame.size.height
        }
        set
        {
            self.y = bottom - self.height
        }
    }

//MARK:-  Center Point
    
    #if arch(i386) && os(iOS)
    #else
    private var center: CGPoint {
    get
    {
    return CGPointMake(self.left + self.middleX, self.top + self.middleY)
    }
    set
    {
    self.left = newValue.x - self.middleX
    self.top = newValue.y - self.middleY
    }
    }
    #endif
    
    var centerX: CGFloat{
        get
        {
           return self.center.x
        }
        set
        {
          self.center = CGPointMake(newValue, self.center.y)
        }
    }
    var centerY: CGFloat{
        get
        {
            return self.center.y
        }
        set
        {
            self.center = CGPointMake(self.center.x, newValue)
        }
    }

//MARK:-  Middle Point
    var middlePoint: CGPoint {
        get
        {
            return CGPointMake(self.middleX, self.middleY)
        }
    }
    var middleX: CGFloat {
        get
        {
             return self.width / 2
        }
    }
    var middleY: CGFloat {
        get
        {
            return self.height / 2
        }
    }
    
//MARK:-  UIView+Pop
//    func showPopUpViewWithFrame(popView: UIView,rect: CGRect) {
//        popView.frame = rect
////        popView.top = self.height
//        self.addSubview(popView)
////        UIView.animateWithDuration(0.3) { () -> Void in
////        popView.top = self.height
////        }
//    }
    
    
}