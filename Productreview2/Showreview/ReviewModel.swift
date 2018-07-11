
import UIKit

struct ReviewModel {
	
	func manageRow() -> Int {
		return storeProduct().count + 1
	}
	
	func storeProduct() -> [Product] {
		let products = Store.default.get()
		
		return Store.default.get()
	}
}
