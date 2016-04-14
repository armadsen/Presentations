//
//  VillainsTableViewController.swift
//  HeroesAndVillains
//
//  Created by Andrew Madsen on 4/13/16.
//  Copyright © 2016 Open Reel Software. All rights reserved.
//

import Cocoa

class VillainsTableViewController: NSViewController {
	
    override func viewDidLoad() {
        super.viewDidLoad()

		villainsController.content = NSMutableArray(array: dummyVillains())
		selectionObserver = Observe(villainsController, keyPath: "selectedObjects") { [weak self] (_) in
			self?.updateSelection()
		}
	}
	
	private func updateSelection() {
		detailViewController?.representedObject = villainsController.selectedObjects.first
	}
	
	var detailViewController: NSViewController? {
		didSet { updateSelection() }
	}
	
	@IBOutlet var villainsController: NSArrayController!
	var selectionObserver: Observe?
}
