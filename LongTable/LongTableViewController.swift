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

    let numSections = 50

    /// activeTextField may be in any row, not necessarily the currently selected row
    var activeTextField: UITextField?

    override func viewDidLoad() {
        super.viewDidLoad()

        items = LongTableViewController.populatedItems()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return numSections
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count / numSections
    }

    override func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        var titles = [String]()
        for section in 0..<numSections {
            titles.append("\(self.tableView(tableView, numberOfRowsInSection: section) * section)")
        }
        return titles
    }

    /// - Returns: array of sample items. Always returns same size array.
    class func populatedItems() -> [Item] {
        var items = [Item]()

        for index in 0..<10000 {
            var newItem = Item()
            newItem.name = "joe" + String(describing: index)
            newItem.note = "hi"
            items.append(newItem)
        }
        return items
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! ItemCell

        let index = itemIndex(indexPath: indexPath)
        let item = items[index]

        cell.nameLabel.text = item.name
        cell.noteField.text = item.note

        // use tag to enable textField delegate methods to know row
        cell.noteField.tag = index

        // set background color for diagnostics during development
        if indexPath.section == 0 {
            cell.backgroundColor = .lightGray
        } else if indexPath.section == 1 {
            cell.backgroundColor = .yellow
        } else {
            cell.backgroundColor = .white
        }

        return cell
    }

    /// for generality, handles sections of differing lengths
    func itemIndex(indexPath: IndexPath) -> Int {

        var index: Int = 0
        if indexPath.section > 0 {
            // in previous sections, add all rows in section
            for section in 0..<indexPath.section {
                index += tableView(tableView, numberOfRowsInSection: section)
            }
        }

        // in current section, add rows up to current row
        index += indexPath.row

        return index
    }

     // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        if activeTextField != nil {
            // finish activeTextField editing, even if not in selected row
            let _ = textFieldShouldReturn(activeTextField!)
        }

        let indexPath = self.tableView.indexPathForSelectedRow!
        let index = itemIndex(indexPath: indexPath)
        let detailVC = segue.destination as? DetailVC
        detailVC?.item = items[index]
    }

}

// MARK: - UITextFieldDelegate
extension LongTableViewController: UITextFieldDelegate {

    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        activeTextField = textField
        return true
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        items[textField.tag].note = textField.text

        // dismiss keyboard
        textField.resignFirstResponder()

        return true
}

    func textFieldDidEndEditing(_ textField: UITextField) {
        activeTextField = nil
    }

}
