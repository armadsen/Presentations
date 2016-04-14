//
//  HeroesCollectionViewController.swift
//  HeroesAndVillains
//
//  Created by Andrew Madsen on 4/13/16.
//  Copyright © 2016 Open Reel Software. All rights reserved.
//

import Cocoa

class HeroesCollectionViewController: NSViewController, NSCollectionViewDataSource {
	
	private static let collectionViewItemIdentifier = "HeroCollectionViewItem "
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		let nib = NSNib(nibNamed: "HeroCollectionViewItem", bundle: nil)
		collectionView.registerNib(nib, forItemWithIdentifier: HeroesCollectionViewController.collectionViewItemIdentifier)
		collectionView.reloadData()
	}
	
	// MARK: NSCollectionViewDataSource
	
	func numberOfSectionsInCollectionView(collectionView: NSCollectionView) -> Int { return 1 }
	func collectionView(collectionView: NSCollectionView, numberOfItemsInSection section: Int) -> Int { return heroes.count }
	
	func collectionView(collectionView: NSCollectionView, itemForRepresentedObjectAtIndexPath indexPath: NSIndexPath) -> NSCollectionViewItem {
		let item = collectionView.makeItemWithIdentifier(HeroesCollectionViewController.collectionViewItemIdentifier, forIndexPath: indexPath)
		let hero = heroes[indexPath.item]
		item.representedObject = hero
		return item
	}
	
	dynamic var heroes = dummyHeroes() {
		didSet {
			collectionView.reloadData()
		}
	}
    
	@IBOutlet var collectionView: NSCollectionView!
}
