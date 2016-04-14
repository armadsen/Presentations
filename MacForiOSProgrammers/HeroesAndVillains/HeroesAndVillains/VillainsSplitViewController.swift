//
//  VillainsSplitViewController.swift
//  HeroesAndVillains
//
//  Created by Andrew Madsen on 4/13/16.
//  Copyright © 2016 Open Reel Software. All rights reserved.
//

import Cocoa

class VillainsSplitViewController: NSSplitViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
		
		if let listVC = splitViewItems.first?.viewController as? VillainsTableViewController,
			detailVC = splitViewItems.last?.viewController {
			listVC.detailViewController = detailVC
		}
    }
    
}
