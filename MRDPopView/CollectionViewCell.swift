//
//  CollectionViewCell.swift
//  MRDPopView
//
//  Created by disappearping on 2015/10/15.
//  Copyright © 2015年 disappear. All rights reserved.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
    var imageView: UIImageView!

    override init(frame: CGRect) {
        super.init(frame: frame)
        print(frame)
        imageView = UIImageView(frame: CGRectMake(0, 0, frame.size.width, frame.size.height))
        imageView.contentMode = UIViewContentMode.ScaleAspectFit
        contentView.addSubview(imageView)
    }

    required init?(coder aDecoder: NSCoder) {
         super.init(coder: aDecoder)!
    }
    
}
