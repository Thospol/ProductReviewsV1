import XCTest
@testable import Productreview2

class Productreview2Tests: XCTestCase {
	
	override func setUp() {
		super.setUp()
		UserDefault.default.clearReviewProduct()
	}
	
	override func tearDown() {
		super.tearDown()
		UserDefault.default.clearReviewProduct()
	}
	
    func testExample() {
		var mock = [ReviewProduct].init()
		mock.append(ReviewProduct.init(RProductName: "Max", RProductImage: nil, RProductDesc: "NA", RIcon: ReviewRank.bad, RComment: "M", RName: "A", RDate: Date.init()))
		mock.append(ReviewProduct.init(RProductName: "Max", RProductImage: nil, RProductDesc: "NA", RIcon: ReviewRank.bad, RComment: "M", RName: "A", RDate: Date.init()))
		mock.append(ReviewProduct.init(RProductName: "Max", RProductImage: nil, RProductDesc: "NA", RIcon: ReviewRank.bad, RComment: "M", RName: "A", RDate: Date.init()))
		mock.append(ReviewProduct.init(RProductName: "Max", RProductImage: nil, RProductDesc: "NA", RIcon: ReviewRank.bad, RComment: "M", RName: "A", RDate: Date.init()))
		mock.append(ReviewProduct.init(RProductName: "Max", RProductImage: nil, RProductDesc: "NA", RIcon: ReviewRank.bad, RComment: "M", RName: "A", RDate: Date.init()))
		mock.append(ReviewProduct.init(RProductName: "Max", RProductImage: nil, RProductDesc: "NA", RIcon: ReviewRank.bad, RComment: "M", RName: "A", RDate: Date.init()))
		mock.append(ReviewProduct.init(RProductName: "Max", RProductImage: nil, RProductDesc: "NA", RIcon: ReviewRank.bad, RComment: "M", RName: "A", RDate: Date.init()))
		mock.append(ReviewProduct.init(RProductName: "Max", RProductImage: nil, RProductDesc: "NA", RIcon: ReviewRank.bad, RComment: "M", RName: "A", RDate: Date.init()))
		UserDefault.default.setReview(reviewProducts: mock)
		UserDefault.default.getReviewProducts().forEach { (object) in
			print(object)
		}
		XCTAssertNotNil(UserDefault.default.getReviewProducts())
		
    }
	
}
