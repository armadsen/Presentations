//
//  Person.swift
//  HeroesAndVillains
//
//  Created by Andrew Madsen on 4/13/16.
//  Copyright © 2016 Open Reel Software. All rights reserved.
//

import Cocoa

protocol Person {
	var name: String? { get set }
	var image: NSImage? { get set }
}

class Hero: NSObject, Person {
	override init() {
		super.init()
	}
	
	init(name: String, imageName: String? = nil) {
		self.name = name
		if let imageName = imageName, image = NSImage(named: imageName) {
			self.image = image
		}
	}
	dynamic var name: String? = nil
	dynamic var image: NSImage? = nil
}

class Villain: NSObject, Person {
	override init() {
		super.init()
	}
	
	init(name: String, imageName: String? = nil, infamyReasons: String? = nil) {
		self.name = name
		if let imageName = imageName {
			self.image = NSImage(named: imageName)
		}
		self.infamyReasons = infamyReasons
	}
	dynamic var name: String? = nil
	dynamic var image: NSImage? = nil
	dynamic var infamyReasons: String? = nil
}

func dummyHeroes() -> [Hero] {
	return [Hero(name: "Steve Jobs", imageName: "Steve"),
			Hero(name: "Steve Wozniak", imageName: "Woz")]
}

func dummyVillains() -> [Villain] {
	return [Villain(name: "Steve Ballmer", imageName: "Ballmer", infamyReasons: "Throwing chairs")]
}