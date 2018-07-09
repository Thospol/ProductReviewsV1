
import UIKit
class Product {
	var product: String
	var photo: UIImage?
	var desc: String
	var price: Int
	var reviewProduct: [ReviewProduct] = []
	var likes = 0
	var fairs = 0
	var bads = 0
	
	init(product: String, photo: UIImage?, desc: String,price: Int) {
		self.product = product
		self.photo = photo
		self.desc = desc
		self.price = price
	}
	func manageRank() {
		likes = 0
		fairs = 0
		bads = 0
		reviewProduct.forEach { (reviewProduct) in
			switch reviewProduct.reviewIcon! {
			case .like: likes += 1
			case .fair: fairs += 1
			case .bad: bads += 1
			}
		}
		
	}
}

struct UserModel {
	static var product = [Product].init()
}
