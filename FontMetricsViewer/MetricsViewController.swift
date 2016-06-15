//
//  MetricsViewController.swift
//  FontMetricsViewer
//
//  Created by akio0911 on 2016/06/15.
//  Copyright © 2016年 akio0911. All rights reserved.
//

import UIKit

class MetricsViewController: UIViewController {

    var font = UIFont.systemFontOfSize(UIFont.systemFontSize())
    var fontName = UIFont.systemFontOfSize(UIFont.systemFontSize()).fontName
    var fontSize = UIFont.systemFontSize()

    @IBOutlet weak var fontNameLabel: UILabel!

    @IBOutlet weak var fontSizeTextField: UITextField!

    @IBOutlet weak var ascenderLabel: UILabel!

    @IBOutlet weak var descenderLabel: UILabel!

    @IBOutlet weak var leadingLabel: UILabel!

    @IBOutlet weak var capHeightlabel: UILabel!

    @IBOutlet weak var xHeightLabel: UILabel!

    @IBOutlet weak var lineHeightLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        updateMetricsLabels(font: self.font)
        updateFontSizeTextField(fontSize: self.fontSize)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func pressApplyButton(sender: AnyObject) {
        guard let text = fontSizeTextField.text else { return }
        guard let fontSize = Float(text) else { return }
        guard let font = UIFont(name: fontName, size: CGFloat(fontSize)) else { return }

        self.font = font
        self.fontSize = CGFloat(fontSize)

        updateMetricsLabels(font: font)

        fontSizeTextField.resignFirstResponder()
    }

    private func updateMetricsLabels(font font: UIFont) {
        fontNameLabel  .text = font.fontName
        ascenderLabel  .text = String(font.ascender)
        descenderLabel .text = String(font.descender)
        leadingLabel   .text = String(font.leading)
        capHeightlabel .text = String(font.capHeight)
        xHeightLabel   .text = String(font.xHeight)
        lineHeightLabel.text = String(font.lineHeight)
    }

    private func updateFontSizeTextField(fontSize fontSize: CGFloat) {
        fontSizeTextField.text = String(fontSize)
    }

    @IBAction func exitFromFontTableViewControllerBySelect(segue: UIStoryboardSegue) {

        guard let fontVC = segue.sourceViewController as? FontTableViewController else { return }

        guard let fontName = fontVC.selectedFontName else { return }

        self.fontName = fontName

        guard let font = UIFont(name: self.fontName, size: fontSize) else { return }

        self.font = font

        updateMetricsLabels(font: self.font)
    }

    @IBAction func exitFromFontTableViewControllerByClose(segue: UIStoryboardSegue) {
        // do nothing
    }
}
