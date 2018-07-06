import UIKit

@IBDesignable
class ProductDetailXibView: BaseXibView {
	
	@IBOutlet var contentView: UIView!
	@IBOutlet weak var productImage: UIImageView!
	@IBOutlet weak var productName: UILabel!
	@IBOutlet weak var productPrice: UILabel!
	@IBOutlet weak var productDetail: UITextView!
	func setup(product: Product) {
		productName.text = product.product
		productImage.image = product.photo
		productDetail.text = product.desc
		productPrice.text = String(product.price)
		
	}
	
}
