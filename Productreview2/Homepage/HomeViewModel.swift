import UIKit

struct HomeViewModel {
	
	func manageRow() -> Int {
		return storeProduct().count + 1
	}
	
	func storeProduct() -> [Product] {
		return Store.default.get()
	}
}
