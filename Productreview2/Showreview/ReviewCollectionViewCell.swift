import UIKit

class ReviewCollectionViewCell: UICollectionViewCell {
	@IBOutlet weak var productNameReview: UILabel!
	@IBOutlet weak var productDateReview: UILabel!
	@IBOutlet weak var productReviewIcon: UIButton!
	@IBOutlet weak var productDescReview: UITextView!
	@IBOutlet weak var numberOfVerygood: UILabel!
	@IBOutlet weak var numberOfGood: UILabel!
	@IBOutlet weak var numberOfbad: UILabel!
	@IBOutlet weak var ImageAdd: UIImageView!
	@IBOutlet weak var addlabel: UILabel!
	
	override func awakeFromNib() {
		super.awakeFromNib()
		contentView.layer.cornerRadius = 10
		contentView.layer.borderWidth = 1.0
		contentView.layer.borderColor = UIColor.clear.cgColor
		contentView.layer.masksToBounds = true
		layer.shadowColor = UIColor.lightGray.cgColor
		layer.shadowOffset = CGSize(width: 0, height: 2.0)
		layer.shadowRadius = 2.0
		layer.shadowOpacity = 1.0
		layer.masksToBounds = false
		layer.shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius:contentView.layer.cornerRadius).cgPath
	}
	func configureWith(value: ReviewProduct) {
		productNameReview.text = value.RName
		productDateReview.text = value.viewDate
		productDescReview.text = value.RComment
		productReviewIcon.setBackgroundImage(value.colorButton, for: .normal)
	}
	func configureWithHeader(value: Product) {
		numberOfVerygood.text = String(value.veryGoods)
		numberOfGood.text = String(value.goods)
		numberOfbad.text = String(value.bads)
	}
}
