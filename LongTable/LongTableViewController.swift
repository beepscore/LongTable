//
//  LongTableViewController.swift
//  LongTable
//
//  Created by Steve Baker on 7/22/17.
//  Copyright © 2017 Beepscore LLC. All rights reserved.
//

import UIKit

class LongTableViewController: UITableViewController {

    var items = [Item]()

    override func viewDidLoad() {
        super.viewDidLoad()

        populateItems()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    func populateItems() {
        for index in 0..<10000 {
            var newItem = Item()
            newItem.name = "joe" + String(describing: index)
            newItem.note = "hi"
            items.append(newItem)
        }
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! ItemCell

        cell.nameLabel.text = items[indexPath.row].name
        cell.noteField.text = items[indexPath.row].note

        // use tag to enable textField delegate methods to know row
        cell.noteField.tag = indexPath.row

        return cell
    }

}

// MARK: - UITextFieldDelegate
extension LongTableViewController: UITextFieldDelegate {

    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        return true
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        items[textField.tag].note = textField.text

        // dismiss keyboard
        textField.resignFirstResponder()

        return true
}

//    func textFieldDidEndEditing(_ textField: UITextField) {
//    }

}
