//
//  DetailVC.swift
//  LongTable
//
//  Created by Steve Baker on 8/2/17.
//  Copyright © 2017 Beepscore LLC. All rights reserved.
//

import UIKit

class DetailVC: UIViewController {

    var item: Item?

    @IBOutlet weak var nameLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        nameLabel.text = item?.name
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
