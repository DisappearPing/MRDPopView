//
//  Pop.swift
//  UIWindowTest
//
//  Created by disappearping on 2015/9/30.
//  Copyright © 2015年 disappear. All rights reserved.
//

import UIKit

class PopUpView: UIView {

private var beginPoint = CGPointZero
private var currentPoint = CGPointZero
private var endPoint = CGPointZero
 
    var FirstLineProportion: CGFloat = 2/3
    
//    var FirstLineProportion: CGFloat = 0{
//        didSet{
//            self.frame.size.height - (self.superview?.frame.size.height)!
//        }
//    }
    
    var SecondLineProportion: CGFloat = 5/6
    
//    var SecondLineProportion: CGFloat = 0{
//        didSet{
//          self.frame.origin.y - (self.superview?.frame.origin.y)!
//        }
//    }
    
    var tapRec = UITapGestureRecognizer()
    var Btn = UIButton()
   
    //MARK: -
    
    init(frame: CGRect,firstProportion: CGFloat,secondProportion: CGFloat) {
        super.init(frame: frame)
        self.FirstLineProportion = firstProportion
        self.SecondLineProportion = secondProportion
//        self.addGestureRecognizer(tapRec)
//        tapRec.addTarget(self, action: "UpOrDown:")
        
        let bounds = UIScreen.mainScreen().bounds
        
        let theSmallView = (1 - secondProportion) * bounds.height
        let theBtnSize = theSmallView - 2.0
        
        print("theSmallView = \(theSmallView)")
        
        Btn  = UIButton(type: UIButtonType.Custom)
        Btn.frame = CGRectMake((frame.width / 2) - 12, 1,theBtnSize,theBtnSize )
        Btn.layer.cornerRadius = theBtnSize / 2
        
        Btn.backgroundColor = UIColor.whiteColor()
        Btn.alpha = 0.70
        Btn.addTarget(self, action: "UpOrDown:", forControlEvents: UIControlEvents.TouchUpInside)
        Btn.setImage(UIImage(named:"ic_expand_up" ), forState: UIControlState.Normal)
        self.addSubview(Btn)
    }

    required init?(coder aDecoder: NSCoder) {
       super.init(coder: aDecoder)!
    }
    
    func UpOrDown(sender: UIButton){
        print("UpOrDown")
        print("self.superview?.height = \(self.superview?.height)")
//        let tapPoint = sender.locationInView(self.superview)
        
        if self.y >= (self.superview?.height)! * SecondLineProportion {
            print("first")
            UIView.animateWithDuration(0.3, animations: { () -> Void in
                print("self.superview?.height = \(self.superview?.height)")
                self.y = (self.superview?.height)! * self.FirstLineProportion
                print("self.y \(self.y)")
                sender.setImage(UIImage(named: "ic_expand_down"), forState: UIControlState.Normal)
            })
        }else{
            print("else")
            UIView.animateWithDuration(0.3, animations: { () -> Void in
                print("self.superview?.height = \(self.superview?.height)")
                self.y = (self.superview?.height)! * self.SecondLineProportion
                print("self.y \(self.y)")
                 sender.setImage(UIImage(named: "ic_expand_up"), forState: UIControlState.Normal)
            })
            
        }
    }
    
    
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        print("touch begin")
        
        if let touch = touches.first {
           beginPoint = touch.locationInView(self.superview)
//            if beginPoint.y >= (self.superview?.height)! * SecondLineProportion! {
//                print("first")
//                UIView.animateWithDuration(0.3, animations: { () -> Void in
//                    print("self.superview?.height = \(self.superview?.height)")
//                    self.y = (self.superview?.height)! * self.FirstLineProportion!
//                    print("self.y \(self.y)")
//                })
//            }else{
//                print("else")
//                UIView.animateWithDuration(0.3, animations: { () -> Void in
//                    print("self.superview?.height = \(self.superview?.height)")
//                    self.y = (self.superview?.height)! * self.SecondLineProportion!
//                    print("self.y \(self.y)")
//                })
//                
//            }

        }
        
    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        print("touch move")
        if let touch = touches.first {
            currentPoint = touch.locationInView(self.superview)
            if (currentPoint.y <= (self.superview?.height)! * FirstLineProportion) {
            self.y = (self.superview?.height)! * FirstLineProportion
            }else{
            self.y = currentPoint.y
            }
        }
    }
    
    override func touchesCancelled(touches: Set<UITouch>?, withEvent event: UIEvent?) {
        print("touch cancel")
//        self.y = (self.superview?.height)! * SecondLineProportion!
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        print("touch end")
        if let touch = touches.first{
            endPoint = touch.locationInView(self.superview)
        }
        if endPoint.y <= (self.superview?.height)! * SecondLineProportion {
            UIView.animateWithDuration(0.3, animations: { () -> Void in
                self.y = (self.superview?.height)! * self.FirstLineProportion
                self.Btn.setImage(UIImage(named: "ic_expand_down"), forState: UIControlState.Normal)
            })
        }else{
            UIView.animateWithDuration(0.3, animations: { () -> Void in
                self.y = (self.superview?.height)! * self.SecondLineProportion
                 self.Btn.setImage(UIImage(named: "ic_expand_up"), forState: UIControlState.Normal)
            })
 
        }
        
        
    }
    

}
