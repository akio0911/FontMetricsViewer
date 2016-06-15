//
//  FontTableViewController.swift
//  FontMetricsViewer
//
//  Created by akio0911 on 2016/06/15.
//  Copyright © 2016年 akio0911. All rights reserved.
//

import UIKit

class FontTableViewController: UITableViewController {

    var fontNames: [String] = []

    var selectedFontName: String? = nil

    override func viewDidLoad() {
        super.viewDidLoad()

        fontNames = makeFontNames()
    }

    private func makeFontNames() -> [String] {
        var result: [String] = []

        for familyName in UIFont.familyNames() {
            for fontName in UIFont.fontNamesForFamilyName(familyName) {
                result.append(fontName)
            }
        }

        return result
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fontNames.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)

        let fontName = fontNames[indexPath.row]
        cell.textLabel?.text = fontName
        cell.textLabel?.font = UIFont(name: fontName, size: UIFont.labelFontSize())

        return cell
    }

    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        selectedFontName = fontNames[indexPath.row]
        performSegueWithIdentifier("BySelect", sender: self)
    }
}
