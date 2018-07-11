
import UIKit
class Product: Codable {
	var product: String = String()
	var photo: Data = Data()
	var desc: String = String()
	var price: Int = Int()
	var reviewProduct: [ReviewProduct] = []
	var likes = 0
	var fairs = 0
	var bads = 0
	
	func manageRank() {
		likes = 0
		fairs = 0
		bads = 0
		reviewProduct.forEach { (reviewProduct) in
			switch reviewProduct.reviewIcon! {
			case .like:
				likes += 1
			case .fair:
				fairs += 1
			case .bad:
				bads += 1
			}
		}
	}
	
	var productConvertToImage: UIImage? {
		return UIImage.init(data: photo)
	}
	
	static let documentDirectory = FileManager.init().urls(for: FileManager.SearchPathDirectory.documentDirectory, in: FileManager.SearchPathDomainMask.userDomainMask).first!
	static let archiveURL = documentDirectory.appendingPathComponent("Product")
	
	init() { }
	
	init(product: String, photo: UIImage?, desc: String,price: Int) {
		self.product = product
		self.photo = UIImagePNGRepresentation(photo ?? UIImage()) ?? Data.init()
		self.desc = desc
		self.price = price
	}
}

class ReviewProduct: Codable {
	var reviewIcon: ReviewRank?
	var reviewComment: String = String()
	var reviewName: String = String()
	var reviewDate: Date = Date()
	var colorButton: Data = Data()
	
	var productConvertToImageChageButton: UIImage? {
		return UIImage.init(data: colorButton)
	}
	
	init(reviewIcon: ReviewRank?,reviewComment: String,reviewName: String,reviewDate: Date,colorButton:UIImage?) {
		self.reviewIcon = reviewIcon
		self.reviewComment = reviewComment
		self.reviewName = reviewName
		self.reviewDate = reviewDate
		self.colorButton = UIImagePNGRepresentation(colorButton!) ?? Data.init()
	}
	
	var viewDate: String {
		let formatter = DateFormatter()
		formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
		let myString = formatter.string(from: reviewDate)
		let yourDate = formatter.date(from: myString)!
		formatter.dateFormat = "dd-MMM-yyyy"
		return formatter.string(from: yourDate)
	}
}

enum ReviewRank:String,Codable {
	case like
	case fair
	case bad
}




struct Store {
	static let `default` = Store.init()
	func save(by product: Product) {
		var products = Store.default.get()
		products.append(product)
		let propertyListEncoder = try! PropertyListEncoder.init().encode(products)
		NSKeyedArchiver.archiveRootObject(propertyListEncoder, toFile: Product.archiveURL.path)
	}
	
	func saveReview(by review: ReviewProduct, index: Int){
		let products = Store.default.get()
		let product = products[index]
		var productReview = product.reviewProduct
		productReview.append(review)
		product.reviewProduct = productReview
		Store.default.edit(product: product, index: index)
	}
	
	func  edit(product: Product, index: Int) {
		var list = Store.default.get()
		list[index] = product
		let propertyListEncoder = try! PropertyListEncoder.init().encode(list)
		NSKeyedArchiver.archiveRootObject(propertyListEncoder, toFile: Product.archiveURL.path)
	}
	
	func get() -> [Product] {
		let data = NSKeyedUnarchiver.unarchiveObject(withFile: Product.archiveURL.path) as? Data ?? Data.init()
		let value = try? PropertyListDecoder().decode([Product].self, from: data)
		return value ?? []
	}
	
	func clear() {
		let propertyListEncoder = try! PropertyListEncoder.init().encode([Product].init())
		NSKeyedArchiver.archiveRootObject(propertyListEncoder, toFile: Product.archiveURL.path)
	}
}



struct UserModel {
	static var product = [Product].init()
}
