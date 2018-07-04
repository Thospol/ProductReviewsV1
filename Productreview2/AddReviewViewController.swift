//
//  AddReviewViewController.swift
//  Productreview2
//
//  Created by thospol on 2/7/61.
//  Copyright © พ.ศ. 2561 thospol. All rights reserved.
//

import UIKit

class AddReviewViewController: UIViewController {
	@IBOutlet weak var productName: UITextField!
	@IBOutlet weak var productImage: UIImageView!
	@IBOutlet weak var productDesc: UITextView!
	@IBOutlet weak var colorGreen: UIButton!
	@IBOutlet weak var colorYellow: UIButton!
	@IBOutlet weak var colorRed: UIButton!
	@IBOutlet weak var peoductReviewDesc: UITextView!
	@IBOutlet weak var nameReview: UITextField!
	@IBOutlet weak var reviewButton: UIButton!
	var dataProduct : Product?
	var indexpathProduct: IndexPath?
	var Rank: ReviewRank? = ReviewRank.veryGood
	var color: UIColor?
	var countCheckClick: Int = 0
	
	
    override func viewDidLoad() {
        super.viewDidLoad()
		if let product = dataProduct {
			navigationItem.title = product.product 
			productName.text   = product.product
			productImage.image = product.photo
			productDesc.text = product.desc
		}
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
			let colorset = color
			
			let review = ReviewProduct(RProductName: productname, RProductImage: photos, RProductDesc: productDesccription, RIcon: ranking, RComment: reviewDesc, RName: nameReviews, RDate: Date(), colorButton: colorset)
			
			let row = indexpathProduct?.row ?? 0
			UserModel.product[row].reviewProduct.append(review)
			
			
		}
	}
	
	//REMARK:-Icon
	@IBAction func ClickIconGreen(_ sender: Any) {
		if countCheckClick == 0 {
		colorRed.alpha = 0
		colorYellow.alpha = 0
			countCheckClick = 1
		}else if countCheckClick == 1 {
			colorRed.alpha = 1
			colorYellow.alpha = 1
			countCheckClick = 0
		}
		Rank = ReviewRank.veryGood
		color = UIColor.green
		print("VeryGood")
		
	}
	@IBAction func ClickIconYellow(_ sender: Any) {
		if countCheckClick == 0 {
			colorGreen.alpha = 0
			colorRed.alpha = 0
			countCheckClick = 1
		}else if countCheckClick == 1 {
			colorGreen.alpha = 1
			colorRed.alpha = 1
			countCheckClick = 0
		}
		Rank = ReviewRank.good
		color = UIColor.yellow
		print("Good")
	}
	@IBAction func ClickIconRed(_ sender: Any) {
		if countCheckClick == 0 {
			colorGreen.alpha = 0
			colorYellow.alpha = 0
			countCheckClick = 1
		}else if countCheckClick == 1 {
			colorGreen.alpha = 1
			colorYellow.alpha = 1
			countCheckClick = 0
		}
		Rank = ReviewRank.bad
		color = UIColor.red
		print("Bad")
	}
	
	


}
