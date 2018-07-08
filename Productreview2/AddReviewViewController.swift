//
//  AddReviewViewController.swift
//  Productreview2
//
//  Created by thospol on 2/7/61.
//  Copyright © พ.ศ. 2561 thospol. All rights reserved.
//

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
	
	var dataProduct : Product?
	var indexpathProduct: IndexPath?
	var Rank: ReviewRank? = ReviewRank.veryGood
	var imageSet: UIImage?
	var countCheckClick: Int = 0
	
	
    override func viewDidLoad() {
        super.viewDidLoad()
		imageSet = UIImage(named: "verygood")
		productDesc.numberOfLines = 5
		if let product = dataProduct {
			productName.text   = product.product
			productImage.image = product.photo
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
			let photos = productImage.image
			let productname = productName.text ?? ""
			let productDesccription = productDesc.text ?? ""
			let ranking = Rank
			let reviewDesc = peoductReviewDesc.text ?? ""
			let nameReviews = nameReview.text ?? ""
			let colorset = imageSet
			
			let review = ReviewProduct(RProductName: productname, RProductImage: photos, RProductDesc: productDesccription, RIcon: ranking, RComment: reviewDesc, RName: nameReviews, RDate: Date(), colorButton: colorset)
			
			let row = indexpathProduct?.row ?? 0
			UserModel.product[row].reviewProduct.append(review)
			
			
		}
	}
	
	//REMARK:-Icon
	@IBAction func ClickIconGreen(_ sender: Any) {
		if countCheckClick == 0 {
			ChageReviewGreenTrue()
		}else if countCheckClick == 1{
			ChangeReviewGreenFalse()
		}
		Rank = ReviewRank.veryGood
		imageSet = UIImage(named: "verygood")
		print("VeryGood")
		
	}
	@IBAction func ClickIconYellow(_ sender: Any) {
		if countCheckClick == 0 {
			ChageReviewYellowTrue()
		}else if countCheckClick == 1 {
			ChangeReviewYellowFalse()
		}
		Rank = ReviewRank.good
		imageSet = UIImage(named: "good")
		print("Good")
	}
	@IBAction func ClickIconRed(_ sender: Any) {
		if countCheckClick == 0 {
			ChageReviewRedTrue()
		}else if countCheckClick == 1 {
			ChangeReviewRedFalse()
		}
		Rank = ReviewRank.bad
		imageSet = UIImage(named: "bad")
		print("Bad")
	}
	
	
	
	


}
