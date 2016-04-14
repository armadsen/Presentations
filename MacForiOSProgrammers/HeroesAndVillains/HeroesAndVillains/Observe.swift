//
//  Observe.swift
//  MixedInKey
//
//  Created by Andrew Madsen on 12/16/15.
//  Copyright © 2015 Mixed In Key LLC. All rights reserved.
//

import Foundation

protocol KVOAble: NSObjectProtocol {
	func addObserver(observer: NSObject, forKeyPath keyPath: String, options: NSKeyValueObservingOptions, context: UnsafeMutablePointer<Void>)
	func removeObserver(observer: NSObject, forKeyPath keyPath: String, context: UnsafeMutablePointer<Void>)
}

extension NSObject: KVOAble {}

class Observe : NSObject {
	
	init(_ objectToObserve: KVOAble, keyPath: String, options: NSKeyValueObservingOptions = [], observationBlock: AnyObject? -> Void) {
		self.objectToObserve = objectToObserve
		self.keyPath = keyPath
		self.observationBlock = observationBlock
		
		super.init()
		
		objectToObserve.addObserver(self, forKeyPath: keyPath, options: options, context: &KVOContext)
	}
	
	deinit {
		self.objectToObserve.removeObserver(self, forKeyPath: self.keyPath, context: &KVOContext)
	}
	
	override func observeValueForKeyPath(keyPath: String?, ofObject object: AnyObject?, change: [String : AnyObject]?, context: UnsafeMutablePointer<Void>) {
		guard let keyPath = keyPath, object = object else { return }
		
		// Make sure the notification is intended for us, and not a superclass
		if context != &KVOContext {
			super.observeValueForKeyPath(keyPath, ofObject: object, change: change, context: context)
			return
		}
		
		let newValue = object.valueForKeyPath(keyPath)
		self.observationBlock(newValue)
	}
	
	let objectToObserve: KVOAble
	let keyPath: String
	let observationBlock: AnyObject? -> Void
	
	private var KVOContext = 1
}