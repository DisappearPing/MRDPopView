//
//  SecondViewController.swift
//  MRDPopView
//
//  Created by disappearping on 2015/10/13.
//  Copyright © 2015年 disappear. All rights reserved.
//

import UIKit
import SnapKit

class SecondViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {

    var innerCollectionView: UICollectionView!
    var imageView: UIImageView?
    var theSize: CGFloat?
    
    let icons = ["DoodleIcons-1","DoodleIcons-2","DoodleIcons-3","DoodleIcons-4","DoodleIcons-5","DoodleIcons-6","DoodleIcons-7","DoodleIcons-8","DoodleIcons-9","DoodleIcons-10","DoodleIcons-11","DoodleIcons-12","DoodleIcons-13","DoodleIcons-14","DoodleIcons-15",]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let screenBounds = UIScreen.mainScreen().bounds
        let FP : CGFloat = 19/20
//        let popview = PopUpView(frame:  CGRectMake(screenBounds.origin.x, screenBounds.origin.y + ((screenBounds.size.height) * 1/2), screenBounds.size.width, screenBounds.size.height/2), firstProportion: 1/2, secondProportion: 19/20)
        let popview = PopUpView(frame:  CGRectMake(screenBounds.origin.x, screenBounds.origin.y + ((screenBounds.size.height) * FP), screenBounds.size.width, screenBounds.size.height/5), firstProportion: 16/20, secondProportion: FP)
        
        
        popview.layer.cornerRadius = 15
        popview.clipsToBounds = true
//        popview.frame = CGRectMake(screenBounds.origin.x, screenBounds.origin.y + ((screenBounds.size.height) * 5/6), screenBounds.size.width, screenBounds.size.height/3)
        popview.backgroundColor = UIColor.whiteColor()
        popview.alpha = 0.70
        
        print(popview.alpha)
        
        let layout = UICollectionViewFlowLayout()
//        layout.sectionInset = UIEdgeInsets(top: 10, left: 10 , bottom: 0, right: 10)
        let theOffSet : CGFloat = (1 - FP) * screenBounds.height
        theSize = popview.frame.size.height - 2*theOffSet
//        layout.itemSize = CGSize(width: theSize!, height: theSize!)
        layout.scrollDirection = UICollectionViewScrollDirection.Horizontal
        
        innerCollectionView = UICollectionView(frame: CGRectMake(10, theOffSet, popview.frame.size.width - 20, popview.frame.size.height - 2*theOffSet ), collectionViewLayout: layout)
        innerCollectionView.delegate = self
        innerCollectionView.dataSource = self
//        innerCollectionView.registerClass(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        innerCollectionView.registerClass(CustomCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        innerCollectionView.backgroundColor = UIColor.clearColor()
//        innerCollectionView.backgroundColor = UIColor.darkGrayColor()
        
        innerCollectionView.layer.cornerRadius = 15
        innerCollectionView.clipsToBounds = true
        
        popview.addSubview(innerCollectionView)
//        self.view.addSubview(innerCollectionView)
        self.view.addSubview(popview)
//        popview.addSubview(innerCollectionView)
    
//        popview.snp_makeConstraints { (make) -> Void in
//            make.trailing.equalTo(self.view)
//        }
        
    }

    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 15
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath) as! CustomCollectionViewCell
        cell.backgroundColor = UIColor.blueColor()
        cell.layer.cornerRadius = cell.frame.width / 2
        cell.clipsToBounds = true
        cell.userInteractionEnabled = true
        
        print("indexPath.item = \(indexPath.item)")
        print("indexPath.row = \(indexPath.row)")
        cell.imageView.image = UIImage(named: icons[indexPath.row])

//        if let imageview = cell.imageView {
//            imageview.image = image
//        }else{
//            cell.imageView = UIImageView(frame: cell.frame)
//            cell.imageView?.image = image
        
//        }
       
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        print(indexPath)
    }
    
    // MARK: UICollectionViewDelegateFlowLayout
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
      
        
//        let sideSize = (traitCollection.horizontalSizeClass == .Compact && traitCollection.verticalSizeClass == .Regular) ?  theSize! : 2 * theSize!
    
        let theProportion = floor(collectionView.frame.width / collectionView.frame.height) - 1
        print("theProportion = \(theProportion)")
        
        let sideSize = floor(collectionView.frame.width / theProportion) * 0.7
        
        print("sideSize = \(sideSize)")
        
        return CGSize(width: sideSize, height: sideSize)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
//        print("ininder")
//        print(self.view.alpha)
//        self.view.alpha = self.view.alpha == 1 ? 0.7 : 1
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
