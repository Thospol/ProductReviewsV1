import UIKit

class ReviewProduct {
	var RProductName: String
	var RProductImage: UIImage?
	var RProductDesc: String
	var RIcon: ReviewRank?
	var RComment: String
	var RName: String
	var RDate: Date?
	var colorButton: UIColor?
	
	init(RProductName: String, RProductImage: UIImage?, RProductDesc: String,RIcon: ReviewRank?,RComment: String,RName: String,RDate: Date,colorButton:UIColor?) {
		self.RProductName = RProductName
		self.RProductImage = RProductImage
		self.RProductDesc = RProductDesc
		self.RIcon = RIcon
		self.RComment = RComment
		self.RName = RName
		self.RDate = RDate
		self.colorButton = colorButton
	}
	
	var viewDate: String {
		let formatter = DateFormatter()
		formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
		let myString = formatter.string(from: RDate!)
		let yourDate = formatter.date(from: myString)!
		formatter.dateFormat = "dd-MMM-yyyy"
		
		return formatter.string(from: yourDate)
	}
}

enum ReviewRank:String {
	case veryGood = "ดีมาก"
	case good = "ปกติ"
	case bad = "แย่"
	
}
