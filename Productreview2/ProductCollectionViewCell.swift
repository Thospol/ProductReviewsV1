//
//  ProductCollectionViewCell.swift
//  Productreview2
//
//  Created by thospol on 30/6/61.
//  Copyright © พ.ศ. 2561 thospol. All rights reserved.
//

import UIKit

class ProductCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var addlabel: UILabel!
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var productPrice: UILabel!
	
    @IBOutlet weak var productReview: UILabel!
	
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
		productImage.image = value.photo
		productName.text = value.product
		productReview.text = value.desc 
		productPrice.text = String(value.price)
		productReview.text = String(value.reviewProduct.count)
	}
}

