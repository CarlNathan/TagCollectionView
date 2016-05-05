//
//  TagCollectionViewCell.swift
//  TagCollectionView
//
//  Created by Carl Udren on 5/5/16.
//  Copyright © 2016 Carl Udren. All rights reserved.
//

import Foundation
import UIKit

public struct TagCellLayoutParameters {
    public static let Padding = CGFloat(10)
}



class TagCollectionViewCell: UICollectionViewCell {
    
    let tagLabel = UILabel()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        prepareCell()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        prepareCell()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func prepareCell() {
        backgroundColor = UIColor.grayColor()
        layer.cornerRadius = 10
        layer.masksToBounds = true
        addSubview(tagLabel)
        layoutSubviews()
    }
    
    override func layoutSubviews() {
        layoutTagLabel()
        updateCellSize()
    }
    
    func layoutTagLabel() {
        tagLabel.frame = CGRect(x: TagCellLayoutParameters.Padding, y: TagCellLayoutParameters.Padding, width: bounds.width + 2*TagCellLayoutParameters.Padding, height: bounds.width + 2*TagCellLayoutParameters.Padding)
        tagLabel.sizeToFit()
    }
    
    func updateCellSize() {
        let oldFrame = frame
        let height = CGRectGetMaxY(tagLabel.frame) + TagCellLayoutParameters.Padding
        let width = CGRectGetMaxX(tagLabel.frame) + TagCellLayoutParameters.Padding
        frame = CGRect(x: oldFrame.origin.x, y: oldFrame.origin.y, width: width, height: height)
        print(frame.size)
    }
}


