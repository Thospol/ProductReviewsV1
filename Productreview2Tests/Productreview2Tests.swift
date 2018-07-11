import XCTest
@testable import Productreview2

class Productreview2Tests: XCTestCase {
	
	override func setUp() {
		super.setUp()
		Store.default.clear()
	}
	
	override func tearDown() {
		super.tearDown()
		Store.default.clear()
	}
	
    func testExample() {
		var mockProduct = Product.init(product: "ASD", photo: UIImage.init(), desc: "ASD", price: 12)
		Store.default.save(by: mockProduct)
		let review = ReviewProduct.init(reviewIcon: ReviewRank.bad, reviewComment: "AS", reviewName: "DSA", reviewDate: Date.init(), colorButton: UIImage.init())
		Store.default.saveReview(by: review, index: 0)
		let list = Store.default.get()
		debugPrint(list)
    }
	
}
