//
//  Product.swift
//  Productreview2
//
//  Created by thospol on 30/6/61.
//  Copyright © พ.ศ. 2561 thospol. All rights reserved.
//

import UIKit
class Product {
	var product: String
	var photo: UIImage?
	var desc: String
	var price: Int
	var reviewProduct: [ReviewProduct] = []
	var veryGoods = 0
	var goods = 0
	var bads = 0
	
	init(product: String, photo: UIImage?, desc: String,price: Int) {
		self.product = product
		self.photo = photo
		self.desc = desc
		self.price = price
	}
	
	func manageRank() {
		veryGoods = 0
		goods = 0
		bads = 0
		reviewProduct.forEach { (reviewProduct) in
			switch reviewProduct.RIcon! {
			case .veryGood: veryGoods += 1
			case .good: goods += 1
			case .bad: bads += 1
			}
		}
		
	}
}


struct UserModel {
	static var product = [Product].init()
}
