//
//  TagCollectionView.swift
//  TagCollectionView
//
//  Created by Carl Udren on 5/5/16.
//  Copyright © 2016 Carl Udren. All rights reserved.
//

import Foundation
import UIKit

class TagCollectionView: UICollectionView {
    
    var tags = [String]()
    
    
     init(frame: CGRect) {
        super.init(frame: frame, collectionViewLayout: TagCollectionViewFlowLayout())
        dataSource = self
        delegate = self
        let layout = collectionViewLayout as! TagCollectionViewFlowLayout
        layout.delegate = self
        registerClass(TagCollectionViewCell.self, forCellWithReuseIdentifier: "TagCell")
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension TagCollectionView: UICollectionViewDataSource {
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tags.count
    }
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = dequeueReusableCellWithReuseIdentifier("TagCell", forIndexPath: indexPath) as! TagCollectionViewCell
        cell.tagLabel.text = tags[indexPath.row]
        return cell
    }
}

extension TagCollectionView: UICollectionViewDelegate {
    
}

extension TagCollectionView: TagCollectionViewDynamicLayoutDelegate {
    func sizeForCellAtIndexPath(itemInSection: Int) -> CGSize {
        let cell = TagCollectionViewCell(frame: CGRect(x: 1, y: 1, width: 1, height: 1))
        cell.tagLabel.text = tags[itemInSection]
        cell.layoutSubviews()
        return cell.frame.size
    }
}

