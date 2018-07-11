import UIKit

class AddReviewViewController: UIViewController {
	@IBOutlet weak var productName: UILabel!
	@IBOutlet weak var productImage: UIImageView!
	@IBOutlet weak var prodcutPrice: UILabel!
	@IBOutlet weak var productDesc: UILabel!
	@IBOutlet weak var colorGreen: UIButton!
	@IBOutlet weak var colorYellow: UIButton!
	@IBOutlet weak var colorRed: UIButton!
	@IBOutlet weak var peoductReviewDesc: UITextView!
	@IBOutlet weak var nameReview: UITextView!
	@IBOutlet weak var reviewButton: UIButton!
	var dataProduct : Product!
	var indexpathProduct: IndexPath?
	var Rank: ReviewRank? = ReviewRank.like
	var imageSet: UIImage?
	var countCheckClick: Int = 0
	
	override func viewDidLoad() {
		super.viewDidLoad()
	}

	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		dataProduct = Store.default.get()[indexpathProduct!.row - 1]
	}
	
	override func viewDidAppear(_ animated: Bool) {
		super.viewDidAppear(animated)
		imageSet = UIImage(named: "verygood")
		productDesc.numberOfLines = 5
		if let product = dataProduct {
			productName.text   = product.product
			productImage.image = product.productConvertToImage
			productDesc.text = product.desc
			prodcutPrice.text = "\(String(product.price)) ฿"
		}
	}
	
	func ChageReviewGreenTrue(){
		colorYellow.isEnabled = false
		colorRed.isEnabled = false
		colorYellow.frame.size.height = 28
		colorYellow.frame.size.width = 24
		colorRed.frame.size.height = 28
		colorRed.frame.size.width = 24
		colorYellow.frame.origin.x = 163
		colorYellow.frame.origin.y = 571
		colorRed.frame.origin.x = 229
		colorRed.frame.origin.y = 571
		countCheckClick = 1
	}
	func ChangeReviewGreenFalse(){
		colorYellow.isEnabled = true
		colorRed.isEnabled = true
		colorYellow.frame.size.height = 44
		colorYellow.frame.size.width = 44
		colorRed.frame.size.height = 44
		colorRed.frame.size.width = 44
		colorYellow.frame.origin.x = 163
		colorYellow.frame.origin.y = 563
		colorRed.frame.origin.x = 229
		colorRed.frame.origin.y = 563
		countCheckClick = 0
	}
	
	func ChageReviewYellowTrue(){
		colorGreen.isEnabled = false
		colorRed.isEnabled = false
		colorGreen.frame.size.height = 28
		colorGreen.frame.size.width = 24
		colorRed.frame.size.height = 28
		colorRed.frame.size.width = 24
		colorGreen.frame.origin.x = 98
		colorGreen.frame.origin.y = 571
		colorRed.frame.origin.x = 245
		colorRed.frame.origin.y = 571
		countCheckClick = 1
	}
	func ChangeReviewYellowFalse(){
		colorGreen.isEnabled = true
		colorRed.isEnabled = true
		colorGreen.frame.size.height = 44
		colorGreen.frame.size.width = 44
		colorRed.frame.size.height = 44
		colorRed.frame.size.width = 44
		colorGreen.frame.origin.x = 98
		colorGreen.frame.origin.y = 563
		colorRed.frame.origin.x = 229
		colorRed.frame.origin.y = 563
		countCheckClick = 0
	}
	
	func ChageReviewRedTrue(){
		colorGreen.isEnabled = false
		colorYellow.isEnabled = false
		colorGreen.frame.size.height = 28
		colorGreen.frame.size.width = 24
		colorYellow.frame.size.height = 28
		colorYellow.frame.size.width = 24
		colorGreen.frame.origin.x = 98
		colorGreen.frame.origin.y = 571
		colorYellow.frame.origin.x = 163
		colorYellow.frame.origin.y = 571
		countCheckClick = 1
	}
	func ChangeReviewRedFalse(){
		colorGreen.isEnabled = true
		colorYellow.isEnabled = true
		colorGreen.frame.size.height = 44
		colorGreen.frame.size.width = 44
		colorYellow.frame.size.height = 44
		colorYellow.frame.size.width = 44
		colorGreen.frame.origin.x = 98
		colorGreen.frame.origin.y = 563
		colorYellow.frame.origin.x = 163
		colorYellow.frame.origin.y = 563
		countCheckClick = 0
	}
	
	//REMARK:- Segua
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if reviewButton === sender as! UIButton {
			let ranking = Rank
			let reviewDesc = peoductReviewDesc.text ?? ""
			let nameReviews = nameReview.text ?? ""
			let colorset = imageSet
			let review = ReviewProduct(reviewIcon: ranking, reviewComment: reviewDesc, reviewName: nameReviews, reviewDate: Date(), colorButton: colorset)
			Store.default.saveReview(by: review, index: (indexpathProduct?.row)! - 1)
		}
	}
	
	//REMARK:-Icon
	@IBAction func ClickIconGreen(_ sender: Any) {
		if countCheckClick == 0 {
			ChageReviewGreenTrue()
		}else if countCheckClick == 1{
			ChangeReviewGreenFalse()
		}
		Rank = ReviewRank.like
		imageSet = UIImage(named: "verygood")
	}
	@IBAction func ClickIconYellow(_ sender: Any) {
		if countCheckClick == 0 {
			ChageReviewYellowTrue()
		}else if countCheckClick == 1 {
			ChangeReviewYellowFalse()
		}
		Rank = ReviewRank.fair
		imageSet = UIImage(named: "good")
	}
	@IBAction func ClickIconRed(_ sender: Any) {
		if countCheckClick == 0 {
			ChageReviewRedTrue()
		}else if countCheckClick == 1 {
			ChangeReviewRedFalse()
		}
		Rank = ReviewRank.bad
		imageSet = UIImage(named: "bad")
	}
	
	
	@IBAction func CancleAddReview(_ sender: Any) {
		let isPresentingInAddMealMode = presentingViewController is UINavigationController
		
		if isPresentingInAddMealMode {
			dismiss(animated: true, completion: nil)
		}
		else if let owningNavigationController = navigationController{
			owningNavigationController.popViewController(animated: true)
		}
		else {
			fatalError("unexpected")
		}
	}
	
	
	


}
