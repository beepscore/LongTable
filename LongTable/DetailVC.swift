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

    // MARK: - view lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        // DetailVC has an embed segue to ContainerVC, so iOS calls prepare for segue
        // order of execution:
        // DetailVC.prepare(for segue: sender:)
        // ContainerVC.viewDidLoad
        // DetailVC.viewDidLoad

        // Set containerVC.item in DetailVC prepare for segue, not in DetailVC viewDidLoad
        // This way containerVC initial view will show text.

        let containerVC = segue.destination as? ContainerVC
        containerVC?.item = item
    }

}
