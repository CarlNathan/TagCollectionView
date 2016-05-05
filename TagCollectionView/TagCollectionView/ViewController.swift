//
//  ViewController.swift
//  TagCollectionView
//
//  Created by Carl Udren on 5/5/16.
//  Copyright © 2016 Carl Udren. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let colletionview = TagCollectionView(frame: view.frame)
        colletionview.tags = ["first Tag", "Second Tag", "ThirdTag", "FourthTag", "Fifth Tag","first Tag", "Second Tag", "ThirdTag", "FourthTag", "Fifth Tag"]
        view.addSubview(colletionview)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

