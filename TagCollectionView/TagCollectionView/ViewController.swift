//
//  ViewController.swift
//  TagCollectionView
//
//  Created by Carl Udren on 5/5/16.
//  Copyright © 2016 Carl Udren. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var collectionView: TagCollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        collectionView = TagCollectionView(frame: view.frame)
        collectionView.tags = ["first Tag", "Second Tag", "ThirdTag", "FourthTag", "Fifth Tag","first Tag", "Second Tag", "ThirdTag", "FourthTag", "Fifth Tag"]
        view.addSubview(collectionView)
    }
    
    override func viewDidLayoutSubviews() {
        collectionView.frame = view.frame
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

