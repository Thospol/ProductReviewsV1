import UIKit

class ReviewViewController: UICollectionViewController {
	private let reuseIdentifier = "cellReview"
	
	var productFromProduct: Product?
	var checkNameProduct: String?
	var indexpathProduct: IndexPath?
	
    override func viewDidLoad() {
        super.viewDidLoad()
    }
	
	override func viewDidAppear(_ animated: Bool) {
		super.viewDidAppear(animated)
		collectionView?.reloadData()
	}

    // MARK: UICollectionViewDataSource
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return productFromProduct?.reviewProduct.count ?? 0
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath as IndexPath) as! ReviewCollectionViewCell
		let reviewProduct = productFromProduct?.reviewProduct ?? []
		let product = reviewProduct[indexPath.row]
		cell.configureWith(value: product)
        return cell
    }
	
	@IBAction func AddReview(_ sender: Any) {
		performSegue(withIdentifier: "AddReview", sender: nil)
	}
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		super.prepare(for: segue, sender: sender)
		if let viewController = segue.destination as? AddReviewViewController{
			if let data = productFromProduct {
				viewController.dataProduct = data
				viewController.indexpathProduct = indexpathProduct
				print("Data is:\(data)")
				print("Index path is:\(viewController.indexpathProduct!)")
			}
		}
		
	}
	@IBAction func unwindToReviewProductList(sender: UIStoryboardSegue) {
	}
}
