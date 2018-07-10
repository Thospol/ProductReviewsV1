
import UIKit

class HomepageCollectionViewCell: UICollectionViewCell {
	@IBOutlet weak var iconPlus: UIImageView!
	@IBOutlet weak var addlabel: UILabel!
	@IBOutlet weak var productImage: UIImageView!
	@IBOutlet weak var productName: UILabel!
	@IBOutlet weak var productPrice: UILabel!
	@IBOutlet weak var productIcon: UIImageView!
	@IBOutlet weak var prodcuctNumberOfIcon: UILabel!
	@IBOutlet weak var productNumberOfReview: UILabel!
	var ImageIconValueMax: UIImage?
	
	override func awakeFromNib() {
		super.awakeFromNib()
		contentView.layer.cornerRadius = 10
		contentView.layer.borderWidth = 1.0
		contentView.layer.borderColor = UIColor.clear.cgColor
		contentView.layer.masksToBounds = true
		layer.shadowColor = UIColor.gray.cgColor
		layer.shadowOffset = CGSize(width: 0, height: 2.0)
		layer.shadowRadius = 2.0
		layer.shadowOpacity = 1.0
		layer.masksToBounds = false
		layer.shadowPath = UIBezierPath(roundedRect:bounds, cornerRadius:contentView.layer.cornerRadius).cgPath
	}
	
	func configureData(value: Product){
		productImage.image = value.productConvertToImage
		productName.text = value.product
		productPrice.text = "\(String(value.price)) ฿"
		prodcuctNumberOfIcon.text = String(value.reviewProduct.count)
		let numberOfVerygood = value.likes
		let numberOfgood = value.fairs
		let numberOfbads = value.bads
		let arraynumber = [numberOfVerygood,numberOfgood,numberOfbads]
		let x = arraynumber.max()
		if value.likes == x{
			ImageIconValueMax = UIImage(named: "verygood")
		}
		else if value.fairs == x{
			ImageIconValueMax = UIImage(named: "good")
		}
		else{
			ImageIconValueMax = UIImage(named: "bad")
		}
		productNumberOfReview.text = String(describing: x!)
		productIcon.image = ImageIconValueMax
		
	}
}
