//
//  TagCollectionViewFlowLayout.swift
//  TagCollectionView
//
//  Created by Carl Udren on 5/5/16.
//  Copyright © 2016 Carl Udren. All rights reserved.
//

import Foundation
import UIKit

protocol TagCollectionViewDynamicLayoutDelegate {
    func sizeForCellAtIndexPath(itemInSection: Int) -> CGSize
}

class TagCollectionViewFlowLayout: UICollectionViewFlowLayout {
    var delegate: TagCollectionViewDynamicLayoutDelegate!
    var cellPadding: CGFloat = 5
    private var cache = [UICollectionViewLayoutAttributes]()
    private var contentHeight: CGFloat {
        if cache.count > 0 {
            let frame = cache[cache.count-1].frame
            let maxY = CGRectGetMaxY(frame) + cellPadding
            return maxY
        }
        return 0
    }
    
    override func prepareLayout() {
        if cache.isEmpty {
            var leftMargin: CGFloat = cellPadding
            var topMargin: CGFloat = cellPadding
            for item in 0 ..< collectionView!.numberOfItemsInSection(0) {
                let size = delegate.sizeForCellAtIndexPath(item)
                print(size)
                let indexPath = NSIndexPath(forItem: item, inSection: 0)

                var frame = CGRect(x: leftMargin, y: topMargin, width: size.width, height: size.height)
                
                if CGRectGetMaxX(frame) > CGRectGetMaxX(collectionView!.frame) {
                    topMargin += frame.size.height + cellPadding
                    leftMargin = cellPadding
                    frame = CGRect(x: leftMargin, y: topMargin, width: size.width, height: size.height)
                }
                
                let attributes = UICollectionViewLayoutAttributes(forCellWithIndexPath: indexPath)
                attributes.frame = frame
                cache.append(attributes)
                
                leftMargin += frame.size.width + cellPadding
            }
        }
    }
    
    override func layoutAttributesForElementsInRect(rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        
        var layoutAttributes = [UICollectionViewLayoutAttributes]()
        
        for attributes in cache {
            if CGRectIntersectsRect(attributes.frame, rect) {
                layoutAttributes.append(attributes)
            }
        }
        return layoutAttributes
    }
    

    
    override func collectionViewContentSize() -> CGSize {
        return CGSize(width: collectionView!.frame.width, height: contentHeight)
    }
}
