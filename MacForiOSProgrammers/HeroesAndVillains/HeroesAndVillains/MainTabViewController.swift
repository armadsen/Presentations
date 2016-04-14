//
//  MainTabViewController.swift
//  HeroesAndVillains
//
//  Created by Andrew Madsen on 4/13/16.
//  Copyright © 2016 Open Reel Software. All rights reserved.
//

import Cocoa

class MainTabViewController: NSTabViewController {

	@IBAction func showHeroes(sender: AnyObject) {
		selectedTabViewItemIndex = 0
	}
	
	@IBAction func showVillains(sender: AnyObject) {
		selectedTabViewItemIndex = 1
	}
}
