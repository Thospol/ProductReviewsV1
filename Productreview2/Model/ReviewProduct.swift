import UIKit
class ReviewProduct {
	var rProductName: String
	var reviewProductImage: UIImage?
	var reviewProductDesc: String
	var reviewIcon: ReviewRank?
	var reviewComment: String
	var reviewName: String
	var reviewDate: Date?
	var colorButton: UIImage?
	
	init(RProductName: String, RProductImage: UIImage?, RProductDesc: String,RIcon: ReviewRank?,RComment: String,RName: String,RDate: Date,colorButton:UIImage?) {
		self.rProductName = RProductName
		self.reviewProductImage = RProductImage
		self.reviewProductDesc = RProductDesc
		self.reviewIcon = RIcon
		self.reviewComment = RComment
		self.reviewName = RName
		self.reviewDate = RDate
		self.colorButton = colorButton
	}
	var viewDate: String {
		let formatter = DateFormatter()
		formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
		let myString = formatter.string(from: reviewDate!)
		let yourDate = formatter.date(from: myString)!
		formatter.dateFormat = "dd-MMM-yyyy"
		return formatter.string(from: yourDate)
	}
}
enum ReviewRank:String {
	case like = "ดีมาก"
	case fair = "ปกติ"
	case bad = "แย่"
}
