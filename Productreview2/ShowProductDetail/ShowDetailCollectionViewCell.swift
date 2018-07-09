//
//  ShowDetailCollectionViewCell.swift
//  Productreview2
//
//  Created by thospol on 4/7/61.
//  Copyright © พ.ศ. 2561 thospol. All rights reserved.
//

import UIKit

class ShowDetailCollectionViewCell: UICollectionViewCell {
	@IBOutlet weak var nameProviderReview: UILabel!
	@IBOutlet weak var dateReviewLabel: UILabel!
	//@IBOutlet weak var rankReviewLabel: UILabel!
	@IBOutlet weak var buttonReview: UIButton!
	@IBOutlet weak var textviewReview: UILabel!
	
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
		nameProviderReview.text = value.reviewName
		dateReviewLabel.text = value.viewDate
		textviewReview.numberOfLines = 4
		textviewReview.text = value.reviewComment
		//rankReviewLabel.text =  value.RIcon?.rawValue
	buttonReview.setBackgroundImage(value.colorButton, for: .normal)
	}
}
